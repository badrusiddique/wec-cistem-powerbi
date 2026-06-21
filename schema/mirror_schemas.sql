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


CREATE TABLE [Archive_Client_Phones]
 (
	[PhoneID]			Long Integer, 
	[ClientID]			Long Integer, 
	[PhoneNum]			Text (10), 
	[PhoneDesc]			Long Integer, 
	[PhoneNotes]			Memo/Hyperlink (255)
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


CREATE TABLE [tbl_LoanClientInfo_Profiles]
 (
	[Primary_ID]			Long Integer, 
	[MentionStartDate]			DateTime, 
	[CTCategory]			Text (50), 
	[CommTypeDesc]			Text (50)
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


CREATE TABLE [tbl_GuideCount]
 (
	[GuideName]			Text (100), 
	[CountOfGuideName]			Long Integer, 
	[SellingOffice]			Text (50)
);


CREATE TABLE [Source]
 (
	[Source]			Text (50), 
	[Description]			Text (255), 
	[SID]			Long Integer
);


CREATE TABLE [Referral]
 (
	[ID]			Long Integer, 
	[SID]			Long Integer, 
	[Referral]			Text (50), 
	[Description]			Text (50)
);


