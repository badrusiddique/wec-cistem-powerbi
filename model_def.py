# -*- coding: utf-8 -*-
"""
WEC CISTEM — model definition (single source of truth for the Power BI prototype).

Derived from the REAL Access schema (mirror tables Archive_* / tmptbl_LoanAssessment_*).
Columns here are the meaningful subset surfaced on the 12 form tabs (not every raw column).

Types:  dt = TMDL dataType ; mt = M type
  ('int64','Int64.Type'), ('string','text'), ('boolean','logical'),
  ('double','number'), ('dateTime','datetime')

Each table: key (PK), remote (the linked MSSQL/ODBC source name → for the MSSQL swap),
parent FK (child_key -> Clients.Primary_ID) where applicable, and columns.
"""

I = ('int64', 'Int64.Type')
S = ('string', 'text')
B = ('boolean', 'logical')
D = ('double', 'number')
T = ('dateTime', 'datetime')

# ----------------------------------------------------------------------------
# TABLES
# ----------------------------------------------------------------------------
TABLES = {
    'Clients': {
        'remote': 'Clients_remote',
        'key': 'Primary_ID',
        'columns': [
            ('Primary_ID', I), ('Date', T), ('DateModified', T),
            ('Salutation', S), ('First', S), ('Last', S), ('Company', S),
            ('Partner', S), ('Principal_Language', S), ('File_Location', S),
            ('Client', B), ('Inactive_Record', B), ('Business_Closed', B),
            ('WESBCInitiated', B), ('Newsletter_Recipient', B),
            ('Address', S), ('City', S), ('Province', S), ('Postal_Code', S),
            ('Region', S), ('Location', S),
            ('Counsellor_Assigned', S), ('Loan_Admin_Assigned', S),
            ('Business_Phone', S), ('Email', S), ('AltEMail', S), ('Website', S),
            ('Source', S), ('SourceID', I), ('Referral', S), ('ReferralID', I),
            # demographics / flags
            ('Aboriginal', B), ('Visible_Minority', B), ('Youth', B),
            ('Child_Senior', B), ('Disabled', B), ('EI_Recipient', B),
            ('Social_Assistance', B), ('Employed', B), ('Age', I),
            ('Programs', S), ('Business_Status', S),
            # business
            ('Years_in_Business', I), ('Business_Start_Date', T),
            ('Number_ofEmployees', I), ('Jobs_Created', D), ('Jobs_Maintained', D),
            ('Business_Structure', S), ('Business_Sector', S),
            ('Business_Description', S), ('Industry', I), ('Home_Based', I),
            ('Franchise', B), ('Import_Export', B), ('Distributor_Agent', B),
            ('Manufacturing', B), ('Retail', B), ('Service', B), ('Professional', B),
            ('Annual_Revenue', I),
            # personal
            ('Date_of_Birth', T), ('Marital_Status', S), ('Dependants', I),
            ('SIN', S), ('HAddress', S), ('HCity', S), ('HProv', S), ('HPC', S),
            ('Home_Phone', S), ('Entrepreneurial_Experience', B),
            ('Related_Experience', B), ('Bankruptcy', B), ('Education', S),
            ('Spouse_Name', S), ('Contact_Date', T), ('Notes', S),
            # --- header band + Classic fields not in the older mirror (synthetic stub) ---
            ('Promo_Ack_Rel_Recd', B), ('Promo_Consent_Status', S), ('Promo_Consent_Date', T),
            ('Photo_Bio_Release', B), ('Testimonial_On_File', B), ('Storyteller', B),
            ('Francophone', B), ('LGBTQIA2S', B), ('Immigrant_NewCanadian_Refugee', B),
            ('Age_Under30', B), ('Age_30_39', B), ('Age_40_44', B), ('Age_45_54', B), ('Age_Over55', B),
            ('WEConnect', B), ('WEConnect_Cert_By', S), ('Growth_Client', B),
            ('NDIT', B), ('NDIT_On_Date', T),
            ('Status', S), ('Via', S), ('Updated', T), ('Updated_By', S),
            ('Referral_Recd', B), ('Loan_Recd', B), ('Pending_Recd', B),
            ('CFDC', S), ('EMWE', S), ('C3', S),
            ('C3_Industry', S), ('Tourism_Operator', B), ('Manufacturing_PPE', B), ('Commercial_Outlet', B),
            ('Send_Via', S), ('Planner', S), ('Bus_Analyst', S),
            ('Referral_Name', S),
            ('Business_Plan_Status', S), ('Looking_For_Financing', S), ('Financing_Amt', D),
            ('Contact_Notes', S),
            # --- Biz Info extra sections (synthetic stub) ---
            ('Business_Number', S), ('Ownership_Details', S), ('Social_Enterprise', B),
            ('Interested_In_Mentor', B), ('B2B', B), ('B2C', B), ('Jobs_Expanded', D),
            ('Court_Status', S), ('Court_Date', T), ('Court_Notes', S),
            ('CRA_Status', S), ('CRA_Date', T), ('CRA_Amount', D), ('CRA_Notes', S),
            ('BA_Loan_Assr', S), ('BA_2nd_Reviewer', S), ('BA_Loan_Care', S),
            ('Commercial_Beacon', S),
        ],
    },
    'ClientPhones': {
        'remote': 'dbo_ClientPhones', 'key': 'PhoneID', 'fk': ('ClientID', 'Clients'),
        'columns': [('PhoneID', I), ('ClientID', I), ('PhoneNum', S),
                    ('PhoneDesc', S), ('PhoneNotes', S), ('Primary', B), ('LocID', I)],
    },
    'AdditionalEmails': {
        'remote': 'AdditionalEmails', 'key': 'AEmailID', 'fk': ('ClientID', 'Clients'),
        'columns': [('AEmailID', I), ('ClientID', I), ('Name', S), ('Role', S), ('EMail', S), ('Notes', S)],
    },
    'BLIS': {
        'remote': 'BLIS_Sessions', 'key': 'BLISID', 'fk': ('ClientID', 'Clients'),
        'columns': [('BLISID', I), ('ClientID', I), ('Notes', S), ('DateModified', T)],
    },
    'LinkedCompanies': {
        'remote': 'LinkedCompanies', 'key': 'LinkID', 'fk': ('ClientID', 'Clients'),
        'columns': [('LinkID', I), ('ClientID', I), ('Description', S)],
    },
    'Locations': {
        'remote': 'Locations', 'key': 'LocationID', 'fk': ('ClientID', 'Clients'),
        'columns': [('LocationID', I), ('ClientID', I), ('Address', S), ('City', S), ('Province', S),
                    ('Postal_Code', S), ('Region', S), ('Location_Name', S), ('Primary', B)],
    },
    'ClientServices': {
        'remote': 'Client_Services_remote', 'key': 'Service_ID', 'fk': ('SPrimary_ID', 'Clients'),
        'columns': [
            ('Service_ID', I), ('SPrimary_ID', I), ('Date', T), ('Staff_ID', S),
            ('WESBC_Department', S), ('Contact_Type', S), ('Info_Given', S),
            ('Total_Time_Required', I), ('Amount_Leveraged', D),
            ('RefWD', B), ('RefCFDC', B), ('RefChamber', B), ('RefFinancial', B),
            ('RefVanCity', B), ('RefAdvisor', B), ('RefOther', B),
            ('Financing', B), ('Notes', S),
        ],
    },
    'ContactTracking': {
        'remote': 'Contact_Tracking_Remote', 'key': 'Record_Id', 'fk': ('BPrimary__ID', 'Clients'),
        'columns': [
            ('Record_Id', I), ('BPrimary__ID', I), ('Date_In', T),
            ('Date__Reviewed', T), ('Date_To_Analyst', T), ('Date_Client_Contact', T),
            ('Staff_Contact', S), ('Application_Fee_Received', B), ('Contact_Type', S),
            ('Report_Type', S), ('Assessment_Hours', S), ('Final_Status', S),
            ('Status_Date', T),
        ],
    },
    'Loans': {
        'remote': 'Loans_remote', 'key': 'Loan_ID', 'fk': ('LPrimary_ID', 'Clients'),
        'columns': [
            ('Loan_ID', I), ('LPrimary_ID', I), ('Loan_Number', S), ('Input_Date', T),
            ('Fund_Usage', S), ('Purpose_of_Loan', S), ('Loan_Amount_Approved', D),
            ('LP_WorkingCapital', B), ('LP_WorkingCapital_Amnt', D),
            ('LP_Equipment', B), ('LP_Equipment_Amnt', D),
            ('LP_Leaseholds', B), ('LP_Leaseholds_Amnt', D),
            ('LP_Inventory', B), ('LP_Inventory_Amnt', D),
            ('LP_BusinessPurchase', B), ('LP_BusinessPurchase_Amnt', D),
            ('Equity_Amount', D), ('SecurityAmount', D),
            ('LoanTerm', I), ('PrimeRate', D), ('PrimeRatePlus', D),
            ('PaymentAmount', D), ('FirstPmtDue', T), ('LoanExpiryDate', T),
            ('AdminFee', D), ('DisbursalFirstAmount', D), ('DisbursalSecondAmount', D),
            ('DisbursalThirdAmount', D), ('SeasonalPayment', B), ('eacloan', B),
        ],
    },
    'SARI_Assessment': {
        'remote': 'SuccessAssessmentRecords_remote', 'key': 'ID', 'fk': ('Primary_ID', 'Clients'),
        'columns': [('ID', I), ('Primary_ID', I), ('RptDate', T), ('Industry', I),
                    ('MarketDemand', I), ('MgmtAndCreditHistory', I), ('Fin_Startup', I),
                    ('Fin_Exist', I), ('AssessDate', T), ('Notes', S)],
    },
    'SARI_Financials': {
        'remote': 'SARI_Financials', 'key': 'ID', 'fk': ('Primary_ID', 'Clients'),
        'columns': [('ID', I), ('Primary_ID', I), ('RptDate', T), ('Revenue', D),
                    ('COGS', D), ('Expenses', D), ('Assets', D), ('Liabilities', D),
                    ('AssessDate', T), ('Notes', S)],
    },
    'FSReceived': {
        'remote': 'FSReceived', 'key': 'FSRecID', 'fk': ('LPrimaryID', 'Clients'),
        'columns': [('FSRecID', I), ('LPrimaryID', I), ('IncStmt', B), ('BalSht', B),
                    ('CashFlow', B), ('YrEnd', B), ('ForPeriodOf', T), ('DateReceived', T),
                    ('DateToAnalyst', T), ('DateReviewed', T), ('Notes', S)],
    },
    'PersonalProfiles': {
        'remote': 'PersonalProfiles', 'key': 'ProfileRowID', 'fk': ('Primary_ID', 'Clients'),
        'columns': [
            ('ProfileRowID', I), ('Primary_ID', I), ('Loan_ID', I), ('Name', S),
            ('Beacon', S), ('HAddress', S), ('HCity', S), ('HProv', S), ('HPC', S),
            ('HomePhone', S), ('CellPhone', S), ('Email', S), ('DOB', T),
            ('PersonalCRA', S), ('PersonalCRAAmount', D), ('FLG', B), ('LLG', B),
            ('Director', B), ('PPP', B),
        ],
    },
    'Shareholders': {
        'remote': 'Shareholders', 'key': 'ShareRowID', 'fk': ('Primary_ID', 'Clients'),
        'columns': [('ShareRowID', I), ('Primary_ID', I), ('Loan_ID', I), ('Name', S),
                    ('Shareholder', B), ('ShareholderPercent', I), ('Director', B), ('Gender', S)],
    },
    'Impact': {
        'remote': 'Impact', 'key': 'ID', 'fk': ('primaryid', 'Clients'),
        'columns': [
            ('ID', I), ('primaryid', I), ('SurveyDate', T), ('IsRunning', B),
            ('Revenue', D), ('Months', I), ('ProfitsAvailable', B), ('AsExpected', B),
            ('Employees', B), ('FullTime', I), ('PartTime', I),
            ('CurSkillGen', I), ('CurSkillIT', I), ('CurSkillFin', I),
            ('CurSkillHR', I), ('CurSkillMktg', I), ('TrainingSatisfaction', I),
            ('CustService', I), ('QualityServices', I), ('MeetingNeeds', I),
            ('Accessible', I), ('Reliable', I), ('HowToImprove', S),
        ],
    },
    'MentorMatches': {
        'remote': 'MentorMatches', 'key': 'MentorRowID', 'fk': ('ClientID', 'Clients'),
        'columns': [('MentorRowID', I), ('ClientID', I), ('ActiveMentxx', B),
                    ('skillset', S), ('skill1', S), ('skill2', S), ('skill3', S),
                    ('OneToOneRank', I), ('PeerRank', I), ('ForumRank', I)],
    },
    'MenteeMatches': {
        'remote': 'MenteeMatches', 'key': 'MenteeRowID', 'fk': ('ClientID', 'Clients'),
        'columns': [('MenteeRowID', I), ('ClientID', I), ('ActiveMentxx', B),
                    ('challengeset', S), ('challenge1', S), ('challenge2', S),
                    ('OneToOneRank', I), ('PeerRank', I), ('ForumRank', I)],
    },
    'TrainingReg': {
        'remote': 'TrainingReg', 'key': 'RegistrationID', 'fk': ('ClientID', 'Clients'),
        'columns': [('RegistrationID', I), ('ClientID', I), ('TrainingID', I),
                    ('RegDate', T), ('TotalAmtPaid', D), ('PmtReceived', B),
                    ('Attended', B), ('Cancelled', B), ('RequiredForLoan', B),
                    ('HowDidYouHear', S), ('Notes', S)],
    },
    'Training': {
        'remote': 'Training_remote', 'key': 'TrainingID',
        'columns': [('TrainingID', I), ('TrainingType', S), ('CourseName', S),
                    ('Location', S), ('StartDate', T), ('EndDate', T),
                    ('Facilitator', S), ('Fee', D), ('Active', B)],
    },
    'Source': {
        'remote': 'Source', 'key': 'SID',
        'columns': [('SID', I), ('Source', S), ('Description', S)],
    },
    'Referral': {
        'remote': 'Referral', 'key': 'ID',
        'columns': [('ID', I), ('SID', I), ('Referral', S), ('Description', S)],
    },
}

# ----------------------------------------------------------------------------
# RELATIONSHIPS  (fromColumn many-side  ->  toColumn one-side)
# All child tables relate to Clients.Primary_ID via their FK.
# ----------------------------------------------------------------------------
RELATIONSHIPS = [
    # (fromTable, fromCol, toTable, toCol)
    ('ClientPhones', 'ClientID', 'Clients', 'Primary_ID'),
    ('AdditionalEmails', 'ClientID', 'Clients', 'Primary_ID'),
    ('BLIS', 'ClientID', 'Clients', 'Primary_ID'),
    ('LinkedCompanies', 'ClientID', 'Clients', 'Primary_ID'),
    ('Locations', 'ClientID', 'Clients', 'Primary_ID'),
    ('ClientServices', 'SPrimary_ID', 'Clients', 'Primary_ID'),
    ('ContactTracking', 'BPrimary__ID', 'Clients', 'Primary_ID'),
    ('Loans', 'LPrimary_ID', 'Clients', 'Primary_ID'),
    ('SARI_Assessment', 'Primary_ID', 'Clients', 'Primary_ID'),
    ('SARI_Financials', 'Primary_ID', 'Clients', 'Primary_ID'),
    ('FSReceived', 'LPrimaryID', 'Clients', 'Primary_ID'),
    ('PersonalProfiles', 'Primary_ID', 'Clients', 'Primary_ID'),
    ('Shareholders', 'Primary_ID', 'Clients', 'Primary_ID'),
    ('Impact', 'primaryid', 'Clients', 'Primary_ID'),
    ('MentorMatches', 'ClientID', 'Clients', 'Primary_ID'),
    ('MenteeMatches', 'ClientID', 'Clients', 'Primary_ID'),
    ('TrainingReg', 'ClientID', 'Clients', 'Primary_ID'),
    ('TrainingReg', 'TrainingID', 'Training', 'TrainingID'),
    ('Clients', 'SourceID', 'Source', 'SID'),
    ('Clients', 'ReferralID', 'Referral', 'ID'),
]

# ----------------------------------------------------------------------------
# MEASURES (on a dedicated _Measures table)
# ----------------------------------------------------------------------------
MEASURES = [
    ('# Clients', "DISTINCTCOUNT(Clients[Primary_ID])", '#,0'),
    ('# Loans', "COUNTROWS(Loans)", '#,0'),
    ('Total Loan Approved', "SUM(Loans[Loan_Amount_Approved])", r'\$#,0'),
    ('Total Disbursed', "SUM(Loans[DisbursalFirstAmount]) + SUM(Loans[DisbursalSecondAmount]) + SUM(Loans[DisbursalThirdAmount])", r'\$#,0'),
    ('Jobs Created', "SUM(Clients[Jobs_Created])", '#,0'),
    ('Jobs Maintained', "SUM(Clients[Jobs_Maintained])", '#,0'),
    ('# Contacts', "COUNTROWS(ContactTracking)", '#,0'),
    ('# Training Regs', "COUNTROWS(TrainingReg)", '#,0'),
    ('Avg Annual Revenue', "AVERAGE(Clients[Annual_Revenue])", r'\$#,0'),
]

# Sample client identities (synthetic — NO real PII). id -> (First, Last, Company)
CLIENTS = [
    (101, 'Anna',   'Iboard',    'Iboard Design Co.'),
    (102, 'Priya',  'Sharma',    'Spice Route Foods'),
    (103, 'Maria',  'Gomez',     'Coastal Crafts Ltd.'),
    (104, 'Linda',  'Chen',      'GreenLeaf Consulting'),
    (105, 'Sara',   'Okafor',    'Okafor Logistics'),
    (106, 'Emily',  'Tremblay',  'Aurora Wellness'),
    (107, 'Nadia',  'Hassan',    'Hassan Tech Labs'),
    (108, 'Grace',  'Williams',  'Williams Bakery'),
]
