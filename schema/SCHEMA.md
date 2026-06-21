# WEC CISTEM — Real Schema (extracted from `WEBC 22Aug2025.mdb`)

The `.mdb` is an **Access front-end**: the core tables are **linked ODBC tables to a MSSQL
backend** (`*_remote` / `dbo_*`). Their data lives in SQL Server, not the `.mdb`. Column
schemas below come from the **local mirror tables** (`Archive_*`, `tmptbl_LoanAssessment_*`),
which match the live structures. The relationship graph is derived from **keys** (only one
formal relationship is stored in `MSysRelationships`: `dbo_ClientPhones.LocationID →
dbo_tbl_Locations.LocationID`).

## Live MSSQL (linked) table names → model tables (for the future swap)
| Model table | Linked source (`Type=4` in MSysObjects) | Mirror used for columns |
|---|---|---|
| Clients | `Clients_remote` | `Archive_Clients` (96 cols) |
| ClientPhones | `dbo_ClientPhones` | `Archive_Client_Phones` (5) |
| ClientServices | `Client_Services_remote` | `Archive_Client_Services` (30) |
| ContactTracking | `Contact_Tracking_Remote` | `Archive_Contact_Tracking` (13) |
| Loans | `Loans_remote` | `tmptbl_LoanAssessment_Loans_Data` (89) |
| SARI_Assessment | `SuccessAssessmentRecords_remote` | `Archive_SARI_Assessment` (10) |
| SARI_Financials | (SARI financials) | `Archive_SARI_Financials` (10) |
| FSReceived | (FS received) | `Archive_FSReceived` (13) |
| FSRemittance | (FS remittance) | `Archive_FSRemittance` (6) |
| PersonalProfiles | (loan personal profiles) | `tmptbl_LoanAssessment_PersonalProfiles_Data` (23) |
| Shareholders | (loan shareholders) | `tmptbl_LoanAssessment_Shareholders_Data` (7) |
| LoanSecurity | (loan security) | `tmptbl_LoanAssessment_LoanSecurity` (11) |
| Impact | (impact survey) | `Archive_Impact` (51) |
| MentorMatches | (mentor matches) | `tbl_MentorMatches` (14) |
| MenteeMatches | (mentee matches) | `tbl_MenteeMatches` (14) |
| Training | `Training_remote` / `Training_Topics_remote` | `xxtbl_TrainingAndGuides` (25) |
| TrainingReg | (training registration) | `tmpTrainingReg` (18) |
| Source (dim) | `Source` (local) | `Source` (3) |
| Referral (dim) | `Referral` (local) | `Referral` (4) |

(115 linked tables total incl. ~30 `Lookup_*` — full list in `linked_tables.txt`. We model the
core entities the 12 form tabs surface, not all 115.)

## Keys & relationships (derived) — star schema on `Clients`
- **Clients** PK `Primary_ID`
- ClientPhones.`ClientID` → Clients.Primary_ID (1:*)
- ClientServices.`SPrimary_ID` → Clients.Primary_ID (1:*)
- ContactTracking.`BPrimary__ID` → Clients.Primary_ID (1:*)
- Impact.`primaryid` → Clients.Primary_ID (1:*)
- SARI_Assessment.`Primary_ID` → Clients.Primary_ID (1:*)
- SARI_Financials.`Primary_ID` → Clients.Primary_ID (1:*)
- Loans.`LPrimary_ID` → Clients.Primary_ID (1:*); Loans PK `Loan_ID`
- FSReceived.`LPrimaryID` → Clients.Primary_ID (1:*)
- FSRemittance.`LPrimaryID` → Clients.Primary_ID (1:*)
- PersonalProfiles.`Primary_ID` → Clients; `.Loan_ID` → Loans.Loan_ID
- Shareholders.`Primary_ID` → Clients; `.Loan_ID` → Loans.Loan_ID
- MentorMatches.`ClientID` / MenteeMatches.`ClientID` → Clients.Primary_ID (1:*)
- TrainingReg.`ClientID` → Clients.Primary_ID; `.TrainingID` → Training.TrainingID
- Clients.`SourceID` → Source.SID; Clients.`ReferralID` → Referral.ID; Referral.`SID` → Source.SID

## Form tab → model table(s)
| Access tab | Tables surfaced |
|---|---|
| (Header band) | Clients (name, flags, demographics, status) |
| Classic | Clients (address, contacts, biz summary, referral), ClientPhones |
| Biz Info | Clients (business details, metrics/financing), ClientPhones, SARI_Assessment |
| Client Services | ClientServices (incl. Ref* / Info* / growth-cluster flags) |
| Contact Tracking | ContactTracking |
| Personal Profiles | PersonalProfiles, Clients (personal fields), Shareholders |
| Loan Services | Loans, LoanSecurity, FSReceived, FSRemittance |
| Training/Guide Purchases | TrainingReg, Training, (Guides) |
| Client Activity | (profiled-in / volunteer / training summaries — derived) |
| Impact Survey | Impact |
| Notes | Clients.Notes / ClientServices.Notes |
| Mentxx | MentorMatches, MenteeMatches |
| Ian | Clients (header summary repeat) |

## Key column highlights (for cards/groupings)
- **Clients header/flags:** Salutation, First, Last, Company, Partner, Principal_Language,
  File_Location, Client, Inactive_Record, Business_Closed, WESBCInitiated, Newsletter_Recipient;
  demographics: Aboriginal, Visible_Minority, Youth, Disabled, Employed, Social_Assistance,
  EI_Recipient; Age, Programs, Business_Status, Source/Referral.
- **Clients biz:** Business_Structure, Business_Sector, Business_Start_Date, Number_ofEmployees,
  Jobs_Created, Jobs_Maintained, Annual_Revenue, Industry, Home_Based, Franchise, Import_Export,
  Distributor_Agent, Manufacturing/Retail/Service/Professional.
- **Loans (89):** Loan_Number, Loan_Amount_Approved, purpose flags+amounts (WorkingCapital/
  Equipment/Leaseholds/Inventory/BusinessPurchase/Other), PrimeRate(+Plus), LoanTerm,
  PaymentAmount, FirstPmtDue, Disbursal1/2/3 amounts, AdminFee, security `*_reqd` flags,
  WDPA growth-cluster flags, exception flags, leverage amounts.
- **Impact (51):** SurveyDate, IsRunning, Revenue, Months, skill levels Cur/Inc/Trng for
  Gen/IT/Fin/HR/Mktg, satisfaction ratings (CustService/Quality/MeetingNeeds/Accessible/Reliable).
- **ContactTracking (13):** Date_In, Date__Reviewed, Date_To_Analyst, Date_Client_Contact (→
  role-playing dates), Staff_Contact, Contact_Type, Report_Type, Final_Status, Status_Date.
