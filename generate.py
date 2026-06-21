# -*- coding: utf-8 -*-
"""
Generate a Power BI Project (.pbip) for the WEC CISTEM prototype:
  - TMDL semantic model (real schema + relationships + measures + INLINE synthetic stub data)
  - PBIR report (12 named pages; visuals layered in a later pass)
  - .pbip / definition.pbism / .platform scaffolding

Run:  python3 generate.py
Output: ./WEC-CISTEM.pbip  + WEC-CISTEM.SemanticModel/  + WEC-CISTEM.Report/
"""
import json, os, uuid, shutil
import model_def as M

ROOT = os.path.dirname(os.path.abspath(__file__))
NAME = "WEC-CISTEM"
SM = os.path.join(ROOT, f"{NAME}.SemanticModel")
RP = os.path.join(ROOT, f"{NAME}.Report")

TAB = "\t"

# Deterministic GUID (no Math.random equivalent needed)
def guid(seed):
    return str(uuid.uuid5(uuid.NAMESPACE_DNS, "wec-cistem:" + seed))

# ----------------------------------------------------------------------------
# Synthetic stub data (NO real PII)
# ----------------------------------------------------------------------------
LANGS = ["English", "French"]
SECTORS = ["Retail", "Food & Beverage", "Professional Services", "Technology",
           "Manufacturing", "Wellness", "Logistics", "Creative"]
STRUCTS = ["Sole Proprietor", "Incorporated", "Partnership"]
CITIES = ["Vancouver", "Kelowna", "Victoria", "Surrey", "Burnaby"]
STAFF = ["J. Olsen", "M. Reyes", "T. Bhatt", "K. Lund"]
STATUSES = ["Active", "Pending", "Completed", "On Hold"]

def fake(table, col, dt, i, client_id):
    """Deterministic synthetic value for (table, col) on row i (client_id is the linked client)."""
    name = col.lower()
    tcode = dt[0]
    # Clients identity mapping
    if table == 'Clients':
        cid, first, last, company = next(c for c in M.CLIENTS if c[0] == client_id)
        if col == 'Primary_ID': return cid
        if col == 'First': return first
        if col == 'Last': return last
        if col == 'Company': return company
        if col == 'Salutation': return "Ms"
        if col == 'Email': return f"{first.lower()}@{last.lower()}.example"
        if col == 'SIN': return "XXX-XXX-XXX"          # masked, synthetic
        if col == 'SourceID': return (i % 4) + 1
        if col == 'ReferralID': return (i % 3) + 1
        if col == 'Source': return ["Web", "Referral", "Event", "Walk-in"][i % 4]
        if col == 'Business_Sector': return SECTORS[i % len(SECTORS)]
        if col == 'Business_Structure': return STRUCTS[i % len(STRUCTS)]
        if col == 'Business_Status': return ["Start-up", "Existing", "Expanding"][i % 3]
        if col == 'City' or col == 'HCity': return CITIES[i % len(CITIES)]
        if col == 'Province' or col == 'HProv': return "BC"
        if col == 'Counsellor_Assigned' or col == 'Loan_Admin_Assigned': return STAFF[i % len(STAFF)]
        if col == 'Age': return 28 + (i * 4) % 35
        if col == 'Number_ofEmployees': return 1 + (i * 2) % 12
        if col == 'Jobs_Created': return float((i * 3) % 9)
        if col == 'Jobs_Maintained': return float((i * 2) % 6)
        if col == 'Annual_Revenue': return 45000 + (i * 31000) % 400000
        if col == 'Principal_Language': return LANGS[i % 2]
        if col == 'Status': return STATUSES[i % len(STATUSES)]
        if col == 'Via': return ["Phone", "Email", "In Person", "Web"][i % 4]
        if col == 'Promo_Consent_Status': return ["Consented", "Declined", "Pending"][i % 3]
        if col == 'Business_Plan_Status': return ["Complete", "In Progress", "Not Started"][i % 3]
        if col == 'Looking_For_Financing': return ["Yes", "No", "Maybe"][i % 3]
        if col in ('Send_Via', 'Planner', 'Bus_Analyst', 'WEConnect_Cert_By', 'Updated_By'): return STAFF[i % len(STAFF)]
        if col in ('CFDC', 'EMWE', 'C3'): return ["Y", "N", "R"][i % 3]
        if col == 'C3_Industry': return SECTORS[(i + 1) % len(SECTORS)]
        if col == 'Client': return True
    # FK columns -> link to client
    fk = M.TABLES[table].get('fk')
    if fk and col == fk[0]:
        return client_id
    if table == 'Clients' and col == M.TABLES['Clients']['key']:
        return client_id
    # generic by type
    if tcode == 'int64':
        if col.endswith('ID') or col.endswith('_ID') or col == 'SID':
            return i + 1
        return (i * 7) % 5 + 1
    if tcode == 'double':
        base = {'Loan_Amount_Approved': 25000, 'Revenue': 80000, 'Assets': 120000,
                'Liabilities': 40000, 'Expenses': 55000, 'COGS': 30000,
                'PaymentAmount': 650, 'AdminFee': 250, 'Fee': 199}.get(col, 1000)
        return float(base + (i * 1234) % 9000)
    if tcode == 'boolean':
        return ((i + len(col)) % 3) == 0
    if tcode == 'dateTime':
        y = 2023 + (i % 2); m = (i % 12) + 1; d = (i % 26) + 1
        return ("date", y, m, d)
    # string
    if col == 'Staff_Contact' or col == 'Staff_ID' or col == 'Facilitator':
        return STAFF[i % len(STAFF)]
    if 'status' in name: return STATUSES[i % len(STATUSES)]
    if col == 'CourseName': return ["Business Basics", "Marketing 101", "Cash Flow", "Digital Sales"][i % 4]
    if col == 'Loan_Number': return f"L-{client_id}-{i+1:03d}"
    if col == 'Notes' or name.endswith('notes') or col == 'HowToImprove':
        return f"Sample note {i+1}"
    if col == 'Source': return ["Web", "Referral", "Event"][i % 3]
    if col == 'Description': return f"{col} {i+1}"
    if col == 'Referral': return ["Bank/CU", "Chamber", "Advisor"][i % 3]
    return f"{col}-{i+1}"

def rows_for(table):
    """Return list of row dicts. Dimensions get a fixed set; child tables get rows per client."""
    cols = M.TABLES[table]['columns']
    out = []
    if table == 'Source':
        for k, s in enumerate(["Web", "Referral", "Event", "Walk-in"]):
            out.append({'SID': k + 1, 'Source': s, 'Description': f"{s} source"})
        return out
    if table == 'Referral':
        for k, s in enumerate(["Bank/CU", "Chamber", "Advisor"]):
            out.append({'ID': k + 1, 'SID': (k % 4) + 1, 'Referral': s, 'Description': f"{s} referral"})
        return out
    if table == 'Training':
        for k in range(4):
            out.append({c[0]: fake(table, c[0], c[1], k, 0) for c in cols})
            out[-1]['TrainingID'] = k + 1
        return out
    if table == 'Clients':
        for i, c in enumerate(M.CLIENTS):
            out.append({col[0]: fake(table, col[0], col[1], i, c[0]) for col in cols})
        return out
    # child tables: ~1-2 rows per client
    counts = {'ContactTracking': 2, 'ClientPhones': 2, 'TrainingReg': 2}
    n = counts.get(table, 1)
    rid = 1
    for i, c in enumerate(M.CLIENTS):
        for j in range(n):
            r = {col[0]: fake(table, col[0], col[1], i + j, c[0]) for col in cols}
            key = M.TABLES[table]['key']
            if key in r: r[key] = rid
            if table == 'TrainingReg': r['TrainingID'] = (i % 4) + 1
            out.append(r); rid += 1
    return out

# ----------------------------------------------------------------------------
# TMDL emission
# ----------------------------------------------------------------------------
def m_literal(v, mt):
    if v is None: return "null"
    if isinstance(v, tuple) and v and v[0] == "date":
        return f"#date({v[1]},{v[2]},{v[3]})"
    if mt == 'logical': return "true" if v else "false"
    if mt in ('Int64.Type', 'number'): return str(v)
    s = str(v).replace('"', '""')
    return f'"{s}"'

def m_type(mt):
    return {'Int64.Type': 'Int64.Type', 'text': 'text', 'logical': 'logical',
            'number': 'number', 'datetime': 'date'}[mt]

def build_partition(table):
    cols = list(M.TABLES[table]['columns'])
    if table == 'Clients':
        cols = cols + [('FullName', M.S)]
    typerec = ", ".join(f"#\"{c[0]}\" = {m_type(c[1][1])}" for c in cols)
    data = rows_for(table)
    if table == 'Clients':
        for i, r in enumerate(data):
            r['FullName'] = f"{r.get('First','')} {r.get('Last','')} — {r.get('Company','')}"
    rowtxts = []
    for r in data:
        vals = ", ".join(m_literal(r.get(c[0]), c[1][1]) for c in cols)
        rowtxts.append("                    {" + vals + "}")
    rows_block = ",\n".join(rowtxts)
    m = (
        "let\n"
        "    Source = #table(\n"
        f"        type table [{typerec}],\n"
        "        {\n"
        f"{rows_block}\n"
        "        }\n"
        "    )\n"
        "in\n"
        "    Source"
    )
    return m, cols

def tmdl_table(table):
    info = M.TABLES[table]
    m, cols = build_partition(table)
    lines = [f"table {table}", f"{TAB}lineageTag: {guid('t:'+table)}", ""]
    key = info.get('key'); fk = info.get('fk')
    hidden = set()
    if key: hidden.add(key)
    if fk: hidden.add(fk[0])
    for cname, (dt, mt) in cols:
        col_decl = f"{TAB}column {cname}" if cname.isidentifier() else f"{TAB}column '{cname}'"
        lines.append(col_decl)
        lines.append(f"{TAB}{TAB}dataType: {dt}")
        if cname in hidden:
            lines.append(f"{TAB}{TAB}isHidden")
        lines.append(f"{TAB}{TAB}lineageTag: {guid('c:'+table+'.'+cname)}")
        lines.append(f"{TAB}{TAB}summarizeBy: none")
        lines.append(f"{TAB}{TAB}sourceColumn: {cname}")
        lines.append("")
    # partition with inline M (indented as table-child level + property level + expr level)
    lines.append(f"{TAB}partition {table} = m")
    lines.append(f"{TAB}{TAB}mode: import")
    lines.append(f"{TAB}{TAB}source =")
    for ml in m.split("\n"):
        lines.append(f"{TAB}{TAB}{TAB}{ml}")
    lines.append("")
    return "\n".join(lines) + "\n"

def tmdl_measures():
    lines = ["table _Measures", f"{TAB}lineageTag: {guid('t:_Measures')}", ""]
    # a hidden anchor column so the table is valid
    lines += [f"{TAB}column _dummy", f"{TAB}{TAB}dataType: int64", f"{TAB}{TAB}isHidden",
              f"{TAB}{TAB}lineageTag: {guid('c:_Measures._dummy')}", f"{TAB}{TAB}summarizeBy: none",
              f"{TAB}{TAB}sourceColumn: _dummy", ""]
    for mname, expr, fmt in M.MEASURES:
        lines.append(f"{TAB}measure '{mname}' = {expr}")
        lines.append(f"{TAB}{TAB}formatString: {fmt}")
        lines.append(f"{TAB}{TAB}lineageTag: {guid('m:'+mname)}")
        lines.append("")
    lines.append(f"{TAB}partition _Measures = m")
    lines.append(f"{TAB}{TAB}mode: import")
    lines.append(f"{TAB}{TAB}source =")
    for ml in ["let", "    Source = #table(type table [_dummy = Int64.Type], {{1}})", "in", "    Source"]:
        lines.append(f"{TAB}{TAB}{TAB}{ml}")
    lines.append("")
    return "\n".join(lines) + "\n"

def tmdl_relationships():
    out = []
    for (ft, fc, tt, tc) in M.RELATIONSHIPS:
        rid = guid(f"r:{ft}.{fc}->{tt}.{tc}")
        out.append(f"relationship {rid}")
        out.append(f"{TAB}fromColumn: {ft}.{fc}")
        out.append(f"{TAB}toColumn: {tt}.{tc}")
        out.append("")
    return "\n".join(out) + "\n"

def tmdl_model():
    tables = list(M.TABLES.keys()) + ["_Measures"]
    lines = ["model Model", f"{TAB}culture: en-US", f"{TAB}defaultPowerBIDataSourceVersion: powerBI_V3", ""]
    for t in tables:
        lines.append(f"ref table {t}")
    lines.append("")
    return "\n".join(lines) + "\n"

# ----------------------------------------------------------------------------
# Scaffolding files
# ----------------------------------------------------------------------------
PAGES = [
    ("Classic", "Classic"), ("BizInfo", "Biz Info"), ("ClientServices", "Client Services"),
    ("ContactTracking", "Contact Tracking"), ("PersonalProfiles", "Personal Profiles"),
    ("LoanServices", "Loan Services"), ("TrainingGuides", "Training/Guide Purchases"),
    ("ClientActivity", "Client Activity"), ("ImpactSurvey", "Impact Survey"),
    ("Notes", "Notes"), ("Mentxx", "Mentxx"), ("Ian", "Ian"),
]

VC = "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/visualContainer/2.10.0/schema.json"

# Per-page content: cards (measures) + tables (entity, [columns]). Faithful to the 12 tabs.
PAGE_CONTENT = {
    'Classic': {'cards': ['# Loans', 'Total Loan Approved', 'Jobs Created', 'Avg Annual Revenue'],
        'tables': [
            ('Clients', ['Company', 'Address', 'City', 'Province', 'Postal_Code', 'Region', 'Email', 'Website', 'Counsellor_Assigned', 'Loan_Admin_Assigned']),
            ('Clients', ['Business_Structure', 'Business_Sector', 'Business_Start_Date', 'Number_ofEmployees', 'Industry', 'Source', 'Referral', 'Programs', 'Business_Status']),
            ('ClientPhones', ['PhoneNum', 'PhoneDesc', 'PhoneNotes'])]},
    'BizInfo': {'cards': ['Jobs Created', 'Jobs Maintained', 'Avg Annual Revenue', '# Loans'],
        'tables': [
            ('Clients', ['Business_Structure', 'Business_Sector', 'Industry', 'Home_Based', 'Franchise', 'Import_Export', 'Distributor_Agent', 'Manufacturing', 'Retail', 'Service', 'Professional']),
            ('Clients', ['Number_ofEmployees', 'Jobs_Created', 'Jobs_Maintained', 'Annual_Revenue', 'Years_in_Business', 'Business_Start_Date', 'Business_Status']),
            ('SARI_Assessment', ['RptDate', 'MarketDemand', 'MgmtAndCreditHistory', 'Fin_Startup', 'Fin_Exist', 'Notes'])]},
    'ClientServices': {'cards': ['# Clients'],
        'tables': [
            ('ClientServices', ['Date', 'Staff_ID', 'WESBC_Department', 'Contact_Type', 'Info_Given', 'Total_Time_Required', 'Amount_Leveraged', 'Financing', 'Notes']),
            ('ClientServices', ['Date', 'RefWD', 'RefCFDC', 'RefChamber', 'RefFinancial', 'RefVanCity', 'RefAdvisor', 'RefOther'])]},
    'ContactTracking': {'cards': ['# Contacts'],
        'tables': [
            ('ContactTracking', ['Date_In', 'Date__Reviewed', 'Date_To_Analyst', 'Date_Client_Contact', 'Staff_Contact', 'Contact_Type', 'Report_Type', 'Final_Status', 'Status_Date', 'Assessment_Hours'])]},
    'PersonalProfiles': {'cards': ['# Clients'],
        'tables': [
            ('Clients', ['Date_of_Birth', 'Marital_Status', 'Dependants', 'SIN', 'HAddress', 'HCity', 'HProv', 'HPC', 'Home_Phone', 'Entrepreneurial_Experience', 'Related_Experience', 'Bankruptcy', 'Education', 'Spouse_Name']),
            ('PersonalProfiles', ['Name', 'Beacon', 'HomePhone', 'CellPhone', 'Email', 'DOB', 'PersonalCRA', 'PersonalCRAAmount', 'FLG', 'LLG', 'Director', 'PPP']),
            ('Shareholders', ['Name', 'Shareholder', 'ShareholderPercent', 'Director', 'Gender'])]},
    'LoanServices': {'cards': ['# Loans', 'Total Loan Approved', 'Total Disbursed'],
        'tables': [
            ('Loans', ['Loan_Number', 'Input_Date', 'Fund_Usage', 'Purpose_of_Loan', 'Loan_Amount_Approved', 'LoanTerm', 'PrimeRate', 'PrimeRatePlus', 'PaymentAmount', 'FirstPmtDue', 'LoanExpiryDate', 'AdminFee']),
            ('Loans', ['Loan_Number', 'LP_WorkingCapital_Amnt', 'LP_Equipment_Amnt', 'LP_Leaseholds_Amnt', 'LP_Inventory_Amnt', 'LP_BusinessPurchase_Amnt', 'Equity_Amount', 'SecurityAmount', 'DisbursalFirstAmount', 'DisbursalSecondAmount', 'DisbursalThirdAmount']),
            ('FSReceived', ['IncStmt', 'BalSht', 'CashFlow', 'YrEnd', 'ForPeriodOf', 'DateReceived', 'DateToAnalyst', 'DateReviewed', 'Notes'])]},
    'TrainingGuides': {'cards': ['# Training Regs'],
        'tables': [
            ('TrainingReg', ['RegDate', 'TotalAmtPaid', 'PmtReceived', 'Attended', 'Cancelled', 'RequiredForLoan', 'HowDidYouHear', 'Notes']),
            ('Training', ['CourseName', 'TrainingType', 'Location', 'StartDate', 'EndDate', 'Facilitator', 'Fee', 'Active'])]},
    'ClientActivity': {'cards': ['# Contacts', '# Training Regs'],
        'tables': [
            ('ContactTracking', ['Date_In', 'Contact_Type', 'Report_Type', 'Final_Status']),
            ('TrainingReg', ['RegDate', 'Attended', 'RequiredForLoan']),
            ('ClientServices', ['Date', 'Contact_Type', 'Info_Given'])]},
    'ImpactSurvey': {'cards': ['# Clients'],
        'tables': [
            ('Impact', ['SurveyDate', 'IsRunning', 'Revenue', 'Months', 'ProfitsAvailable', 'AsExpected', 'Employees', 'FullTime', 'PartTime']),
            ('Impact', ['CurSkillGen', 'CurSkillIT', 'CurSkillFin', 'CurSkillHR', 'CurSkillMktg', 'TrainingSatisfaction', 'CustService', 'QualityServices', 'MeetingNeeds', 'Accessible', 'Reliable'])]},
    'Notes': {'cards': [],
        'tables': [
            ('Clients', ['Company', 'Notes']),
            ('ClientServices', ['Date', 'Staff_ID', 'Notes'])]},
    'Mentxx': {'cards': [],
        'tables': [
            ('MentorMatches', ['ActiveMentxx', 'skillset', 'skill1', 'skill2', 'skill3', 'OneToOneRank', 'PeerRank', 'ForumRank']),
            ('MenteeMatches', ['ActiveMentxx', 'challengeset', 'challenge1', 'challenge2', 'OneToOneRank', 'PeerRank', 'ForumRank'])]},
    'Ian': {'cards': ['# Clients', '# Loans', 'Total Loan Approved', 'Jobs Created'],
        'tables': [
            ('Clients', ['Salutation', 'First', 'Last', 'Company', 'Partner', 'Principal_Language', 'Client', 'Inactive_Record', 'Business_Closed', 'Newsletter_Recipient']),
            ('Clients', ['Aboriginal', 'Visible_Minority', 'Youth', 'Disabled', 'Employed', 'Social_Assistance', 'EI_Recipient', 'Age', 'Programs', 'Business_Status'])]},
}

def _col_ref(entity, prop):
    return {"field": {"Column": {"Expression": {"SourceRef": {"Entity": entity}}, "Property": prop}},
            "queryRef": f"{entity}.{prop}", "nativeQueryRef": prop}

def _measure_ref(prop, entity="_Measures"):
    return {"field": {"Measure": {"Expression": {"SourceRef": {"Entity": entity}}, "Property": prop}},
            "queryRef": f"{entity}.{prop}", "nativeQueryRef": prop}

def _pos(x, y, w, h, z):
    return {"x": x, "y": y, "z": z, "width": w, "height": h, "tabOrder": z}

def v_slicer(name, pos, entity, prop):
    return {"$schema": VC, "name": name, "position": pos,
            "visual": {"visualType": "slicer",
                       "query": {"queryState": {"Values": {"projections": [dict(_col_ref(entity, prop), active=True)]}}},
                       "objects": {"data": [{"properties": {"mode": {"expr": {"Literal": {"Value": "'Basic'"}}}}}]}}}

def v_table(name, pos, entity, cols):
    return {"$schema": VC, "name": name, "position": pos,
            "visual": {"visualType": "tableEx",
                       "query": {"queryState": {"Values": {"projections": [_col_ref(entity, c) for c in cols]}}}}}

def v_card(name, pos, measure):
    return {"$schema": VC, "name": name, "position": pos,
            "visual": {"visualType": "cardVisual",
                       "query": {"queryState": {"Data": {"projections": [_measure_ref(measure)]}}}}}

def v_multirow(name, pos, entity, cols):
    return {"$schema": VC, "name": name, "position": pos,
            "visual": {"visualType": "multiRowCard",
                       "query": {"queryState": {"Values": {"projections": [_col_ref(entity, c) for c in cols]}}}}}

def _title(text):
    return {"title": [{"properties": {
        "show": {"expr": {"Literal": {"Value": "true"}}},
        "text": {"expr": {"Literal": {"Value": "'" + text.replace("'", "''") + "'"}}}}}]}

def with_title(v, text):
    v["visual"]["visualContainerObjects"] = _title(text)
    return v

def vid(seed):
    return guid(seed).replace('-', '')[:20]

# Slim header band shown on every page (key identity — the full header detail is on Classic)
HEADER = [
    ("Client", ['Salutation', 'First', 'Last', 'Company']),
    ("Profile", ['Partner', 'Principal_Language', 'Programs', 'Status']),
    ("Snapshot", ['Disabled', 'Visible_Minority', 'Aboriginal', 'Growth_Client']),
]

# Full faithful sections per tab: (title, entity, [fields]). Entity 'Clients' = 1-row detail; others = datasheets.
PAGE_SECTIONS = {
    'Classic': [
        ("Identity & Consent", 'Clients', ['Salutation', 'First', 'Last', 'Company', 'Partner', 'Principal_Language', 'File_Location', 'Promo_Ack_Rel_Recd', 'Promo_Consent_Status', 'Promo_Consent_Date']),
        ("Flags", 'Clients', ['Photo_Bio_Release', 'Testimonial_On_File', 'Storyteller', 'Business_Closed', 'Inactive_Record', 'WESBCInitiated']),
        ("Demographics & Age", 'Clients', ['Disabled', 'Visible_Minority', 'Francophone', 'Aboriginal', 'LGBTQIA2S', 'Immigrant_NewCanadian_Refugee', 'Age', 'Age_Under30', 'Age_30_39', 'Age_40_44', 'Age_45_54', 'Age_Over55']),
        ("Program & Status", 'Clients', ['Programs', 'WEConnect', 'WEConnect_Cert_By', 'Growth_Client', 'NDIT', 'NDIT_On_Date', 'Status', 'Via', 'Updated', 'Updated_By', 'Referral_Recd', 'Loan_Recd', 'Pending_Recd']),
        ("Main Location", 'Clients', ['Address', 'City', 'Province', 'Postal_Code', 'Region', 'Location', 'CFDC', 'EMWE', 'C3']),
        ("Industry / Business", 'Clients', ['Industry', 'C3_Industry', 'Business_Sector', 'Business_Description', 'Tourism_Operator', 'Manufacturing_PPE', 'Business_Start_Date', 'Home_Based', 'Commercial_Outlet', 'Distributor_Agent', 'Franchise', 'Import_Export']),
        ("Email & Contacts", 'Clients', ['Email', 'AltEMail', 'Website', 'Send_Via', 'Planner', 'Bus_Analyst']),
        ("Client Referral", 'Clients', ['Source', 'Referral', 'Referral_Name']),
        ("Business Plan", 'Clients', ['Business_Plan_Status', 'Looking_For_Financing', 'Financing_Amt']),
        ("Contact Notes", 'Clients', ['Contact_Notes']),
        ("Additional Locations", 'Locations', ['Address', 'City', 'Province', 'Postal_Code', 'Region', 'Location_Name', 'Primary']),
        ("Additional Emails", 'AdditionalEmails', ['Name', 'Role', 'EMail', 'Notes']),
        ("Phones", 'ClientPhones', ['PhoneNum', 'PhoneDesc', 'PhoneNotes', 'Primary', 'LocID']),
        ("BLIS Sessions", 'BLIS', ['Notes', 'DateModified']),
        ("Linked Companies", 'LinkedCompanies', ['Description']),
    ],
    'BizInfo': [
        ("Business Details", 'Clients', ['Business_Structure', 'Business_Number', 'Ownership_Details', 'Business_Start_Date', 'Industry', 'Business_Sector']),
        ("Business Description", 'Clients', ['Business_Description']),
        ("Business Type", 'Clients', ['Distributor_Agent', 'Franchise', 'Social_Enterprise', 'Import_Export', 'Home_Based', 'Commercial_Outlet', 'B2B', 'B2C', 'Tourism_Operator', 'Manufacturing_PPE', 'Interested_In_Mentor']),
        ("Metrics / Financing", 'Clients', ['Number_ofEmployees', 'Jobs_Created', 'Jobs_Maintained', 'Jobs_Expanded', 'Annual_Revenue']),
        ("Financing", 'Clients', ['Business_Plan_Status', 'Looking_For_Financing', 'Financing_Amt']),
        ("Client Referred By", 'Clients', ['Source', 'Referral', 'Referral_Name']),
        ("WEC Care By", 'Clients', ['Bus_Analyst', 'BA_Loan_Assr', 'BA_2nd_Reviewer', 'BA_Loan_Care']),
        ("Business Court Search", 'Clients', ['Court_Status', 'Court_Date', 'Court_Notes']),
        ("CRA", 'Clients', ['CRA_Status', 'CRA_Date', 'CRA_Amount', 'CRA_Notes']),
        ("Commercial Beacon", 'Clients', ['Commercial_Beacon']),
        ("Email & Contacts", 'Clients', ['Email', 'AltEMail', 'Website']),
        ("Phones", 'ClientPhones', ['PhoneNum', 'PhoneDesc', 'PhoneNotes', 'Primary', 'LocID']),
    ],
    'ClientServices': [
        ("Service", 'ClientServices', ['Date', 'Staff_ID', 'WESBC_Department', 'Contact_Type', 'Info_Given']),
        ("Time & Leverage", 'ClientServices', ['Total_Time_Required', 'Amount_Leveraged', 'Financing']),
        ("Referred To", 'ClientServices', ['RefWD', 'RefCFDC', 'RefChamber', 'RefFinancial', 'RefVanCity', 'RefAdvisor', 'RefOther']),
        ("Notes", 'ClientServices', ['Date', 'Notes']),
    ],
    'ContactTracking': [
        ("Contact", 'ContactTracking', ['Date_In', 'Staff_Contact', 'Contact_Type', 'Report_Type']),
        ("Dates", 'ContactTracking', ['Date__Reviewed', 'Date_To_Analyst', 'Date_Client_Contact', 'Status_Date']),
        ("Status", 'ContactTracking', ['Application_Fee_Received', 'Assessment_Hours', 'Final_Status']),
    ],
    'PersonalProfiles': [
        ("Personal", 'Clients', ['Date_of_Birth', 'Marital_Status', 'Dependants', 'SIN']),
        ("Home Address", 'Clients', ['HAddress', 'HCity', 'HProv', 'HPC', 'Home_Phone']),
        ("Background", 'Clients', ['Entrepreneurial_Experience', 'Related_Experience', 'Bankruptcy', 'Education']),
        ("Family", 'Clients', ['Spouse_Name', 'Contact_Date']),
        ("Loan Profiles", 'PersonalProfiles', ['Name', 'Beacon', 'HomePhone', 'CellPhone', 'Email', 'DOB']),
        ("Profile CRA", 'PersonalProfiles', ['PersonalCRA', 'PersonalCRAAmount', 'FLG', 'LLG', 'Director', 'PPP']),
        ("Shareholders", 'Shareholders', ['Name', 'Shareholder', 'ShareholderPercent', 'Director', 'Gender']),
    ],
    'LoanServices': [
        ("Loan", 'Loans', ['Loan_Number', 'Input_Date', 'Fund_Usage', 'Purpose_of_Loan', 'Loan_Amount_Approved']),
        ("Loan Purpose", 'Loans', ['LP_WorkingCapital_Amnt', 'LP_Equipment_Amnt', 'LP_Leaseholds_Amnt', 'LP_Inventory_Amnt', 'LP_BusinessPurchase_Amnt']),
        ("Terms", 'Loans', ['LoanTerm', 'PrimeRate', 'PrimeRatePlus', 'PaymentAmount', 'FirstPmtDue']),
        ("Dates & Fees", 'Loans', ['LoanExpiryDate', 'AdminFee', 'Equity_Amount', 'SecurityAmount']),
        ("Disbursals", 'Loans', ['DisbursalFirstAmount', 'DisbursalSecondAmount', 'DisbursalThirdAmount', 'SeasonalPayment', 'eacloan']),
        ("Financial Statements", 'FSReceived', ['IncStmt', 'BalSht', 'CashFlow', 'YrEnd', 'ForPeriodOf']),
        ("FS Dates", 'FSReceived', ['DateReceived', 'DateToAnalyst', 'DateReviewed', 'Notes']),
    ],
    'TrainingGuides': [
        ("Training Registration", 'TrainingReg', ['RegDate', 'Attended', 'Cancelled', 'RequiredForLoan', 'PmtReceived']),
        ("Payment", 'TrainingReg', ['TotalAmtPaid', 'HowDidYouHear', 'Notes']),
        ("Course", 'Training', ['CourseName', 'TrainingType', 'Location', 'StartDate', 'EndDate']),
        ("Course Detail", 'Training', ['Facilitator', 'Fee', 'Active']),
    ],
    'ClientActivity': [
        ("Contacts", 'ContactTracking', ['Date_In', 'Contact_Type', 'Report_Type', 'Final_Status']),
        ("Training Summary", 'TrainingReg', ['RegDate', 'Attended', 'RequiredForLoan']),
        ("Service Activity", 'ClientServices', ['Date', 'Contact_Type', 'Info_Given']),
    ],
    'ImpactSurvey': [
        ("Survey", 'Impact', ['SurveyDate', 'IsRunning', 'Revenue', 'Months']),
        ("Profit & Employees", 'Impact', ['ProfitsAvailable', 'AsExpected', 'Employees', 'FullTime', 'PartTime']),
        ("Skill Levels", 'Impact', ['CurSkillGen', 'CurSkillIT', 'CurSkillFin', 'CurSkillHR', 'CurSkillMktg']),
        ("Satisfaction", 'Impact', ['TrainingSatisfaction', 'CustService', 'QualityServices', 'MeetingNeeds', 'Accessible']),
        ("Reliability & Notes", 'Impact', ['Reliable', 'HowToImprove']),
    ],
    'Notes': [
        ("Contact Notes", 'Clients', ['Contact_Notes']),
        ("General Notes", 'Clients', ['Notes']),
        ("Service Notes", 'ClientServices', ['Date', 'Staff_ID', 'Notes']),
    ],
    'Mentxx': [
        ("Mentor Match", 'MentorMatches', ['ActiveMentxx', 'skillset', 'skill1', 'skill2', 'skill3']),
        ("Mentor Ranks", 'MentorMatches', ['OneToOneRank', 'PeerRank', 'ForumRank']),
        ("Mentee Match", 'MenteeMatches', ['ActiveMentxx', 'challengeset', 'challenge1', 'challenge2']),
        ("Mentee Ranks", 'MenteeMatches', ['OneToOneRank', 'PeerRank', 'ForumRank']),
    ],
    'Ian': [
        ("Identity", 'Clients', ['Salutation', 'First', 'Last', 'Company', 'Partner']),
        ("Profile", 'Clients', ['Principal_Language', 'Client', 'Inactive_Record', 'Business_Closed', 'Newsletter_Recipient']),
        ("Demographics", 'Clients', ['Aboriginal', 'Visible_Minority', 'Youth', 'Disabled', 'Employed']),
        ("Status", 'Clients', ['Programs', 'Business_Status', 'Status', 'Via', 'Growth_Client']),
    ],
}

CANVAS_W = 1280
MARGIN = 8
GAP = 10
DETAIL_H = 96                     # 1-row Clients detail table
TABLE_H = 168                     # multi-row datasheet (child entities)
SLICER_H = 150
ZONE_BAR_H = 30                   # full-width zone divider bar
TITLE_H = 40                      # page title strip
COLCAP = {1: 8, 2: 5, 3: 3, 4: 2}  # max fields per table given the zone's column count (no h-scroll)

# Per-page zones: (zone_title, columns, [indices into PAGE_SECTIONS[pid]]) — gives mixed-column layout + dividers
PAGE_ZONE_GROUPS = {
    'Classic': [("Identity & Header", 2, [0, 1, 2, 3]), ("Location & Business", 2, [4, 5]),
                ("Contacts & Referral", 3, [6, 7, 8, 9]), ("Related Records", 2, [10, 11, 12, 13, 14])],
    'BizInfo': [("Business", 2, [0, 1, 2]), ("Financing & Metrics", 3, [3, 4, 9]),
                ("Care & Referral", 3, [5, 6, 7, 8]), ("Contacts", 2, [10, 11])],
    'ClientServices': [("Service", 2, [0, 1]), ("Referrals & Notes", 2, [2, 3])],
    'ContactTracking': [("Contact Tracking", 3, [0, 1, 2])],
    'PersonalProfiles': [("Personal", 3, [0, 1, 2, 3]), ("Loan Profile", 2, [4, 5, 6])],
    'LoanServices': [("Loan", 2, [0, 1]), ("Terms & Disbursal", 3, [2, 3, 4]), ("Financial Statements", 2, [5, 6])],
    'TrainingGuides': [("Training", 2, [0, 1]), ("Course", 2, [2, 3])],
    'ClientActivity': [("Activity", 3, [0, 1, 2])],
    'ImpactSurvey': [("Survey", 2, [0, 1]), ("Skills & Satisfaction", 3, [2, 3, 4])],
    'Notes': [("Notes", 2, [0, 1, 2])],
    'Mentxx': [("Mentor", 2, [0, 1]), ("Mentee", 2, [2, 3])],
    'Ian': [("Summary", 2, [0, 1, 2, 3])],
}

def _chunks(lst, n):
    return [lst[i:i + n] for i in range(0, len(lst), n)]

def build_page_visuals(pid):
    """Zoned layout: title strip + client selector + slim header, then content zones with
    per-zone column counts and full-width divider bars. Returns (visuals, page_height)."""
    out = []
    z = [0]
    def add(v):
        out.append((v["name"], v)); z[0] += 1
    inner = CANVAS_W - 2 * MARGIN

    # page title strip (full width)
    add(with_title(v_card(vid(f"v:{pid}:ttl"), _pos(MARGIN, 8, inner, TITLE_H, z[0]), '# Clients'),
                   f"WEC CISTEM  —  {dict(PAGES)[pid]}"))
    # client selector (left) + slim header sections (right, 3 across)
    add(v_slicer(vid(f"v:{pid}:sl"), _pos(MARGIN, 56, 320, SLICER_H, z[0]), 'Clients', 'FullName'))
    hx0, hcols = 338, len(HEADER)
    hcolw = (CANVAS_W - MARGIN - hx0 - (hcols - 1) * GAP) / hcols
    for i, (title, fields) in enumerate(HEADER):
        x = int(hx0 + i * (hcolw + GAP))
        add(with_title(v_table(vid(f"v:{pid}:h{i}"), _pos(x, 56, int(hcolw), DETAIL_H, z[0]), 'Clients', fields), title))
    y = 56 + SLICER_H + 16

    # content zones
    sections = PAGE_SECTIONS.get(pid, [])
    zones = PAGE_ZONE_GROUPS.get(pid, [("Details", 2, list(range(len(sections))))])
    for zi, (ztitle, cols, idxs) in enumerate(zones):
        add(with_title(v_card(vid(f"v:{pid}:z{zi}bar"), _pos(MARGIN, y, inner, ZONE_BAR_H, z[0]), '# Clients'), ztitle))
        y0 = y + ZONE_BAR_H + GAP
        colw = (inner - (cols - 1) * GAP) / cols
        colx = [int(MARGIN + i * (colw + GAP)) for i in range(cols)]
        coly = [y0] * cols
        cap = COLCAP[cols]
        for si in idxs:
            title, entity, fields = sections[si]
            h = DETAIL_H if entity == 'Clients' else TABLE_H
            for ci, ch in enumerate(_chunks(fields, cap)):
                c = coly.index(min(coly))
                t = title if ci == 0 else f"{title} – cont."
                add(with_title(v_table(vid(f"v:{pid}:z{zi}s{si}c{ci}"), _pos(colx[c], coly[c], int(colw), h, z[0]), entity, ch), t))
                coly[c] += h + GAP
        y = max(coly) + GAP
    return out, y + 8

def write(path, content):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

def write_json(path, obj):
    write(path, json.dumps(obj, indent=2))

def gen_semantic_model():
    if os.path.isdir(SM): shutil.rmtree(SM)
    defi = os.path.join(SM, "definition")
    write(os.path.join(defi, "database.tmdl"), f"database {NAME}\n{TAB}compatibilityLevel: 1567\n")
    write(os.path.join(defi, "model.tmdl"), tmdl_model())
    write(os.path.join(defi, "relationships.tmdl"), tmdl_relationships())
    for t in M.TABLES:
        write(os.path.join(defi, "tables", f"{t}.tmdl"), tmdl_table(t))
    write(os.path.join(defi, "tables", "_Measures.tmdl"), tmdl_measures())
    write_json(os.path.join(SM, "definition.pbism"),
               {"version": "4.2", "settings": {}})
    write_json(os.path.join(SM, ".platform"),
               {"$schema": "https://developer.microsoft.com/json-schemas/fabric/gitIntegration/platformProperties/2.0.0/schema.json",
                "metadata": {"type": "SemanticModel", "displayName": NAME},
                "config": {"version": "2.0", "logicalId": guid("sm")}})

def gen_report():
    if os.path.isdir(RP): shutil.rmtree(RP)
    defi = os.path.join(RP, "definition")
    write_json(os.path.join(RP, "definition.pbir"),
               {"$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definitionProperties/2.0.0/schema.json",
                "version": "4.0",
                "datasetReference": {"byPath": {"path": f"../{NAME}.SemanticModel"}}})
    write_json(os.path.join(defi, "version.json"),
               {"$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/versionMetadata/1.0.0/schema.json",
                "version": "2.0.0"})
    write_json(os.path.join(RP, "StaticResources", "RegisteredResources", THEME_FILE), _theme())
    write_json(os.path.join(defi, "report.json"),
               {"$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/report/3.3.0/schema.json",
                "resourcePackages": [{"name": "RegisteredResources", "type": "RegisteredResources",
                                      "items": [{"name": THEME_FILE, "path": THEME_FILE, "type": "CustomTheme"}]}],
                "themeCollection": {
                    "baseTheme": {"name": "CY24SU06",
                                  "reportVersionAtImport": {"visual": "1.8.91", "report": "2.0.91", "page": "1.3.91"},
                                  "type": "SharedResources"},
                    "customTheme": {"name": THEME_FILE, "type": "RegisteredResources"}},
                "settings": {"useEnhancedTooltips": False}})
    page_ids = []
    for pid, disp in PAGES:
        page_ids.append(pid)
        visuals, pheight = build_page_visuals(pid)
        write_json(os.path.join(defi, "pages", pid, "page.json"),
                   {"$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/page/1.0.0/schema.json",
                    "name": pid, "displayName": disp,
                    "displayOption": "FitToPage", "height": max(720, pheight), "width": 1280})
        for vname, vdict in visuals:
            write_json(os.path.join(defi, "pages", pid, "visuals", vname, "visual.json"), vdict)
    write_json(os.path.join(defi, "pages", "pages.json"),
               {"$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/pagesMetadata/1.0.0/schema.json",
                "pageOrder": page_ids, "activePageName": page_ids[0]})
    write_json(os.path.join(RP, ".platform"),
               {"$schema": "https://developer.microsoft.com/json-schemas/fabric/gitIntegration/platformProperties/2.0.0/schema.json",
                "metadata": {"type": "Report", "displayName": NAME},
                "config": {"version": "2.0", "logicalId": guid("rp")}})

def gen_pbip():
    write_json(os.path.join(ROOT, f"{NAME}.pbip"),
               {"$schema": "https://developer.microsoft.com/json-schemas/fabric/pbip/pbipProperties/1.0.0/schema.json",
                "version": "1.0",
                "artifacts": [{"report": {"path": f"{NAME}.Report"}}],
                "settings": {"enableAutoRecovery": True}})
    write(os.path.join(ROOT, ".gitignore"), "**/.pbi/localSettings.json\n**/.pbi/cache.abf\n")

# Professional theme — baked into the report (StaticResources) AND written to root for manual load.
TEAL, TEAL_D, INK, MUTE, LINE, BG_SOFT = "#0E5E5E", "#0A4A4A", "#1F2A30", "#51606B", "#D5E0E0", "#F2F6F6"
THEME_FILE = f"{NAME}-theme.json"
def _theme():
    theme = {
        "name": "WEC CISTEM Professional",
        "dataColors": [TEAL, "#16868A", "#3AA0A0", "#7BC6C6", "#C98A3E", "#B7615A", "#5B6B7B", "#9AA7B1"],
        "foreground": INK, "foregroundNeutralSecondary": MUTE, "foregroundNeutralTertiary": "#8A98A2",
        "background": "#FFFFFF", "backgroundLight": BG_SOFT, "backgroundNeutral": BG_SOFT,
        "tableAccent": TEAL,
        "textClasses": {
            "title": {"fontFace": "Segoe UI Semibold", "fontSize": 11, "color": "#FFFFFF"},
            "header": {"fontFace": "Segoe UI Semibold", "fontSize": 9, "color": TEAL},
            "label": {"fontFace": "Segoe UI", "fontSize": 9, "color": INK},
            "callout": {"fontFace": "Segoe UI Semibold", "fontSize": 20, "color": TEAL},
        },
        "visualStyles": {
            "*": {"*": {
                "title": [{"show": True, "fontColor": {"solid": {"color": "#FFFFFF"}},
                           "background": {"solid": {"color": TEAL}}, "alignment": "Left",
                           "fontSize": 10, "bold": True}],
                "background": [{"show": True, "color": {"solid": {"color": "#FFFFFF"}}, "transparency": 0}],
                "border": [{"show": True, "color": {"solid": {"color": LINE}}, "radius": 5}],
                "visualHeader": [{"show": False}],
            }},
            "tableEx": {"*": {
                "grid": [{"gridVertical": True, "gridVerticalColor": {"solid": {"color": "#ECF1F1"}},
                          "gridHorizontal": True, "gridHorizontalColor": {"solid": {"color": "#ECF1F1"}},
                          "rowPadding": 2, "outlineColor": {"solid": {"color": LINE}}, "outlineWeight": 1,
                          "textSize": 9}],
                "columnHeaders": [{"fontColor": {"solid": {"color": TEAL_D}}, "backColor": {"solid": {"color": BG_SOFT}},
                                   "fontFamily": "Segoe UI Semibold", "fontSize": 9, "wordWrap": True, "alignment": "Left"}],
                "values": [{"fontColor": {"solid": {"color": INK}}, "backColor": {"solid": {"color": "#FFFFFF"}},
                            "fontSize": 9, "fontFamily": "Segoe UI", "wordWrap": True}],
            }},
            "card": {"*": {
                "labels": [{"color": {"solid": {"color": TEAL}}, "fontSize": 18, "fontFamily": "Segoe UI Semibold"}],
                "categoryLabels": [{"show": True, "color": {"solid": {"color": MUTE}}, "fontSize": 9}],
            }},
            "slicer": {"*": {
                "items": [{"fontColor": {"solid": {"color": INK}}, "fontSize": 10, "fontFamily": "Segoe UI"}],
            }},
        },
    }
    return theme

def gen_theme():
    write_json(os.path.join(ROOT, THEME_FILE), _theme())

if __name__ == "__main__":
    gen_semantic_model()
    gen_report()
    gen_pbip()
    gen_theme()
    print("Generated:")
    print("  ", f"{NAME}.pbip")
    print("  ", f"{NAME}.SemanticModel/  ({len(M.TABLES)+1} tables, {len(M.RELATIONSHIPS)} relationships)")
    print("  ", f"{NAME}.Report/  ({len(PAGES)} pages)")
