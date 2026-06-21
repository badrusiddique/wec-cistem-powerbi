-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

-- That file uses encoding UTF-8

CREATE TABLE [_tmptbl updates for CF, Bank, Other]
 (
	[LoanID]			Long Integer, 
	[LeveragedCF]			Currency, 
	[LeveragedBANK]			Currency, 
	[LeveragedOTHER]			Currency, 
	[Leverage_note]			Text (255), 
	[CF_Funds]			Text (255), 
	[Bank_Funds]			Text (255), 
	[Other_Funds]			Text (255), 
	[NewNote]			Text (255), 
	[NewOther]			Currency
);

CREATE TABLE [_tmptbl_EMWE_ Biz_Svc_Stats]
 (
	[Primary_ID]			Long Integer, 
	[Clients_remote_Date]			DateTime, 
	[Aboriginal]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[AgeUnder30]			Boolean NOT NULL, 
	[Business_Status]			Text (100), 
	[EMWERural]			Text (255), 
	[Client_Services_Remote_Date]			DateTime, 
	[RefExNav]			Boolean NOT NULL, 
	[SM_Ref2ExportExpert]			Boolean NOT NULL, 
	[IG_Export]			Boolean NOT NULL, 
	[Ref2_SD]			Boolean NOT NULL, 
	[IG_SD]			Boolean NOT NULL, 
	[Exp]			Boolean NOT NULL, 
	[SD]			Boolean NOT NULL
);

CREATE TABLE [_tmptbl_EMWE_ Mentxx_Stats]
 (
	[Primary_ID]			Long Integer, 
	[Last]			Text (50), 
	[First]			Text (50), 
	[Clients_Remote_Date]			DateTime, 
	[Aboriginal]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[AgeUnder30]			Boolean NOT NULL, 
	[Business_Status]			Text (100), 
	[EMWERural]			Text (255), 
	[Status]			Text (50), 
	[MentorOrMentee]			Text (10), 
	[AcceptedDate]			DateTime, 
	[Business_Start_Date]			DateTime, 
	[BusPhase]			Text (75)
);

CREATE TABLE [_tmptbl_Existing_vs_Startup (1)]
 (
	[clientid]			Long Integer, 
	[source]			Text (50), 
	[service date]			DateTime, 
	[status]			Text (50)
);

CREATE TABLE [_tmptbl_ImmigrantsServed (6)]
 (
	[clientID]			Long Integer, 
	[source]			Text (50), 
	[region]			Text (50)
);

CREATE TABLE [_tmptbl_MBD Van 2018 - to import in WEC db_2018_11_19]
 (
	[First Name]			Text (255), 
	[Last Name]			Text (255), 
	[Email]			Text (255), 
	[Company Name]			Text (255), 
	[City]			Text (255)
);

CREATE TABLE [_tmptbl_MinoritiesServed (7)]
 (
	[clientID]			Long Integer, 
	[source]			Text (50), 
	[region]			Text (50)
);

CREATE TABLE [_tmptbl_OrgInteractionsForChaunda]
 (
	[Organization]			Text (100), 
	[OrgType]			Long Integer, 
	[OrgTypeDescription]			Text (50), 
	[City]			Text (50), 
	[lRegion]			Text (255), 
	[lLocation]			Text (255), 
	[FirstName]			Text (50), 
	[LastName]			Text (50), 
	[Title]			Text (50), 
	[EMail]			Text (50), 
	[eblast]			Boolean NOT NULL, 
	[enews]			Boolean NOT NULL
);

CREATE TABLE [_tmptbl_OrgPartnershipsForChaunda]
 (
	[Organization]			Text (100), 
	[OrgType]			Long Integer, 
	[OrgTypeDescription]			Text (50), 
	[City]			Text (50), 
	[lRegion]			Text (255), 
	[lLocation]			Text (255), 
	[FirstName]			Text (50), 
	[LastName]			Text (50), 
	[Title]			Text (50), 
	[EMail]			Text (50), 
	[eblast]			Boolean NOT NULL, 
	[enews]			Boolean NOT NULL
);

CREATE TABLE [_tmptbl_RRRF_LoanAppsAppr_ClientDemographics]
 (
	[Primary_ID]			Long Integer, 
	[Name]			Text (100), 
	[DisbursalFirstDate]			DateTime, 
	[Loan_Amount_Approved]			Currency, 
	[VisibleMinority]			Boolean NOT NULL, 
	[NewCanadian]			Boolean NOT NULL, 
	[LGBTQ2Plus]			Boolean NOT NULL, 
	[Francophone]			Boolean NOT NULL, 
	[AgeUnder30]			Boolean NOT NULL, 
	[Aboriginal]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[Jobs_Created]			Double, 
	[Jobs_Maintained]			Double, 
	[Jobs_Expanded]			Double, 
	[Rural]			Text (255), 
	[TourismOperator]			Boolean NOT NULL
);

CREATE TABLE [_tmptbl_RRRF_LoanAppsRecd_ClientDemographics]
 (
	[Primary_ID]			Long Integer, 
	[Name]			Text (100), 
	[Date in]			DateTime, 
	[LoanAmount]			Currency, 
	[VisibleMinority]			Boolean NOT NULL, 
	[NewCanadian]			Boolean NOT NULL, 
	[LGBTQ2Plus]			Boolean NOT NULL, 
	[Francophone]			Boolean NOT NULL, 
	[AgeUnder30]			Boolean NOT NULL, 
	[Aboriginal]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[Jobs_Created]			Double, 
	[Jobs_Maintained]			Double, 
	[Jobs_Expanded]			Double, 
	[Rural]			Text (255), 
	[TourismOperator]			Boolean NOT NULL
);

CREATE TABLE [_tmptbl_TradeClients]
 (
	[Date]			DateTime, 
	[SPrimary_ID]			Long Integer
);

CREATE TABLE [_tmptbl_Unique_Existing_Clients]
 (
	[clientid]			Long Integer, 
	[source]			Text (50), 
	[service date]			DateTime, 
	[status]			Text (50)
);

CREATE TABLE [_tmptbl_VanCity_Clients_Unique]
 (
	[Primary_ID]			Long Integer
);

CREATE TABLE [Archive_Client_Phones]
 (
	[PhoneID]			Long Integer, 
	[ClientID]			Long Integer, 
	[PhoneNum]			Text (10), 
	[PhoneDesc]			Long Integer, 
	[PhoneNotes]			Memo/Hyperlink (255)
);

CREATE TABLE [Archive_Client_Services]
 (
	[Date]			DateTime, 
	[Service_ID]			Long Integer, 
	[SPrimary_ID]			Long Integer, 
	[Staff_ID]			Text (50), 
	[WESBC_Department]			Text (20), 
	[Info_Given]			Text (100), 
	[Notes]			Memo/Hyperlink (255), 
	[Total_Time_Required]			Long Integer, 
	[Contact_Type]			Text (50), 
	[RefWD]			Boolean NOT NULL, 
	[RefCFDC]			Boolean NOT NULL, 
	[RefChamber]			Boolean NOT NULL, 
	[RefBusinessNetwork]			Boolean NOT NULL, 
	[RefCBCBSC]			Boolean NOT NULL, 
	[RefFEDO]			Boolean NOT NULL, 
	[RefFinancial]			Boolean NOT NULL, 
	[RefVanCity]			Boolean NOT NULL, 
	[RefAdvisor]			Boolean NOT NULL, 
	[RefOther]			Boolean NOT NULL, 
	[InfoBusinessKel]			Boolean NOT NULL, 
	[InfoBusinessVan]			Boolean NOT NULL, 
	[InfoWESPromoKel]			Boolean NOT NULL, 
	[InfoWESPromoVan]			Boolean NOT NULL, 
	[InfoWDMaterial]			Boolean NOT NULL, 
	[InfoWESBCInitiated]			Boolean NOT NULL, 
	[Financing]			Boolean NOT NULL, 
	[Other]			Boolean NOT NULL, 
	[AmntLeveragedNote]			Text (50), 
	[upsize_ts]			Binary, 
	[Amount_Leveraged]			Currency
);

CREATE TABLE [Archive_Contact_Tracking]
 (
	[Record_Id]			Long Integer, 
	[BPrimary__ID]			Long Integer, 
	[Date_In]			DateTime, 
	[Date__Reviewed]			DateTime, 
	[Date_To_Analyst]			DateTime, 
	[Date_Client_Contact]			DateTime, 
	[Staff_Contact]			Text (50), 
	[Application_Fee_Received]			Boolean NOT NULL, 
	[Contact_Type]			Text (50), 
	[Report_Type]			Text (100), 
	[Assessment_Hours]			Text (50), 
	[Final_Status]			Text (255), 
	[Status_Date]			DateTime
);

CREATE TABLE [Archive_FSReceived]
 (
	[FSRecID]			Long Integer, 
	[LPrimaryID]			Long Integer, 
	[IncStmt]			Boolean NOT NULL, 
	[BalSht]			Boolean NOT NULL, 
	[CashFlow]			Boolean NOT NULL, 
	[IncTaxRet]			Boolean NOT NULL, 
	[YrEnd]			Boolean NOT NULL, 
	[ForPeriodOf]			DateTime, 
	[DateReceived]			DateTime, 
	[DateToAnalyst]			DateTime, 
	[Staff]			Long Integer, 
	[DateReviewed]			DateTime, 
	[Notes]			Memo/Hyperlink (255)
);

CREATE TABLE [Archive_FSRemittance]
 (
	[FSRemitID]			Long Integer, 
	[LPrimaryID]			Long Integer, 
	[Frequency]			Text (10), 
	[DateOfChange]			DateTime, 
	[Notes]			Memo/Hyperlink (255), 
	[CFrequency]			Text (10)
);

CREATE TABLE [Archive_Impact]
 (
	[ID]			Long Integer, 
	[primaryid]			Long Integer, 
	[SurveyDate]			DateTime, 
	[IsRunning]			Boolean NOT NULL, 
	[Reason]			Text (10), 
	[Date]			DateTime, 
	[Revenue]			Currency, 
	[Months]			Long Integer, 
	[Source]			Text (10), 
	[ProfitsAvailable]			Boolean NOT NULL, 
	[AsExpected]			Boolean NOT NULL, 
	[Employees]			Boolean NOT NULL, 
	[FullTime]			Long Integer, 
	[PartTime]			Long Integer, 
	[CurSkillGen]			Long Integer, 
	[CurSkillIT]			Long Integer, 
	[CurSkillFin]			Long Integer, 
	[CurSkillHR]			Long Integer, 
	[CurSkillMktg]			Long Integer, 
	[TrngPlannedGen]			Boolean NOT NULL, 
	[TrngPlannedIT]			Boolean NOT NULL, 
	[TrngPlannedFin]			Boolean NOT NULL, 
	[TrngPlannedHR]			Boolean NOT NULL, 
	[TrngPlannedMktg]			Boolean NOT NULL, 
	[TrngPlannedOther]			Text (10), 
	[IncSkillGen]			Boolean NOT NULL, 
	[IncSkillIT]			Boolean NOT NULL, 
	[IncSkillFin]			Boolean NOT NULL, 
	[IncSkillHR]			Boolean NOT NULL, 
	[IncSkillMktg]			Boolean NOT NULL, 
	[ContribProfAdv]			Boolean NOT NULL, 
	[ContribBusPeerInput]			Boolean NOT NULL, 
	[ContribExperience]			Boolean NOT NULL, 
	[ContribTraining]			Boolean NOT NULL, 
	[ContribOther]			Text (10), 
	[WeHelpedMgmtSkills]			Text (10), 
	[WeHelpedBusPerf]			Text (10), 
	[WeHelpedInnovation]			Text (10), 
	[TrainingSatisfaction]			Long Integer, 
	[ImplementTraining]			Boolean NOT NULL, 
	[CustService]			Long Integer, 
	[CustServiceNotes]			Memo/Hyperlink (255), 
	[QualityServices]			Long Integer, 
	[QualityServicesNotes]			Memo/Hyperlink (255), 
	[MeetingNeeds]			Long Integer, 
	[MeetingNeedsNotes]			Memo/Hyperlink (255), 
	[Accessible]			Long Integer, 
	[AccessibleNotes]			Memo/Hyperlink (255), 
	[Reliable]			Long Integer, 
	[ReliableNotes]			Memo/Hyperlink (255), 
	[HowToImprove]			Memo/Hyperlink (255)
);

CREATE TABLE [Archive_SARI_Assessment]
 (
	[ID]			Long Integer, 
	[Primary_ID]			Long Integer, 
	[RptDate]			DateTime, 
	[Industry]			Long Integer, 
	[MarketDemand]			Long Integer, 
	[MgmtAndCreditHistory]			Long Integer, 
	[Fin_Startup]			Long Integer, 
	[Fin_Exist]			Long Integer, 
	[AssessDate]			DateTime, 
	[Notes]			Memo/Hyperlink (255)
);

CREATE TABLE [Archive_SARI_Financials]
 (
	[ID]			Long Integer, 
	[Primary_ID]			Long Integer, 
	[RptDate]			DateTime, 
	[Revenue]			Currency, 
	[COGS]			Currency, 
	[Expenses]			Currency, 
	[Assets]			Currency, 
	[Liabilities]			Currency, 
	[AssessDate]			DateTime, 
	[Notes]			Memo/Hyperlink (255)
);

CREATE TABLE [Business_Sectors_backup]
 (
	[Business_Sector]			Text (80), 
	[Description_of_Sector]			Text (255), 
	[BSID]			Long Integer
);

CREATE TABLE [Business_Sectors_remote]
 (
	[Business_Sector]			Text (80), 
	[Description_of_Sector]			Text (255), 
	[BSID]			Long Integer, 
	[NAICSCode]			Long Integer
);

CREATE TABLE [cfdc cities and regions for Partners]
 (
	[City]			Text (50), 
	[Region]			Text (50), 
	[Location]			Text (50), 
	[Analyst]			Text (50), 
	[CFDC_WESBC]			Text (50), 
	[CFDCID]			Long Integer
);

CREATE TABLE [CFDC_Cities_and_Regions_Remote]
 (
	[City]			Text (50), 
	[Region]			Text (50), 
	[Location]			Text (50), 
	[Analyst]			Text (50), 
	[CFDC_WESBC]			Text (50), 
	[CFDCID]			Long Integer, 
	[CityStatus]			Text (50), 
	[EMWECityStatus]			Text (50)
);

CREATE TABLE [Class 1]
 (
	[Content-R]			Double, 
	[Quality]			Double, 
	[Applicable]			Double, 
	[trainingid]			Long Integer
);

CREATE TABLE [Class 2]
 (
	[Relevance]			Double, 
	[Quality]			Double, 
	[Applicable]			Double, 
	[TrainingID]			Long Integer
);

CREATE TABLE [Client_Services_Remote_ExportErrors]
 (
	[Error]			Text (255), 
	[Field]			Text (255), 
	[Row]			Long Integer
);

CREATE TABLE [Clients_backup 20101007]
 (
	[Primary_ID]			Long Integer, 
	[Date]			DateTime, 
	[DateModified]			DateTime, 
	[Flag]			Boolean NOT NULL, 
	[ImportFlag]			Boolean NOT NULL, 
	[ImportProcessedFlag]			Boolean NOT NULL, 
	[ImportedEntry]			Boolean NOT NULL, 
	[ClassRegName]			Text (255), 
	[Inactive_Record]			Boolean NOT NULL, 
	[Principal_Language]			Text (15), 
	[Newsletter_Recipient]			Boolean NOT NULL, 
	[eNewsLetter]			Boolean NOT NULL, 
	[SendPreference]			Long Integer, 
	[WESBCInitiated]			Boolean NOT NULL, 
	[No_Fax]			Boolean NOT NULL, 
	[ARECVD]			Boolean NOT NULL, 
	[Salutation]			Text (12), 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Partner]			Text (100), 
	[Partner_Phone_Number]			Text (100), 
	[Client]			Boolean NOT NULL, 
	[Address]			Text (255), 
	[City]			Text (50), 
	[Province]			Text (4), 
	[Postal_Code]			Text (10), 
	[Region]			Text (100), 
	[Counsellor_Assigned]			Text (25), 
	[Loan_Admin_Assigned]			Text (25), 
	[Location]			Text (100), 
	[Area_Code]			Text (3), 
	[Business_Phone]			Text (10), 
	[Fax]			Text (10), 
	[Email]			Text (100), 
	[AltEMail]			Text (100), 
	[Website]			Text (100), 
	[Source]			Text (40), 
	[SourceID]			Long Integer, 
	[Referral]			Text (255), 
	[ReferralID]			Long Integer, 
	[Name]			Text (50), 
	[Aboriginal]			Boolean NOT NULL, 
	[EthnicityType]			Text (50), 
	[Visible_Minority]			Boolean NOT NULL, 
	[Youth]			Boolean NOT NULL, 
	[Child_Senior]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[ImmigrantYears]			Long Integer, 
	[AgeUnder35]			Boolean NOT NULL, 
	[Age30To55]			Boolean NOT NULL, 
	[Age35To45]			Boolean NOT NULL, 
	[Age46To55]			Boolean NOT NULL, 
	[AgeOver55]			Boolean NOT NULL, 
	[EI_Recipient]			Boolean NOT NULL, 
	[Social_Assistance]			Boolean NOT NULL, 
	[Employed]			Boolean NOT NULL, 
	[Programs]			Text (20), 
	[Business_Status]			Text (100), 
	[Years_in_Business]			Integer, 
	[Business_Start_Date]			DateTime, 
	[Number_ofEmployees]			Integer, 
	[Jobs_Created]			Double, 
	[Jobs_Maintained]			Double, 
	[Business_Structure]			Text (50), 
	[Business_Sector]			Text (50), 
	[Business_Description]			Memo/Hyperlink (255), 
	[Commercial]			Long Integer, 
	[Industry]			Long Integer, 
	[Home_Based]			Long Integer, 
	[Wholesale]			Boolean NOT NULL, 
	[Retail]			Boolean NOT NULL, 
	[Manufacturing]			Boolean NOT NULL, 
	[Service]			Boolean NOT NULL, 
	[Professional]			Boolean NOT NULL, 
	[Primary_Industry]			Boolean NOT NULL, 
	[Distributor_Agent]			Boolean NOT NULL, 
	[Import_Export]			Boolean NOT NULL, 
	[Franchise]			Boolean NOT NULL, 
	[Age]			Long Integer, 
	[Date_of_Birth]			DateTime, 
	[Marital_Status]			Text (15), 
	[Dependants]			Long Integer, 
	[SIN]			Text (20), 
	[HAddress]			Text (50), 
	[HCity]			Text (25), 
	[HProv]			Text (10), 
	[HPC]			Text (10), 
	[Home_Phone]			Text (10), 
	[Entrepreneurial_Experience]			Boolean NOT NULL, 
	[Related_Experience]			Boolean NOT NULL, 
	[Background]			Text (255), 
	[Bankruptcy]			Boolean NOT NULL, 
	[Job]			Boolean NOT NULL, 
	[Mailing]			Long Integer, 
	[File_Location]			Text (50), 
	[Business_Closed]			Boolean NOT NULL, 
	[Education]			Text (255), 
	[Spouse_Name]			Text (100), 
	[SDOB]			Text (100), 
	[SSIN]			Text (100), 
	[Family_Contact]			Text (100), 
	[Family_Relationship]			Text (100), 
	[Family_Phone]			Text (100), 
	[Contact_Date]			DateTime, 
	[Annual_Revenue]			Long Integer, 
	[upsize_ts]			Binary, 
	[Notes]			Memo/Hyperlink (255), 
	[LookingForFinancing]			Text (50), 
	[LookingForAmount]			Currency, 
	[LookingForDate]			DateTime, 
	[BusinessPlanStatus]			Text (50), 
	[Storyteller]			Boolean NOT NULL, 
	[Mentor]			Boolean NOT NULL, 
	[BusinessAdvisoryRelease]			Boolean NOT NULL, 
	[PhotoBioRelease]			Boolean NOT NULL
);

CREATE TABLE [Clients_WebImportBackup]
 (
	[Primary_ID]			Long Integer, 
	[Date]			DateTime, 
	[DateModified]			DateTime, 
	[Flag]			Boolean NOT NULL, 
	[ImportFlag]			Boolean NOT NULL, 
	[ImportProcessedFlag]			Boolean NOT NULL, 
	[ClassRegName]			Text (255), 
	[Inactive_Record]			Boolean NOT NULL, 
	[Principal_Language]			Text (15), 
	[Newsletter_Recipient]			Boolean NOT NULL, 
	[eNewsLetter]			Boolean NOT NULL, 
	[WESBCInitiated]			Boolean NOT NULL, 
	[No_Fax]			Boolean NOT NULL, 
	[ARECVD]			Boolean NOT NULL, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Client]			Boolean NOT NULL, 
	[City]			Text (50), 
	[Province]			Text (4), 
	[Region]			Text (100), 
	[Location]			Text (100), 
	[Area_Code]			Text (3), 
	[Business_Phone]			Text (10), 
	[Email]			Text (100), 
	[Source]			Text (40), 
	[Aboriginal]			Boolean NOT NULL, 
	[Visible_Minority]			Boolean NOT NULL, 
	[Youth]			Boolean NOT NULL, 
	[Child_Senior]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[AgeUnder35]			Boolean NOT NULL, 
	[Age30To55]			Boolean NOT NULL, 
	[Age35To45]			Boolean NOT NULL, 
	[Age46To55]			Boolean NOT NULL, 
	[AgeOver55]			Boolean NOT NULL, 
	[EI_Recipient]			Boolean NOT NULL, 
	[Social_Assistance]			Boolean NOT NULL, 
	[Employed]			Boolean NOT NULL, 
	[Jobs_Created]			Double, 
	[Jobs_Maintained]			Double, 
	[Commercial]			Long Integer, 
	[Wholesale]			Boolean NOT NULL, 
	[Retail]			Boolean NOT NULL, 
	[Manufacturing]			Boolean NOT NULL, 
	[Service]			Boolean NOT NULL, 
	[Professional]			Boolean NOT NULL, 
	[Primary_Industry]			Boolean NOT NULL, 
	[Distributor_Agent]			Boolean NOT NULL, 
	[Import_Export]			Boolean NOT NULL, 
	[Franchise]			Boolean NOT NULL, 
	[Entrepreneurial_Experience]			Boolean NOT NULL, 
	[Related_Experience]			Boolean NOT NULL, 
	[Bankruptcy]			Boolean NOT NULL, 
	[Job]			Boolean NOT NULL, 
	[Mailing]			Long Integer, 
	[Business_Closed]			Boolean NOT NULL, 
	[Annual_Revenue]			Long Integer, 
	[Storyteller]			Boolean NOT NULL, 
	[Mentor]			Boolean NOT NULL, 
	[BusinessAdvisoryRelease]			Boolean NOT NULL, 
	[PhotoBioRelease]			Boolean NOT NULL
);

CREATE TABLE [Conversion Errors]
 (
	[Object Type]			Text (255), 
	[Object Name]			Text (255), 
	[Error Description]			Memo/Hyperlink (255)
);

CREATE TABLE [dbo_Lookup_Industry]
 (
	[IndID]			Long Integer, 
	[IndName]			Text (50), 
	[IndDesc]			Text (100)
);

CREATE TABLE [dbo_Lookup_PhDesc]
 (
	[DescID]			Long Integer, 
	[PhoneDesc]			Text (20)
);

CREATE TABLE [dbo_Lookup_SendPrefs]
 (
	[PrefsID]			Long Integer, 
	[PrefDesc]			Text (10)
);

CREATE TABLE ['Fall 2021 Outreach$'_ImportErrors]
 (
	[Error]			Text (255), 
	[Field]			Text (255), 
	[Row]			Long Integer
);

CREATE TABLE [Lookup_C3_CitiesOver50K_local]
 (
	[Province]			Text (255), 
	[City]			Text (255), 
	[RU]			Text (255), 
	[Population]			Double
);

CREATE TABLE [Lookup_C3_Industry_local]
 (
	[Business_Sector]			Text (80), 
	[Description_of_Sector]			Text (255), 
	[BSID]			Long Integer
);

CREATE TABLE [Lookup_Visible_Minority_local]
 (
	[TypeID]			Long Integer, 
	[TypeName]			Text (50), 
	[TypeDesc]			Text (100)
);

CREATE TABLE [masterlist_hb_us_clientemail_removed]
 (
	[Field1]			Text (67)
);

CREATE TABLE [masterlist_hb_us_main and alt email_removed]
 (
	[Field1]			Text (67)
);

CREATE TABLE [Masterlist_with_hb_and_us_removed]
 (
	[Field1]			Text (67)
);

CREATE TABLE [Paste Errors]
 (
	[Field0]			Memo/Hyperlink (255), 
	[Field1]			Memo/Hyperlink (255), 
	[Field2]			Memo/Hyperlink (255), 
	[Field3]			Memo/Hyperlink (255), 
	[Field4]			Memo/Hyperlink (255), 
	[Field5]			Memo/Hyperlink (255), 
	[Field6]			Memo/Hyperlink (255), 
	[Field7]			Memo/Hyperlink (255), 
	[Field8]			Memo/Hyperlink (255), 
	[Field9]			Memo/Hyperlink (255), 
	[Field10]			Memo/Hyperlink (255), 
	[Field11]			Memo/Hyperlink (255), 
	[Field12]			Memo/Hyperlink (255), 
	[Field13]			Memo/Hyperlink (255), 
	[Field14]			Memo/Hyperlink (255), 
	[Field15]			Memo/Hyperlink (255), 
	[Field16]			Memo/Hyperlink (255), 
	[Field17]			Memo/Hyperlink (255), 
	[Field18]			Memo/Hyperlink (255), 
	[Field19]			Memo/Hyperlink (255), 
	[Field20]			Memo/Hyperlink (255), 
	[Field21]			Memo/Hyperlink (255), 
	[Field22]			Memo/Hyperlink (255), 
	[Field23]			Memo/Hyperlink (255), 
	[Field24]			Memo/Hyperlink (255), 
	[Field25]			Memo/Hyperlink (255), 
	[Field26]			Memo/Hyperlink (255), 
	[Field27]			Memo/Hyperlink (255), 
	[Field28]			Memo/Hyperlink (255), 
	[Field29]			Memo/Hyperlink (255), 
	[Field30]			Memo/Hyperlink (255), 
	[Field31]			Memo/Hyperlink (255), 
	[Field32]			Memo/Hyperlink (255), 
	[Field33]			Memo/Hyperlink (255), 
	[Field34]			Memo/Hyperlink (255), 
	[Field35]			Memo/Hyperlink (255), 
	[Field36]			Memo/Hyperlink (255), 
	[Field37]			Memo/Hyperlink (255), 
	[Field38]			Memo/Hyperlink (255), 
	[Field39]			Memo/Hyperlink (255), 
	[Field40]			Memo/Hyperlink (255), 
	[Field41]			Memo/Hyperlink (255), 
	[Field42]			Memo/Hyperlink (255), 
	[Field43]			Memo/Hyperlink (255), 
	[Field44]			Memo/Hyperlink (255), 
	[Field45]			Memo/Hyperlink (255), 
	[Field46]			Memo/Hyperlink (255), 
	[Field47]			Memo/Hyperlink (255), 
	[Field48]			Memo/Hyperlink (255), 
	[Field49]			Memo/Hyperlink (255), 
	[Field50]			Memo/Hyperlink (255), 
	[Field51]			Memo/Hyperlink (255), 
	[Field52]			Memo/Hyperlink (255), 
	[Field53]			Memo/Hyperlink (255), 
	[Field54]			Memo/Hyperlink (255), 
	[Field55]			Memo/Hyperlink (255), 
	[Field56]			Memo/Hyperlink (255), 
	[Field57]			Memo/Hyperlink (255), 
	[Field58]			Memo/Hyperlink (255), 
	[Field59]			Memo/Hyperlink (255), 
	[Field60]			Memo/Hyperlink (255), 
	[Field61]			Memo/Hyperlink (255), 
	[Field62]			Memo/Hyperlink (255), 
	[Field63]			Memo/Hyperlink (255), 
	[Field64]			Memo/Hyperlink (255), 
	[Field65]			Memo/Hyperlink (255), 
	[Field66]			Memo/Hyperlink (255), 
	[Field67]			Memo/Hyperlink (255), 
	[Field68]			Memo/Hyperlink (255), 
	[Field69]			Memo/Hyperlink (255), 
	[Field70]			Memo/Hyperlink (255), 
	[Field71]			Memo/Hyperlink (255), 
	[Field72]			Memo/Hyperlink (255), 
	[Field73]			Memo/Hyperlink (255), 
	[Field74]			Memo/Hyperlink (255), 
	[Field75]			Memo/Hyperlink (255), 
	[Field76]			Memo/Hyperlink (255), 
	[Field77]			Memo/Hyperlink (255), 
	[Field78]			Memo/Hyperlink (255), 
	[Field79]			Memo/Hyperlink (255), 
	[Field80]			Memo/Hyperlink (255), 
	[Field81]			Memo/Hyperlink (255), 
	[Field82]			Memo/Hyperlink (255), 
	[Field83]			Memo/Hyperlink (255), 
	[Field84]			Memo/Hyperlink (255), 
	[Field85]			Memo/Hyperlink (255), 
	[Field86]			Memo/Hyperlink (255), 
	[Field87]			Memo/Hyperlink (255), 
	[Field88]			Memo/Hyperlink (255), 
	[Field89]			Memo/Hyperlink (255), 
	[Field90]			Memo/Hyperlink (255), 
	[Field91]			Memo/Hyperlink (255), 
	[Field92]			Memo/Hyperlink (255), 
	[Field93]			Memo/Hyperlink (255), 
	[Field94]			Memo/Hyperlink (255), 
	[Field95]			Memo/Hyperlink (255), 
	[Field96]			Memo/Hyperlink (255), 
	[Field97]			Memo/Hyperlink (255), 
	[Field98]			Memo/Hyperlink (255), 
	[Field99]			Memo/Hyperlink (255), 
	[Field100]			Memo/Hyperlink (255), 
	[Field101]			Memo/Hyperlink (255), 
	[Field102]			Memo/Hyperlink (255), 
	[Field103]			Memo/Hyperlink (255), 
	[Field104]			Memo/Hyperlink (255), 
	[Field105]			Memo/Hyperlink (255), 
	[Field106]			Memo/Hyperlink (255), 
	[Field107]			Memo/Hyperlink (255), 
	[Field108]			Memo/Hyperlink (255), 
	[Field109]			Memo/Hyperlink (255), 
	[Field110]			Memo/Hyperlink (255), 
	[Field111]			Memo/Hyperlink (255), 
	[Field112]			Memo/Hyperlink (255), 
	[Field113]			Memo/Hyperlink (255), 
	[Field114]			Memo/Hyperlink (255), 
	[Field115]			Memo/Hyperlink (255), 
	[Field116]			Memo/Hyperlink (255), 
	[Field117]			Memo/Hyperlink (255), 
	[Field118]			Memo/Hyperlink (255), 
	[Field119]			Memo/Hyperlink (255), 
	[Field120]			Memo/Hyperlink (255), 
	[Field121]			Memo/Hyperlink (255), 
	[Field122]			Memo/Hyperlink (255), 
	[Field123]			Memo/Hyperlink (255), 
	[Field124]			Memo/Hyperlink (255), 
	[Field125]			Memo/Hyperlink (255), 
	[Field126]			Memo/Hyperlink (255), 
	[Field127]			Memo/Hyperlink (255), 
	[Field128]			Memo/Hyperlink (255), 
	[Field129]			Memo/Hyperlink (255), 
	[Field130]			Memo/Hyperlink (255), 
	[Field131]			Memo/Hyperlink (255), 
	[Field132]			Memo/Hyperlink (255), 
	[Field133]			Memo/Hyperlink (255), 
	[Field134]			Memo/Hyperlink (255), 
	[Field135]			Memo/Hyperlink (255), 
	[Field136]			Memo/Hyperlink (255), 
	[Field137]			Memo/Hyperlink (255), 
	[Field138]			Memo/Hyperlink (255), 
	[Field139]			Memo/Hyperlink (255), 
	[Field140]			Memo/Hyperlink (255), 
	[Field141]			Memo/Hyperlink (255), 
	[Field142]			Memo/Hyperlink (255), 
	[Field143]			Memo/Hyperlink (255), 
	[Field144]			Memo/Hyperlink (255), 
	[Field145]			Memo/Hyperlink (255), 
	[Field146]			Memo/Hyperlink (255), 
	[Field147]			Memo/Hyperlink (255), 
	[Field148]			Memo/Hyperlink (255), 
	[Field149]			Memo/Hyperlink (255), 
	[Field150]			Memo/Hyperlink (255), 
	[Field151]			Memo/Hyperlink (255), 
	[Field152]			Memo/Hyperlink (255), 
	[Field153]			Memo/Hyperlink (255), 
	[Field154]			Memo/Hyperlink (255), 
	[Field155]			Memo/Hyperlink (255), 
	[Field156]			Memo/Hyperlink (255), 
	[Field157]			Memo/Hyperlink (255), 
	[Field158]			Memo/Hyperlink (255), 
	[Field159]			Memo/Hyperlink (255), 
	[Field160]			Memo/Hyperlink (255), 
	[Field161]			Memo/Hyperlink (255), 
	[Field162]			Memo/Hyperlink (255), 
	[Field163]			Memo/Hyperlink (255), 
	[Field164]			Memo/Hyperlink (255), 
	[Field165]			Memo/Hyperlink (255), 
	[Field166]			Memo/Hyperlink (255), 
	[Field167]			Memo/Hyperlink (255), 
	[Field168]			Memo/Hyperlink (255), 
	[Field169]			Memo/Hyperlink (255), 
	[Field170]			Memo/Hyperlink (255), 
	[Field171]			Memo/Hyperlink (255), 
	[Field172]			Memo/Hyperlink (255), 
	[Field173]			Memo/Hyperlink (255), 
	[Field174]			Memo/Hyperlink (255), 
	[Field175]			Memo/Hyperlink (255), 
	[Field176]			Memo/Hyperlink (255), 
	[Field177]			Memo/Hyperlink (255), 
	[Field178]			Memo/Hyperlink (255), 
	[Field179]			Memo/Hyperlink (255), 
	[Field180]			Memo/Hyperlink (255), 
	[Field181]			Memo/Hyperlink (255), 
	[Field182]			Memo/Hyperlink (255), 
	[Field183]			Memo/Hyperlink (255), 
	[Field184]			Memo/Hyperlink (255), 
	[Field185]			Memo/Hyperlink (255), 
	[Field186]			Memo/Hyperlink (255), 
	[Field187]			Memo/Hyperlink (255), 
	[Field188]			Memo/Hyperlink (255), 
	[Field189]			Memo/Hyperlink (255), 
	[Field190]			Memo/Hyperlink (255), 
	[Field191]			Memo/Hyperlink (255), 
	[Field192]			Memo/Hyperlink (255), 
	[Field193]			Memo/Hyperlink (255), 
	[Field194]			Memo/Hyperlink (255), 
	[Field195]			Memo/Hyperlink (255), 
	[Field196]			Memo/Hyperlink (255), 
	[Field197]			Memo/Hyperlink (255), 
	[Field198]			Memo/Hyperlink (255), 
	[Field199]			Memo/Hyperlink (255), 
	[Field200]			Memo/Hyperlink (255), 
	[Field201]			Memo/Hyperlink (255), 
	[Field202]			Memo/Hyperlink (255), 
	[Field203]			Memo/Hyperlink (255), 
	[Field204]			Memo/Hyperlink (255), 
	[Field205]			Memo/Hyperlink (255), 
	[Field206]			Memo/Hyperlink (255), 
	[Field207]			Memo/Hyperlink (255), 
	[Field208]			Memo/Hyperlink (255), 
	[Field209]			Memo/Hyperlink (255), 
	[Field210]			Memo/Hyperlink (255), 
	[Field211]			Memo/Hyperlink (255)
);

CREATE TABLE [qry_Jolene_StatsForRegressionAn$_ImportErrors]
 (
	[Error]			Text (255), 
	[Field]			Text (255), 
	[Row]			Long Integer
);

CREATE TABLE [Referral]
 (
	[ID]			Long Integer, 
	[SID]			Long Integer, 
	[Referral]			Text (50), 
	[Description]			Text (50)
);

CREATE TABLE [referral backup]
 (
	[ID]			Long Integer, 
	[SID]			Long Integer, 
	[Referral]			Text (50), 
	[Description]			Text (50)
);

CREATE TABLE [Sheet1]
 (
	[First name]			Text (255), 
	[Email Address]			Text (255)
);

CREATE TABLE [Sheet1$_ImportErrors]
 (
	[Error]			Text (255), 
	[Field]			Text (255), 
	[Row]			Long Integer
);

CREATE TABLE [SIDRID backup]
 (
	[Primary_ID]			Long Integer, 
	[SourceID]			Long Integer, 
	[ReferralID]			Long Integer
);

CREATE TABLE [Source]
 (
	[Source]			Text (50), 
	[Description]			Text (255), 
	[SID]			Long Integer
);

CREATE TABLE [source backup]
 (
	[Source]			Text (50), 
	[Description]			Text (255), 
	[SID]			Long Integer
);

CREATE TABLE [tbl_EMail_Export]
 (
	[FirstName]			Text (50), 
	[LastName]			Text (50), 
	[Company]			Text (255), 
	[E-mailAddress]			Text (100)
);

CREATE TABLE [tbl_EMail_Source]
 (
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Email]			Text (100)
);

CREATE TABLE [tbl_GuideCount]
 (
	[GuideName]			Text (100), 
	[CountOfGuideName]			Long Integer, 
	[SellingOffice]			Text (50)
);

CREATE TABLE [tbl_HardBounceContactList_DESCClientDateModified]
 (
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Email]			Text (100), 
	[Primary_ID]			Long Integer, 
	[DateModified]			DateTime, 
	[MaxOfDate]			DateTime, 
	[PhoneNum]			Text (10), 
	[PhoneDesc]			Text (20)
);

CREATE TABLE [tbl_HardBounceList]
 (
	[Email Address]			Text (255), 
	[First Name]			Text (255), 
	[Last Name]			Text (255)
);

CREATE TABLE [tbl_LoanClientInfo_Profiles]
 (
	[Primary_ID]			Long Integer, 
	[MentionStartDate]			DateTime, 
	[CTCategory]			Text (50), 
	[CommTypeDesc]			Text (50)
);

CREATE TABLE [tbl_MenteeMatches]
 (
	[Industry]			Long Integer, 
	[ClientID]			Long Integer, 
	[ActiveMentxx]			Boolean NOT NULL, 
	[challengeset]			Text (255), 
	[challenge1]			Text (255), 
	[challenge2]			Text (255), 
	[challenge3]			Text (255), 
	[Match]			Long Integer, 
	[MenteeCh1]			Long Integer, 
	[MenteeCh2]			Long Integer, 
	[MenteeCh3]			Long Integer, 
	[OneToOneRank]			Long Integer, 
	[PeerRank]			Long Integer, 
	[ForumRank]			Long Integer
);

CREATE TABLE [tbl_MentorMatches]
 (
	[Industry]			Long Integer, 
	[ClientID]			Long Integer, 
	[ActiveMentxx]			Boolean NOT NULL, 
	[skillset]			Text (255), 
	[skill1]			Text (255), 
	[skill2]			Text (255), 
	[skill3]			Text (255), 
	[Match]			Long Integer, 
	[MentorSt1]			Long Integer, 
	[MentorSt2]			Long Integer, 
	[MentorSt3]			Long Integer, 
	[OneToOneRank]			Long Integer, 
	[PeerRank]			Long Integer, 
	[ForumRank]			Long Integer
);

CREATE TABLE [tbl_PreviewLoanAppData_FieldMatching]
 (
	[Fieldname]			Text (255)
);

CREATE TABLE [tbl_PreviewLoanAppDataFromPDF]
 (
	[AppID]			Long Integer, 
	[ClientID]			Text (50), 
	[ProfileID]			Text (50), 
	[Last Name]			Text (50), 
	[First name]			Text (50), 
	[Middle Name]			Text (50), 
	[Social Insurance Number]			Text (50), 
	[birth day]			Text (50), 
	[birth month]			Text (50), 
	[birth year]			Text (50), 
	[of dependants]			Text (50), 
	[marital status]			Text (50), 
	[citizenship]			Text (50), 
	[how did you find out about our lending program]			Text (255), 
	[aboriginal]			Text (50), 
	[immigrant]			Text (50), 
	[address]			Text (100), 
	[city]			Text (50), 
	[postcode]			Text (50), 
	[altphone]			Text (50), 
	[tel #1]			Text (50), 
	[appphone2]			Text (50), 
	[tel #2]			Text (50), 
	[personal email address]			Text (100), 
	[legal name of business]			Text (100), 
	[business start date]			Text (50), 
	[bus address]			Text (100), 
	[bus city]			Text (50), 
	[bus postcode]			Text (50), 
	[bus cell]			Text (50), 
	[bus email]			Text (100), 
	[bus structure]			Text (50), 
	[bus phone]			Text (50), 
	[bus fax]			Text (50), 
	[bus website]			Text (50), 
	[business number]			Text (50), 
	[businessbase]			Text (50), 
	[total funds]			Text (50), 
	[fund use]			Text (50), 
	[fund use other]			Text (50), 
	[operating cap]			Currency, 
	[vehicles]			Currency, 
	[equipment]			Currency, 
	[leaseholds]			Currency, 
	[inventory]			Currency, 
	[requestother]			Currency
);

CREATE TABLE [tbl_TEMP_ClientCount]
 (
	[clientid]			Long Integer, 
	[staff_ID]			Text (50)
);

CREATE TABLE [tbl_TEMP_ClientCountTotal]
 (
	[clientid]			Long Integer, 
	[ab]			Boolean NOT NULL, 
	[im]			Boolean NOT NULL, 
	[dis]			Boolean NOT NULL, 
	[youth]			Boolean NOT NULL, 
	[emwedate]			Boolean NOT NULL, 
	[emwerural]			Boolean NOT NULL, 
	[staff_ID]			Text (50)
);

CREATE TABLE [tbl_TEMP_Profiles]
 (
	[StartDate]			DateTime, 
	[Fullname]			Text (255), 
	[Company]			Text (255), 
	[City]			Text (50), 
	[CommTypeDesc]			Text (50), 
	[CTCategory]			Text (50), 
	[ActivityName]			Text (50), 
	[UpdateOnly]			Boolean NOT NULL, 
	[MMStartDate]			DateTime, 
	[NonCore]			Boolean NOT NULL
);

CREATE TABLE [tbl_temp_RegBusInfoSessions]
 (
	[BusInfoSessionID]			Long Integer, 
	[SessionDateTime]			DateTime, 
	[BusName]			Text (100), 
	[BusLocation]			Text (50), 
	[BusHowLong]			Text (7), 
	[AreDoYou]			Text (50), 
	[FinancingBy]			DateTime, 
	[FName]			Text (50), 
	[LName]			Text (50), 
	[Email]			Text (75), 
	[Phone]			Text (25), 
	[Ethnicity]			Text (10), 
	[AgeRange]			Text (10), 
	[Newletter]			Long Integer, 
	[eBlast]			Long Integer, 
	[Posted]			Long Integer, 
	[AfterSessEmailSent]			Long Integer, 
	[HeardAboutVia]			Text (75), 
	[BLIS]			Long Integer, 
	[RecordDate]			DateTime
);

CREATE TABLE [tbl_test]
 (
	[Ttl]			Long Integer
);

CREATE TABLE [tbl_tmp_SBISListing]
 (
	[CourseName]			Text (50), 
	[StartDate]			DateTime, 
	[TrainingID]			Long Integer
);

CREATE TABLE [tbl_TrainingFeedback BACKUP]
 (
	[FeedbackID]			Long Integer, 
	[TrainingID]			Long Integer, 
	[Presentation-Quality]			Text (50), 
	[Storyteller1]			Text (50), 
	[Storyteller2]			Text (50), 
	[Storyteller3]			Text (50), 
	[Content-Org/Pace]			Text (50), 
	[Content-Quality]			Text (50), 
	[Content-Relevancy]			Text (50), 
	[Content-TimeValue]			Text (50), 
	[Content-CostValue]			Text (50), 
	[Applicable?]			Boolean NOT NULL, 
	[Point1]			Text (255), 
	[Point2]			Text (255), 
	[Point3]			Text (255), 
	[Effective1]			Text (255), 
	[Effective2]			Text (255), 
	[Effective3]			Text (255), 
	[Comparison]			Text (50), 
	[MostImportant]			Text (255), 
	[Testimonial]			Memo/Hyperlink (255), 
	[Name]			Text (50), 
	[BusinessName]			Text (50), 
	[Phone]			Text (50), 
	[upsize_ts]			Binary, 
	[Interest_FM]			Boolean NOT NULL, 
	[Interest_MBF]			Boolean NOT NULL, 
	[Interest_UBF]			Boolean NOT NULL, 
	[Interest1]			Boolean NOT NULL, 
	[Interest1Name]			Text (50), 
	[Interest2]			Boolean NOT NULL, 
	[Interest2Name]			Text (50), 
	[Interest3]			Boolean NOT NULL, 
	[Interest3Name]			Text (50), 
	[Interest4]			Boolean NOT NULL, 
	[Interest4Name]			Text (50), 
	[Interest5]			Boolean NOT NULL, 
	[Interest5Name]			Text (50), 
	[Interest6]			Boolean NOT NULL, 
	[Interest6Name]			Text (10), 
	[Interest7]			Boolean NOT NULL, 
	[Interest7Name]			Text (50), 
	[Interest8]			Boolean NOT NULL, 
	[Interest8Name]			Text (50), 
	[Interest9]			Boolean NOT NULL, 
	[Interest9Name]			Text (50), 
	[InterestOther]			Boolean NOT NULL, 
	[InterestOtherName]			Text (100)
);

CREATE TABLE [tbl_VCAnalysis]
 (
	[ID]			Long Integer, 
	[Loan_Number]			Text (255), 
	[Un-disbursed]			Double, 
	[Principal Paid Out]			Currency, 
	[Interest Paid Out]			Currency, 
	[BusinessTo]			Text (255), 
	[Growth]			Text (255), 
	[Company]			Text (255), 
	[Business Structure]			Text (255), 
	[Client Name]			Text (255), 
	[Years in Operation]			Double, 
	[Number of Owners]			Double, 
	[Location]			Text (255), 
	[Date Disbursed]			DateTime, 
	[Last Date of Status Change]			DateTime, 
	[Loan Status]			Text (255), 
	[WEC Financing]			Double, 
	[Amount Leveraged]			Double, 
	[Total Project]			Double, 
	[Total Written Off]			Double, 
	[Amount Recovered]			Double, 
	[Industry Sector]			Text (255), 
	[Business Sector]			Text (255), 
	[Jobs Created]			Double, 
	[Jobs Maintained]			Double, 
	[Value of Security to loan]			Double, 
	[Security Held]			Text (255), 
	[Married Couple]			Text (255), 
	[Age at Disbursment]			Double, 
	[Education]			Text (255), 
	[Aboriginal]			Text (255), 
	[Immigrant]			Text (255), 
	[Loan Purpose]			Text (255), 
	[Debt to Equity]			Double, 
	[Personal Net Worth]			Double, 
	[Net Profit]			Double, 
	[Commercial Net Worth]			Double, 
	[Home Based]			Text (255), 
	[Beacon Score]			Double
);

CREATE TABLE [tblCounsellingSchedule]
 (
	[Status]			Text (50), 
	[LPrimaryID]			Long Integer, 
	[Frequency]			Text (255), 
	[CFrequency]			Text (255), 
	[MaxOfDateOfChange]			DateTime, 
	[YearEnd]			Text (255), 
	[YEMo]			Integer, 
	[CurMo]			Double, 
	[expr1]			Long Integer, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Address]			Text (255), 
	[City]			Text (50), 
	[Province]			Text (4), 
	[Postal_Code]			Text (10), 
	[Region]			Text (100), 
	[Email]			Text (100), 
	[Counsellor_Assigned]			Text (25), 
	[PhoneDesc]			Long Integer, 
	[PhoneNum]			Text (10), 
	[AnnAudit]			Text (255), 
	[passed]			Text (255)
);

CREATE TABLE [tblFall2021Outreach]
 (
	[Organization]			Text (255), 
	[OrgID]			Long Integer, 
	[Contact First Name]			Text (255), 
	[Contact Last Name]			Text (255), 
	[PersonnelID]			Long Integer, 
	[Contact Email]			Text (255), 
	[Contact Type/Interaction]			Text (255), 
	[Staff]			Text (255), 
	[Date]			DateTime, 
	[Note]			Text (255), 
	[Date2]			DateTime, 
	[Note2]			Text (255), 
	[Date3]			DateTime, 
	[Note3]			Text (255)
);

CREATE TABLE [tblFlaggedLabels]
 (
	[Primary ID]			Long Integer, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Flag]			Boolean NOT NULL, 
	[Address]			Text (255), 
	[City]			Text (50), 
	[Province]			Text (4), 
	[Postal Code]			Text (10)
);

CREATE TABLE [tblFlaggedlabels-Blanks]
 (
	[Primary ID]			Long Integer, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Flag]			Boolean NOT NULL, 
	[Address]			Text (255), 
	[City]			Text (50), 
	[Province]			Text (4), 
	[Postal Code]			Text (10)
);

CREATE TABLE [tblLookupsFrequency]
 (
	[FreqID]			Long Integer, 
	[Freq]			Text (50), 
	[Months]			Long Integer
);

CREATE TABLE [tblRegBusInfoSessions]
 (
	[BusInfoSessionID]			Long Integer, 
	[SessionDateTime]			DateTime, 
	[BusName]			Text (100), 
	[BusLocation]			Text (50), 
	[BusHowLong]			Text (7), 
	[AreDoYou]			Text (50), 
	[FinancingBy]			DateTime, 
	[FName]			Text (50), 
	[LName]			Text (50), 
	[Email]			Text (75), 
	[Phone]			Text (25), 
	[Ethnicity]			Text (10), 
	[AgeRange]			Text (10), 
	[Newletter]			Long Integer, 
	[eBlast]			Long Integer, 
	[Posted]			Long Integer, 
	[AfterSessEmailSent]			Long Integer, 
	[HeardAboutVia]			Text (75), 
	[BLIS]			Long Integer, 
	[RecordDate]			DateTime
);

CREATE TABLE [tblRevisionHistory]
 (
	[id]			Long Integer, 
	[Date]			DateTime, 
	[Changes]			Memo/Hyperlink (255)
);

CREATE TABLE [tblSurveyResults]
 (
	[primaryid]			Long Integer, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[PhoneNum]			Text (10), 
	[PhoneDesc]			Text (20), 
	[SurveyType]			Text (255), 
	[test]			Text (50)
);

CREATE TABLE [tblSurveyStep3a]
 (
	[SPrimary_ID]			Long Integer, 
	[WESBC_Department]			Text (20), 
	[Date]			DateTime, 
	[SurveyDate]			DateTime
);

CREATE TABLE [temp]
 (
	[First]			Text (50), 
	[Last]			Text (50), 
	[Email]			Text (100), 
	[VolunteerWorkDesc]			Memo/Hyperlink (255), 
	[Date]			DateTime, 
	[StartDate]			DateTime
);

CREATE TABLE [temp_email and newletter settings]
 (
	[Primary_ID]			Long Integer, 
	[eNewsLetter]			Boolean NOT NULL, 
	[Email]			Text (100)
);

CREATE TABLE [temp_MailChimp_Bounces]
 (
	[Email Address]			Text (255), 
	[Bounce Type]			Text (255)
);

CREATE TABLE [temp_MailChimp_EBlast_Unsubscribes]
 (
	[Email Address]			Text (255)
);

CREATE TABLE [temp_MailChimp_ENews_Unsubscribes]
 (
	[Email Address]			Text (255)
);

CREATE TABLE [temp_NewSubscribers]
 (
	[ID]			Long Integer, 
	[Email Address]			Text (255), 
	[Date Added]			Text (255), 
	[First Name]			Text (255), 
	[Last Name]			Text (255), 
	[Company Name]			Text (255), 
	[City]			Text (255)
);

CREATE TABLE [temp_RemoveFromEBlast]
 (
	[EMAIL ADDRESS]			Text (255)
);

CREATE TABLE [temp_RemoveFromENews]
 (
	[Email Address]			Text (255), 
	[Field2]			Text (255)
);

CREATE TABLE [temp_SM_import]
 (
	[Respondent ID]			Double, 
	[IP Address]			Text (255), 
	[Email Address]			Text (255), 
	[First Name]			Text (255), 
	[Last Name]			Text (255), 
	[Custom Data 1]			Text (255), 
	[Applicable]			Text (255), 
	[Positive]			Text (255), 
	[Compare]			Text (255), 
	[keypoint1]			Text (255), 
	[keypoint2]			Text (255), 
	[keypoint3]			Text (255), 
	[Presentation-Quality]			Text (255), 
	[Presentation-Quality2]			Text (255), 
	[Presentation-Quality3]			Text (255), 
	[Presentation-Quality4]			Text (255), 
	[Content-Org/Pace]			Text (255), 
	[Content-timevalue]			Text (255), 
	[BetterDecisions]			Text (255), 
	[Effective1]			Text (255), 
	[Effective2]			Text (255), 
	[Effective3]			Text (255), 
	[FinUnder]			Text (255), 
	[FinMgmt]			Text (255), 
	[Marketing]			Text (255), 
	[SMBP]			Text (255), 
	[HRMgmt]			Text (255), 
	[BizGrowth]			Text (255), 
	[PersonalDev]			Text (255), 
	[SalesStrategy]			Text (255), 
	[NegSkills]			Text (255), 
	[Other]			Text (255), 
	[AwareWorkshops]			Text (255), 
	[AwareGuides]			Text (255), 
	[AwareORL]			Text (255), 
	[AwareBizAdvServices]			Text (255), 
	[AwareBPReview]			Text (255), 
	[AwarementoringPgms]			Text (255), 
	[AwareLoans]			Text (255), 
	[Comments]			Text (255), 
	[Name]			Text (255), 
	[BizName]			Text (255), 
	[email]			Text (255), 
	[Testimonial]			Text (255), 
	[Acknowledgement]			Text (255)
);

CREATE TABLE [Temp_SMData]
 (
	[SMTopic]			Text (50), 
	[Category]			Text (50), 
	[Value]			Long Integer
);

CREATE TABLE [temp_SurveyMonkeyTrainingFeedback]
 (
	[Respondent ID]			Double, 
	[Collector ID]			Long Integer, 
	[Start Date]			DateTime, 
	[End Date]			DateTime, 
	[IP Address]			Text (255), 
	[Email Address]			Text (255), 
	[First Name]			Text (255), 
	[Last Name]			Text (255), 
	[Custom Data 1]			Text (255), 
	[Will you be able to apply what you learned in this webinar to yo]			Text (255), 
	[Overall, was this webinar a positive experience?]			Text (255), 
	[How Does this webinar Compare to other business training you hav]			Text (255), 
	[keypoint1]			Text (255), 
	[keypoint2]			Text (255), 
	[keypoint3]			Text (255), 
	[Presentation-Quality]			Text (255), 
	[Content-Org/Pace]			Text (255), 
	[Content-timevalue]			Text (255), 
	[TheÂ webinar provided information that will help me make better ]			Text (255), 
	[Effective1]			Text (255), 
	[Effective2]			Text (255), 
	[Effective3]			Text (255), 
	[FinUnder]			Text (255), 
	[FinMgmt]			Text (255), 
	[Marketing]			Text (255), 
	[SMBP]			Text (255), 
	[HRMgmt]			Text (255), 
	[BizGrowth]			Text (255), 
	[PersonalDev]			Text (255), 
	[SalesStrategy]			Text (255), 
	[NegSkills]			Text (255), 
	[Other]			Text (255), 
	[AwareWorkshops]			Text (255), 
	[AwareGuides]			Text (255), 
	[AwareORL]			Text (255), 
	[AwareBizAdvServices]			Text (255), 
	[AwareBPReview]			Text (255), 
	[AwarementoringPgms]			Text (255), 
	[AwareLoans]			Text (255), 
	[Comments]			Text (255), 
	[Name]			Text (255), 
	[BizName]			Text (255), 
	[email]			Text (255), 
	[Testimonial]			Text (255), 
	[Acknowledgement]			Text (255)
);

CREATE TABLE [tblMonthlySubmissions]
 (
	[Primary_ID]			Long Integer, 
	[CTID]			Long Integer, 
	[Staff Contact]			Text (50), 
	[Company]			Text (255), 
	[Last]			Text (50), 
	[First]			Text (50), 
	[Date In]			DateTime, 
	[Date To Analyst]			DateTime, 
	[Date  Reviewed]			DateTime, 
	[Status Date]			DateTime, 
	[Date_Client_Contact]			DateTime, 
	[Type]			Text (255), 
	[Final Status]			Text (255), 
	[Assessment Hours]			Text (50), 
	[Notes]			Text (255), 
	[Contact Type]			Text (50), 
	[Report Type]			Text (100), 
	[LoanAmount]			Currency
);

CREATE TABLE [tblMonthlySubmissions_History]
 (
	[Staff Contact]			Text (50), 
	[Company]			Text (255), 
	[Last]			Text (50), 
	[First]			Text (50), 
	[Date In]			DateTime, 
	[Date To Analyst]			DateTime, 
	[Date  Reviewed]			DateTime, 
	[Status Date]			DateTime, 
	[Date_Client_Contact]			DateTime, 
	[Type]			Text (255), 
	[Final Status]			Text (255), 
	[Assessment Hours]			Text (50), 
	[Notes]			Text (255), 
	[Contact Type]			Text (50), 
	[Report Type]			Text (100)
);

CREATE TABLE [temp_tbl_boardvolunteercountbyyear]
 (
	[Name]			Text (50), 
	[CalendarYear]			Integer
);

CREATE TABLE [temp_tbl_clientvolunteercountbyyear]
 (
	[ClientID]			Long Integer, 
	[CalendarYear]			Integer
);

CREATE TABLE [temp_tbl_othervolunteercountbyyear]
 (
	[Name]			Text (50), 
	[CalendarYear]			Integer
);

CREATE TABLE [temp_tbl_uniquepartnersbyorgtype]
 (
	[Number of Unique Partners]			Long Integer, 
	[CountOfOrganizationID]			Long Integer, 
	[OrgTypeDescription]			Text (50)
);

CREATE TABLE [temp_tbl_VolunteerAddressList]
 (
	[FullName]			Text (50), 
	[Address]			Text (50), 
	[City]			Text (50), 
	[Prov]			Text (50), 
	[PostalCode]			Text (10), 
	[VolSource]			Text (50), 
	[ActivityName]			Text (50), 
	[VolDate]			DateTime, 
	[ActvityDate]			DateTime, 
	[VolunteerWorkDesc]			Text (250)
);

CREATE TABLE [temp_WD_GC]
 (
	[Identifier]			Text (255), 
	[CountOfWESBC_Department]			Long Integer
);

CREATE TABLE [temp_WD_lo]
 (
	[Identifier]			Text (255), 
	[CountOfWESBC_Department]			Long Integer
);

CREATE TABLE [temp_WD_SP]
 (
	[Identifier]			Text (255), 
	[CountOfWESBC_Department]			Long Integer
);

CREATE TABLE [temp_WD_TR]
 (
	[Identifier]			Text (255), 
	[CountOfWESBC_Department]			Long Integer
);

CREATE TABLE [tmp_PartnersByRegion]
 (
	[Organization]			Text (100), 
	[region]			Text (255), 
	[CountOfOrganizationID]			Long Integer
);

CREATE TABLE [tmp_tbl_no_match]
 (
	[Notes]			Text (255)
);

CREATE TABLE [tmp_tbl_PassionImport]
 (
	[clientid]			Long Integer, 
	[regdate]			DateTime, 
	[trainingid]			Long Integer, 
	[notes]			Memo/Hyperlink (255)
);

CREATE TABLE [tmp_tbl_SD results]
 (
	[ServiceDate]			DateTime, 
	[Primary_ID]			Long Integer, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Industry]			Long Integer, 
	[Business_Sector]			Text (80), 
	[IndName]			Text (50)
);

CREATE TABLE [tmpFood]
 (
	[Primary_ID]			Long Integer, 
	[Business_Sector]			Text (80), 
	[Industry]			Long Integer, 
	[C3_Industry]			Long Integer, 
	[Company]			Text (255), 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Business_Description]			Memo/Hyperlink (255), 
	[advisor]			Long Integer, 
	[training]			Long Integer, 
	[mentxx]			Long Integer, 
	[referredto]			Long Integer
);

CREATE TABLE [tmptbl_10years]
 (
	[ClientID]			Long Integer, 
	[ServiceType]			Text (255), 
	[ServiceDate]			DateTime, 
	[ServiceDateCount]			Long Integer
);

CREATE TABLE [tmptbl_10years_ClientDetail]
 (
	[ClientID]			Long Integer, 
	[Date]			DateTime, 
	[DateModified]			DateTime, 
	[MaxOfServiceDate]			DateTime, 
	[LastContact]			DateTime, 
	[City]			Text (50), 
	[Province]			Text (4), 
	[Clients_remote_Business_Sector]			Text (80), 
	[Industry]			Long Integer, 
	[IndName]			Text (50), 
	[C3_Industry]			Long Integer, 
	[Lookup_C3_Industry_Business_Sector]			Text (80), 
	[Number_ofEmployees]			Integer, 
	[Annual_Revenue]			Long Integer, 
	[Business_Status]			Text (100), 
	[Aboriginal]			Boolean NOT NULL, 
	[EthnicityType]			Text (50), 
	[Visible_Minority]			Boolean NOT NULL, 
	[Youth]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[VisibleMinority]			Boolean NOT NULL, 
	[NewCanadian]			Boolean NOT NULL, 
	[LGBTQ2Plus]			Boolean NOT NULL, 
	[Francophone]			Boolean NOT NULL, 
	[WomenOwned]			Text (25), 
	[VisibleMinorityType]			Text (80), 
	[TypeDetail]			Text (255), 
	[Demo_PreferNotToSay]			Boolean NOT NULL, 
	[Demo_NoneOfTheAbove]			Boolean NOT NULL, 
	[VisibleMinorityOther]			Text (50), 
	[Gender]			Text (25), 
	[T14]			Long Integer, 
	[T15]			Long Integer, 
	[T16]			Long Integer, 
	[T17]			Long Integer, 
	[T18]			Long Integer, 
	[T19]			Long Integer, 
	[T20]			Long Integer, 
	[T21]			Long Integer, 
	[T22]			Long Integer, 
	[T23]			Long Integer, 
	[G14]			Long Integer, 
	[G15]			Long Integer, 
	[G16]			Long Integer, 
	[G17]			Long Integer, 
	[G18]			Long Integer, 
	[G19]			Long Integer, 
	[G20]			Long Integer, 
	[G21]			Long Integer, 
	[G22]			Long Integer, 
	[G23]			Long Integer, 
	[M14]			Long Integer, 
	[M15]			Long Integer, 
	[M16]			Long Integer, 
	[M17]			Long Integer, 
	[M18]			Long Integer, 
	[M19]			Long Integer, 
	[M20]			Long Integer, 
	[M21]			Long Integer, 
	[M22]			Long Integer, 
	[M23]			Long Integer, 
	[L14]			Long Integer, 
	[L15]			Long Integer, 
	[L16]			Long Integer, 
	[L17]			Long Integer, 
	[L18]			Long Integer, 
	[L19]			Long Integer, 
	[L20]			Long Integer, 
	[L21]			Long Integer, 
	[L22]			Long Integer, 
	[L23]			Long Integer, 
	[C14]			Long Integer, 
	[C15]			Long Integer, 
	[C16]			Long Integer, 
	[C17]			Long Integer, 
	[C18]			Long Integer, 
	[C19]			Long Integer, 
	[C20]			Long Integer, 
	[C21]			Long Integer, 
	[C22]			Long Integer, 
	[C23]			Long Integer, 
	[B14]			Long Integer, 
	[B15]			Long Integer, 
	[B16]			Long Integer, 
	[B17]			Long Integer, 
	[B18]			Long Integer, 
	[B19]			Long Integer, 
	[B20]			Long Integer, 
	[B21]			Long Integer, 
	[B22]			Long Integer, 
	[B23]			Long Integer
);

CREATE TABLE [tmptbl_C3_Registrant_BA-OD-TR]
 (
	[ClientID]			Long Integer, 
	[Province]			Text (255), 
	[Tag]			Text (255), 
	[ServiceDate]			DateTime
);

CREATE TABLE [tmptbl_C3-Service_Usage]
 (
	[ClientID]			Long Integer, 
	[Province]			Text (255), 
	[City]			Text (255), 
	[Tag]			Text (255), 
	[TagGroup]			Text (255), 
	[TagDetail]			Text (255), 
	[TagSession]			Text (255), 
	[TagLanguage]			Text (2), 
	[ServiceDate]			DateTime, 
	[ActivityDate]			DateTime, 
	[TrainingID]			Long Integer, 
	[ActivityID]			Long Integer, 
	[ActivityLocation]			Text (255)
);

CREATE TABLE [tmptbl_LoanAssessment_Client_Data]
 (
	[Primary_ID]			Long Integer, 
	[Loan_ID]			Integer, 
	[Input_Date]			DateTime, 
	[Company]			Text (255), 
	[Address]			Text (255), 
	[City]			Text (50), 
	[Province]			Text (50), 
	[Postal_Code]			Text (50), 
	[Website]			Text (100), 
	[Email]			Text (100), 
	[Business_Structure]			Text (50), 
	[Business_Sector]			Text (80), 
	[BA_Loan_Care]			Text (50), 
	[BA_2nd_Reviewer]			Text (50), 
	[Counsellor_Assigned]			Text (25), 
	[Loan_Admin_Assigned]			Text (25), 
	[Source]			Text (50), 
	[Referral]			Text (50), 
	[BizPhone]			Text (255), 
	[PriHmPhone]			Text (255), 
	[PriCellPhone]			Text (255), 
	[Jobs_Created]			Double, 
	[Jobs_Maintained]			Double, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[HAddress]			Text (50), 
	[HCity]			Text (25), 
	[Date_of_Birth]			DateTime, 
	[PriBeacon]			Text (255), 
	[Aboriginal]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[AgeUnder30]			Boolean NOT NULL, 
	[Age30To39]			Boolean NOT NULL, 
	[B2BorB2C]			Long Integer, 
	[BizCourtSearch]			Text (10), 
	[BizCourtSearchNotes]			Memo/Hyperlink (255), 
	[BizCourtSearchDate]			DateTime, 
	[BizCRA]			Text (20), 
	[BizCRADate]			DateTime, 
	[BizCRAAmount]			Currency, 
	[BizCRANotes]			Memo/Hyperlink (255), 
	[Immigrant]			Boolean NOT NULL, 
	[ImmigrantYears]			Long Integer, 
	[B2B]			Boolean NOT NULL, 
	[B2C]			Boolean NOT NULL, 
	[socialEnterprise]			Boolean NOT NULL, 
	[AmountRequested]			Currency
);

CREATE TABLE [tmptbl_LoanAssessment_ContactTracking_Data]
 (
	[Primary_ID]			Long Integer, 
	[Company]			Text (255), 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Contact_Type]			Text (50), 
	[MaxOfDate_In]			DateTime, 
	[Date_Assessment_Completed]			DateTime, 
	[Final_Status]			Text (255), 
	[Status_Date]			DateTime, 
	[LoanAmount]			Currency
);

CREATE TABLE [tmptbl_LoanAssessment_Loans_Data]
 (
	[Loan_ID]			Long Integer, 
	[LPrimary_ID]			Long Integer, 
	[Loan_Number]			Text (20), 
	[Input_Date]			DateTime, 
	[Fund_Usage]			Text (20), 
	[Purpose_of_Loan]			Text (50), 
	[LP_WDPA_Inno]			Boolean NOT NULL, 
	[LP_WDPA_AED]			Boolean NOT NULL, 
	[LP_WDPA_Trade]			Boolean NOT NULL, 
	[LP_WDPA_Fed]			Boolean NOT NULL, 
	[LP_CleanTechnology]			Boolean NOT NULL, 
	[LP_Other]			Boolean NOT NULL, 
	[LP_OtherText]			Text (255), 
	[Equity_Amount]			Currency, 
	[Cash_Equity_Amount]			Currency, 
	[Equity_AmountDesc]			Text (255), 
	[ProjectLevBank]			Currency, 
	[ProjectLevInvestor]			Currency, 
	[ProjectLevOther]			Currency, 
	[LeveragedSE]			Currency, 
	[LP_WorkingCapital]			Boolean NOT NULL, 
	[LP_WorkingCapital_Amnt]			Currency, 
	[LP_Equipment]			Boolean NOT NULL, 
	[LP_Equipment_Amnt]			Currency, 
	[LP_Leaseholds]			Boolean NOT NULL, 
	[LP_Leaseholds_Amnt]			Currency, 
	[LP_Inventory]			Boolean NOT NULL, 
	[LP_Inventory_Amnt]			Currency, 
	[SecurityAmount]			Currency, 
	[Loan_Amount_Approved]			Currency, 
	[DisbursalFirstAmount]			Currency, 
	[DisbursalSecondAmount]			Currency, 
	[DisbursalThirdAmount]			Currency, 
	[WDPA_LP_ValueAddedAgriculture]			Boolean NOT NULL, 
	[WDPA_LP_AdvancedManufacturing]			Boolean NOT NULL, 
	[WDPA_LP_DigitalIndustries]			Boolean NOT NULL, 
	[WDPA_LP_CleanResources]			Boolean NOT NULL, 
	[WDPA_LP_HealthAndBiosciences]			Boolean NOT NULL, 
	[WDPA_LP_ProteinInnovation]			Boolean NOT NULL, 
	[exceptionBeacon]			Boolean NOT NULL, 
	[exceptionequity]			Boolean NOT NULL, 
	[exceptionsecurity]			Boolean NOT NULL, 
	[exceptionelse]			Boolean NOT NULL, 
	[exceptionothernotes]			Text (255), 
	[eacloan]			Boolean NOT NULL, 
	[LeveragedCF]			Currency, 
	[LeveragedBank]			Currency, 
	[LeveragedWES]			Currency, 
	[LeveragedOther]			Currency, 
	[LeverageNote]			Text (255), 
	[LP_BusinessPurchase]			Boolean NOT NULL, 
	[LP_BusinessPurchase_Amnt]			Currency, 
	[LP_Other_Amnt]			Currency, 
	[LoanTerm]			Long Integer, 
	[PrimeRate]			Single, 
	[PrimeRatePlus]			Single, 
	[InterestOnlyMonths]			Long Integer, 
	[PaymentDayOfMonth]			Long Integer, 
	[FirstPmtDue]			DateTime, 
	[LoanExpiryDate]			DateTime, 
	[TermRenewalDate]			DateTime, 
	[AdminFee]			Currency, 
	[FinancialsFreq]			Text (10), 
	[CounsellingFreq]			Text (10), 
	[PaymentAmount]			Currency, 
	[ppsa_reqd]			Boolean NOT NULL, 
	[proofF&Treqd]			Boolean NOT NULL, 
	[mtgsec_reqd]			Boolean NOT NULL, 
	[keyman_reqd]			Boolean NOT NULL, 
	[gic_reqd]			Boolean NOT NULL, 
	[loo_reqd]			Boolean NOT NULL, 
	[la_reqd]			Boolean NOT NULL, 
	[era_reqd]			Boolean NOT NULL, 
	[lw_reqd]			Boolean NOT NULL, 
	[lod_reqd]			Boolean NOT NULL, 
	[dpn_reqd]			Boolean NOT NULL, 
	[gss_reqd]			Boolean NOT NULL, 
	[cila_reqd]			Boolean NOT NULL, 
	[dr_reqd]			Boolean NOT NULL, 
	[flg_reqd]			Boolean NOT NULL, 
	[llg_reqd]			Boolean NOT NULL, 
	[other1text]			Text (150), 
	[other2text]			Text (50), 
	[other3text]			Text (50), 
	[other4text]			Text (50), 
	[other5text]			Text (50), 
	[SecurityDescription]			Memo/Hyperlink (255), 
	[SeasonalPayment]			Boolean NOT NULL, 
	[SeasonalPaymentDesc]			Text (200)
);

CREATE TABLE [tmptbl_LoanAssessment_LoanSecurity]
 (
	[SType]			Text (50), 
	[Owner]			Text (50), 
	[Item]			Text (100), 
	[ItemDesc]			Text (255), 
	[ItemValue]			Currency, 
	[ValuationBy]			Long Integer, 
	[ValuationDate]			DateTime, 
	[ItemIdentifier]			Text (255), 
	[SNotes]			Memo/Hyperlink (255), 
	[DateRecd]			DateTime, 
	[RenewalDate]			DateTime
);

CREATE TABLE [tmptbl_LoanAssessment_Shareholders_Data]
 (
	[Primary_ID]			Long Integer, 
	[Loan_ID]			Integer, 
	[Name]			Text (100), 
	[Shareholder]			Boolean NOT NULL, 
	[ShareholderPercent]			Long Integer, 
	[Director]			Boolean NOT NULL, 
	[Gender]			Text (15)
);

CREATE TABLE [tmptbl_WEC_CSR_Sec1]
 (
	[Appt Count]			Long Integer, 
	[WESBC_Department]			Text (30), 
	[hrs]			Double, 
	[RU]			Text (255), 
	[SPrimary_ID]			Long Integer, 
	[EMWE]			Boolean NOT NULL, 
	[DateCreated]			DateTime, 
	[EMWERural]			Boolean NOT NULL, 
	[EMWEAdvisor]			Boolean NOT NULL, 
	[EMWEDate]			Boolean NOT NULL
);

CREATE TABLE [tmptbl_WEC_CSR_Sec1_Unique]
 (
	[Appt Count]			Long Integer, 
	[hrs]			Double, 
	[RU]			Text (255), 
	[SPrimary_ID]			Long Integer
);

CREATE TABLE [tmptbl_WinVC]
 (
	[Primary_ID]			Long Integer, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[City]			Text (255), 
	[email]			Text (255), 
	[Industry]			Long Integer, 
	[C3_Industry]			Long Integer, 
	[qDate]			DateTime, 
	[Source]			Text (255)
);

CREATE TABLE [tmptblMar12P&G]
 (
	[clientid]			Double, 
	[regdate]			DateTime, 
	[trainingid]			Double, 
	[notes]			Text (255)
);

CREATE TABLE [tmptblMar14P&G]
 (
	[clientid]			Double, 
	[regdate]			DateTime, 
	[trainingid]			Double, 
	[notes]			Text (255)
);

CREATE TABLE [tmptblMar19P&G]
 (
	[clientid]			Double, 
	[regdate]			DateTime, 
	[trainingid]			Double, 
	[notes]			Text (255)
);

CREATE TABLE [tmptblMar5P&G]
 (
	[clientid]			Double, 
	[regdate]			DateTime, 
	[trainingid]			Double, 
	[notes]			Text (255)
);

CREATE TABLE [tmptblMar7P&G]
 (
	[clientid]			Double, 
	[regdate]			DateTime, 
	[trainingid]			Double, 
	[notes]			Text (255)
);

CREATE TABLE [tmptbl_C3_SvcUsrs_ALL]
 (
	[Primary_ID]			Long Integer, 
	[Province]			Text (255), 
	[Tag]			Text (255), 
	[ServiceDate]			DateTime, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[City]			Text (50), 
	[Disabled]			Boolean NOT NULL, 
	[visibleMinority]			Boolean NOT NULL, 
	[Francophone]			Boolean NOT NULL, 
	[Aboriginal]			Boolean NOT NULL, 
	[LGBTQ2Plus]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[Demo_PreferNotToSay]			Boolean NOT NULL, 
	[Demo_NoneOfTheAbove]			Boolean NOT NULL, 
	[diversity]			Integer, 
	[C3_Industry]			Long Integer, 
	[Business_Sector]			Text (80), 
	[Business_Status]			Text (100), 
	[VisibleMinorityType]			Text (80), 
	[BizStatus_Consolidated]			Text (255), 
	[TagDetail]			Text (255), 
	[ActivityDate]			DateTime, 
	[TrainingID]			Long Integer, 
	[ActivityID]			Long Integer
);

CREATE TABLE [tmptbl_C3_SvcUsrs_UNIQUE]
 (
	[Primary_ID]			Long Integer, 
	[Province]			Text (255), 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[City]			Text (50), 
	[Disabled]			Boolean NOT NULL, 
	[visibleMinority]			Boolean NOT NULL, 
	[Francophone]			Boolean NOT NULL, 
	[Aboriginal]			Boolean NOT NULL, 
	[LGBTQ2Plus]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[Demo_PreferNotToSay]			Boolean NOT NULL, 
	[Demo_NoneOfTheAbove]			Boolean NOT NULL, 
	[diversity]			Integer, 
	[C3_Industry]			Long Integer, 
	[Business_Sector]			Text (80), 
	[Business_Status]			Text (100), 
	[VMType]			Text (255), 
	[BizStatus_Consolidated]			Text (255)
);

CREATE TABLE [tmptblOperationsFeb2024]
 (
	[clientid]			Double, 
	[regdate]			DateTime, 
	[trainingid]			Double, 
	[notes]			Text (255)
);

CREATE TABLE [tmptblOperationsMarch2024]
 (
	[clientid]			Double, 
	[regdate]			DateTime, 
	[trainingid]			Double, 
	[notes]			Text (255)
);

CREATE TABLE [tmptblPassion]
 (
	[clientid]			Long Integer, 
	[regDate]			DateTime, 
	[trainingid]			Long Integer, 
	[notes]			Memo/Hyperlink (255)
);

CREATE TABLE [tmpTrainingDemographics]
 (
	[Primary_ID]			Long Integer, 
	[City]			Text (50), 
	[Region]			Text (100), 
	[Location]			Text (100), 
	[Francophone]			Boolean NOT NULL, 
	[LGBTQ2Plus]			Boolean NOT NULL, 
	[NewCanadian]			Boolean NOT NULL, 
	[VisibleMinority]			Boolean NOT NULL, 
	[Aboriginal]			Boolean NOT NULL, 
	[EthnicityType]			Text (50), 
	[Visible_Minority]			Boolean NOT NULL, 
	[Youth]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[Immigrant]			Boolean NOT NULL, 
	[ImmigrantYears]			Long Integer, 
	[Business_Status]			Text (100), 
	[Years_in_Business]			Integer, 
	[Business_Start_Date]			DateTime, 
	[Business_Structure]			Text (50), 
	[Business_Sector]			Text (80), 
	[Business_Description]			Memo/Hyperlink (255), 
	[IndName]			Text (50), 
	[B2BorB2C]			Long Integer, 
	[Commercial]			Long Integer, 
	[Home_Based]			Long Integer, 
	[Wholesale]			Boolean NOT NULL, 
	[Retail]			Boolean NOT NULL, 
	[Manufacturing]			Boolean NOT NULL, 
	[Service]			Boolean NOT NULL, 
	[Professional]			Boolean NOT NULL, 
	[Primary_Industry]			Boolean NOT NULL, 
	[Distributor_Agent]			Boolean NOT NULL, 
	[Import_Export]			Boolean NOT NULL, 
	[Franchise]			Boolean NOT NULL, 
	[ManufacturePPE]			Boolean NOT NULL, 
	[TourismOperator]			Boolean NOT NULL
);

CREATE TABLE [WECafe Personal Branding_ImportErrors]
 (
	[Error]			Text (255), 
	[Field]			Text (255), 
	[Row]			Long Integer
);

CREATE TABLE [xLookup_Guides]
 (
	[GuideID]			Long Integer, 
	[GuideName]			Text (100), 
	[GuideDesc]			Text (255), 
	[GuideFormat]			Text (50), 
	[GuidePublishDate]			DateTime, 
	[GuideCurrent]			Boolean NOT NULL, 
	[GuideNotes]			Memo/Hyperlink (255), 
	[GuideCost]			Currency
);

CREATE TABLE [xxtbl_LoanDocMergeData]
 (
	[LoanDocDataID]			Long Integer, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[FullName]			Text (50), 
	[Company]			Text (50), 
	[Address]			Text (50), 
	[City]			Text (50), 
	[Province]			Text (50), 
	[Postal_Code]			Text (50), 
	[CoFullAddress]			Text (50), 
	[Business_Phone]			Text (50), 
	[Fax]			Text (50), 
	[Email]			Text (50), 
	[AltEMail]			Text (50), 
	[Website]			Text (50), 
	[Jobs_Created]			Long Integer, 
	[Jobs_Maintained]			Long Integer, 
	[Date_of_Birth]			DateTime, 
	[SIN]			Text (50), 
	[HAddress]			Text (50), 
	[HCity]			Text (50), 
	[HProv]			Text (50), 
	[HPC]			Text (50), 
	[HFullAddress]			Text (50), 
	[Home_Phone]			Text (50), 
	[Loan_Amount_Approved]			Currency, 
	[Loan_Number]			Text (50), 
	[SecurityAmount]			Currency, 
	[Equity_Amount]			Currency, 
	[Approval_Date]			DateTime, 
	[DisbursalFirstDate]			DateTime, 
	[First_pmt_due]			DateTime, 
	[Payment_Amount]			Currency, 
	[Term_Renewal_Date]			DateTime, 
	[Loan_Term]			Long Integer, 
	[Loan_Expiry_Date]			DateTime, 
	[LeveragedCF]			Currency, 
	[LeveragedSE]			Currency, 
	[LeveragedBANK]			Currency, 
	[LeveragedWES]			Currency, 
	[LeveragedINVESTOR]			Currency, 
	[LeveragedOTHER]			Currency, 
	[Last_Payment_Date]			DateTime, 
	[Business_Structure]			Text (50), 
	[Loan_Purpose]			Text (50), 
	[Prime]			Double, 
	[Prime_Plus]			Double, 
	[Total_Interest]			Double, 
	[Interest_Only_Mths]			Long Integer, 
	[Interest_Only_Start]			DateTime, 
	[Interest_Only_End]			DateTime, 
	[Admin_Fee]			Currency, 
	[PaymentDay]			Long Integer, 
	[FinancialStmtFreq]			Text (50), 
	[LoanCareFreq]			Text (50), 
	[AdditionalLtdGuarantors]			Memo/Hyperlink (255), 
	[AdditionalFullGuarantors]			Memo/Hyperlink (255), 
	[AdditionalPrinciples]			Memo/Hyperlink (255), 
	[AdditionalDirectors]			Memo/Hyperlink (255)
);

CREATE TABLE [ztblChaunda_Vancity_post]
 (
	[Primary_ID]			Long Integer, 
	[AlreadyVancity?]			Long Integer
);

CREATE TABLE [_tmptbl_Chaunda_LoanClient_ServiceUsage]
 (
	[Primary_ID]			Long Integer, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[UsedAdvServ]			Long Integer, 
	[UsedTraining]			Long Integer, 
	[UsedMentxx]			Long Integer, 
	[UsedCS]			Long Integer
);

CREATE TABLE [Archive_Clients]
 (
	[Primary_ID]			Long Integer, 
	[Date]			DateTime, 
	[DateModified]			DateTime, 
	[Flag]			Boolean NOT NULL, 
	[Inactive_Record]			Boolean NOT NULL, 
	[Principal_Language]			Text (15), 
	[Newsletter_Recipient]			Boolean NOT NULL, 
	[SendPreference]			Long Integer, 
	[WESBCInitiated]			Boolean NOT NULL, 
	[No_Fax]			Boolean NOT NULL, 
	[ARECVD]			Boolean NOT NULL, 
	[Salutation]			Text (12), 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Partner]			Text (100), 
	[Partner_Phone_Number]			Text (100), 
	[Client]			Boolean NOT NULL, 
	[Address]			Text (255), 
	[City]			Text (50), 
	[Province]			Text (4), 
	[Postal_Code]			Text (10), 
	[Region]			Text (100), 
	[Counsellor_Assigned]			Text (25), 
	[Loan_Admin_Assigned]			Text (25), 
	[Location]			Text (100), 
	[Area_Code]			Text (3), 
	[Business_Phone]			Text (10), 
	[Fax]			Text (10), 
	[Email]			Text (100), 
	[AltEMail]			Text (100), 
	[Website]			Text (100), 
	[Source]			Text (40), 
	[SourceID]			Long Integer, 
	[Referral]			Text (255), 
	[ReferralID]			Long Integer, 
	[Name]			Text (50), 
	[Aboriginal]			Boolean NOT NULL, 
	[Visible_Minority]			Boolean NOT NULL, 
	[Youth]			Boolean NOT NULL, 
	[Child_Senior]			Boolean NOT NULL, 
	[Disabled]			Boolean NOT NULL, 
	[EI_Recipient]			Boolean NOT NULL, 
	[Social_Assistance]			Boolean NOT NULL, 
	[Employed]			Boolean NOT NULL, 
	[Programs]			Text (20), 
	[Business_Status]			Text (100), 
	[Years_in_Business]			Integer, 
	[Business_Start_Date]			DateTime, 
	[Number_ofEmployees]			Integer, 
	[Jobs_Created]			Double, 
	[Jobs_Maintained]			Double, 
	[Business_Structure]			Text (50), 
	[Business_Sector]			Text (50), 
	[Business_Description]			Memo/Hyperlink (255), 
	[Commercial]			Long Integer, 
	[Industry]			Long Integer, 
	[Home_Based]			Long Integer, 
	[Wholesale]			Boolean NOT NULL, 
	[Retail]			Boolean NOT NULL, 
	[Manufacturing]			Boolean NOT NULL, 
	[Service]			Boolean NOT NULL, 
	[Professional]			Boolean NOT NULL, 
	[Primary_Industry]			Boolean NOT NULL, 
	[Distributor_Agent]			Boolean NOT NULL, 
	[Import_Export]			Boolean NOT NULL, 
	[Franchise]			Boolean NOT NULL, 
	[Age]			Long Integer, 
	[Date_of_Birth]			DateTime, 
	[Marital_Status]			Text (15), 
	[Dependants]			Long Integer, 
	[SIN]			Text (20), 
	[HAddress]			Text (50), 
	[HCity]			Text (25), 
	[HProv]			Text (10), 
	[HPC]			Text (10), 
	[Home_Phone]			Text (10), 
	[Entrepreneurial_Experience]			Boolean NOT NULL, 
	[Related_Experience]			Boolean NOT NULL, 
	[Background]			Text (255), 
	[Bankruptcy]			Boolean NOT NULL, 
	[Job]			Boolean NOT NULL, 
	[Mailing]			Long Integer, 
	[File_Location]			Text (50), 
	[Business_Closed]			Boolean NOT NULL, 
	[Education]			Text (255), 
	[Spouse_Name]			Text (100), 
	[SDOB]			Text (100), 
	[SSIN]			Text (100), 
	[Family_Contact]			Text (100), 
	[Family_Relationship]			Text (100), 
	[Family_Phone]			Text (100), 
	[Contact_Date]			DateTime, 
	[Annual_Revenue]			Long Integer, 
	[upsize_ts]			Binary, 
	[Notes]			Memo/Hyperlink (255)
);

CREATE TABLE [Loan Client Data]
 (
	[Company]			Text (255), 
	[Client Name]			Text (255), 
	[ID]			Double, 
	[Loan_Number]			Text (255), 
	[BusinessTo]			Text (255), 
	[Growth]			Text (255), 
	[Business Growth Potential (High or Low)]			Text (255), 
	[Market Growth Potential]			Text (255), 
	[BUS OPEN]			Text (255), 
	[BUS CLOSED]			Text (255), 
	[Business Structure]			Text (255), 
	[Years in Operation]			Double, 
	[Number of Owners]			Double, 
	[Location]			Text (255), 
	[Date Disbursed]			DateTime, 
	[Last Date of Status Change]			DateTime, 
	[Loan Status]			Text (255), 
	[CODED LOAN STATUS]			Double, 
	[WEC Financing]			Double, 
	[Amount Leveraged]			Double, 
	[Total Project]			Double, 
	[Total Written Off]			Double, 
	[Amount Recovered]			Text (255), 
	[Industry Sector]			Text (255), 
	[Business Sector]			Text (255), 
	[Jobs Created]			Double, 
	[Jobs Maintained]			Double, 
	[Value of Security to loan (%)]			Double, 
	[Strength of security]			Text (255), 
	[Security Held]			Text (255), 
	[Business owned by Couple (Married or Common-Law)]			Text (255), 
	[Age at Disbursment]			Double, 
	[Education]			Text (255), 
	[Aboriginal]			Text (255), 
	[Immigrant]			Text (255), 
	[Loan Purpose]			Text (255), 
	[Debt to Equity]			Double, 
	[Personal Net Worth]			Double, 
	[Net Profit]			Double, 
	[Commercial Net Worth]			Double, 
	[Home Based]			Text (255), 
	[Beacon Score]			Double, 
	[Region]			Text (255), 
	[Rural/Urban]			Text (255), 
	[Marital_Status]			Text (255), 
	[Loan Care Amount (High or Low)]			Text (255), 
	[Loan Care Type (Specialized or General)]			Text (255)
);

CREATE TABLE [tbl_HardBounceList_NoDuplicates]
 (
	[Email Address]			Text (255), 
	[First Name]			Text (255), 
	[Last Name]			Text (255)
);

CREATE TABLE [tblClientDates]
 (
	[PrimaryID]			Long Integer, 
	[OrigDate]			DateTime, 
	[FirstServiceDate]			DateTime
);

CREATE TABLE [tmp_tbl_BDCClientHours]
 (
	[Primary_ID]			Long Integer, 
	[First]			Text (50), 
	[Last]			Text (50), 
	[Company]			Text (255), 
	[Course]			Text (75), 
	[Hours]			Double, 
	[RefBDC4Loan]			Boolean NOT NULL, 
	[DateOfActivity]			DateTime, 
	[BizAdvisor]			Text (50), 
	[Amount]			Currency
);

CREATE TABLE [tmptbl_10years-unique]
 (
	[ClientID]			Long Integer, 
	[MaxOfServiceDate]			DateTime
);

CREATE TABLE [tmptbl_LoanAssessment_PersonalProfiles_Data]
 (
	[Primary_ID]			Long Integer, 
	[Loan_ID]			Integer, 
	[Beacon]			Text (255), 
	[HAddress]			Text (50), 
	[HCity]			Text (50), 
	[HProv]			Text (10), 
	[HPC]			Text (10), 
	[Name]			Text (100), 
	[HomePhone]			Text (20), 
	[CellPhone]			Text (20), 
	[Email]			Text (100), 
	[DOB]			DateTime, 
	[PersonalCourtSearch]			Text (10), 
	[PersonalCourtSearchNotes]			Memo/Hyperlink (255), 
	[PersonalCourtSearchDate]			DateTime, 
	[PersonalCRA]			Text (20), 
	[PersonalCRADate]			DateTime, 
	[PersonalCRANotes]			Memo/Hyperlink (255), 
	[PersonalCRAAmount]			Currency, 
	[FLG]			Boolean NOT NULL, 
	[LLG]			Boolean NOT NULL, 
	[Director]			Boolean NOT NULL, 
	[PPP]			Boolean NOT NULL
);

CREATE TABLE [tmpTrainingReg]
 (
	[RegistrationID]			Long Integer, 
	[TrainingID]			Long Integer, 
	[ClientID]			Long Integer, 
	[HowDidYouHear]			Text (50), 
	[TotalAmtPaid]			Currency, 
	[PdCash]			Currency, 
	[PdCheque]			Currency, 
	[PdCCard]			Currency, 
	[CCardNumber]			Text (50), 
	[CCardExpiry]			Text (50), 
	[CCardName]			Text (50), 
	[PmtReceived]			Boolean NOT NULL, 
	[Attended]			Boolean NOT NULL, 
	[Cancelled]			Boolean NOT NULL, 
	[Notes]			Memo/Hyperlink (255), 
	[RegDate]			DateTime, 
	[RequiredForLoan]			Boolean NOT NULL, 
	[CostOfCourse]			Text (50)
);

CREATE TABLE [xxtbl_TrainingAndGuides]
 (
	[TrainingID]			Long Integer, 
	[TrainingType]			Text (50), 
	[ConferenceName]			Text (50), 
	[CourseName]			Text (50), 
	[CourseDesc]			Memo/Hyperlink (255), 
	[Location]			Text (50), 
	[StartDate]			DateTime, 
	[EndDate]			DateTime, 
	[StartTime]			DateTime, 
	[EndTime]			DateTime, 
	[TrainingHours]			Text (255), 
	[TrainingSessions]			Long Integer, 
	[MaxEnrollment]			Long Integer, 
	[Facilitator]			Text (50), 
	[FacilitatorBio]			Memo/Hyperlink (255), 
	[Facility]			Text (50), 
	[Room]			Text (50), 
	[Fee]			Currency, 
	[Active]			Boolean NOT NULL, 
	[Notes]			Memo/Hyperlink (255), 
	[FixedCost]			Currency, 
	[VariableCost]			Currency, 
	[InKindDonations]			Currency, 
	[Cancelled]			Boolean NOT NULL, 
	[ReasonCancelled]			Text (50)
);

CREATE TABLE [tbl_Events_VolunteerData]
 (
	[StartDate]			DateTime, 
	[ActivityName]			Text (50), 
	[Location]			Text (50), 
	[VolName]			Text (255), 
	[Name]			Text (50), 
	[Hours]			Single, 
	[VolNum]			Long Integer, 
	[VolType]			Memo/Hyperlink (255)
);


