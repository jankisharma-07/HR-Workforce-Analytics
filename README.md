# HR Workforce Analytics Dashboard

An interactive HR analytics project built to analyze employee attrition, workforce demographics, compensation, and employee risk factors using Python, Microsoft Excel, MySQL, and Power BI.

The project follows a complete analytics workflow from data cleaning and exploratory analysis to SQL analysis and interactive dashboard development.

---

## 📊 Project Overview

Employee attrition is an important workforce challenge for organizations. This project analyzes employee data to understand:

- Overall employee attrition
- Department-wise and job-role-wise attrition
- Overtime and attrition patterns
- Employee demographics
- Salary and compensation trends
- Experience and tenure distribution
- Employee risk levels
- High-risk employee groups
- Workforce retention patterns

The final Power BI dashboard provides an interactive view of workforce trends and potential attrition risk areas.

---

## 🛠️ Tools & Technologies

- **Python** – Data cleaning, preprocessing, feature engineering and exploratory data analysis
- **Pandas & NumPy** – Data manipulation and analysis
- **Matplotlib & Seaborn** – Exploratory data visualizations
- **Microsoft Excel** – Data validation, summary analysis and pivot analysis
- **MySQL** – SQL-based workforce and attrition analysis
- **Power BI** – Interactive dashboard development
- **GitHub** – Project documentation and version control

---

## 🔄 Project Workflow

```text
Raw HR Dataset
      ↓
Python Data Cleaning & Preprocessing
      ↓
Feature Engineering & EDA
      ↓
Cleaned Dataset
      ↓
Excel Validation & Pivot Analysis
      ↓
MySQL Analysis
      ↓
Power BI Dashboard
      ↓
Workforce Insights

Haan yaar ❤️ ab GitHub wala final part karte hain. Tumhare project me Documentation ke andar EDA charts already hain, to README ko professional but fresher-friendly rakhenge — overclaim nahi karenge.

GitHub folder structure

Tumhara repo roughly aisa hona chahiye:

HR-Workforce-Analytics/
│
├── README.md
│
├── Python/
│   └── HR_Analytics.py
│
├── Excel/
│   ├── HR_Cleaned_Data.csv
│   └── HR_Workforce_Analytics.xlsx
│
├── SQL/
│   └── HR_Workforce_Analytics.sql
│
├── Power BI/
│   └── HR_Workforce_Analytics_Dashboard.pbix
│
└── Documentation/
    └── EDA_Charts/
        ├── Attrition_by_Department.png
        ├── Attrition_by_Overtime.png
        ├── Attrition_by_Job_Role.png
        ├── Average_Salary_Attrition.png
        └── Risk_Level_Distribution.png

Screenshots kahan add karne hain?
EDA charts ko Documentation/EDA_Charts/ me hi rakho.

Lekin Power BI dashboard ke screenshots alag folder me rakhna better hai:

Documentation/
│
├── EDA_Charts/
│   ├── Attrition_by_Department.png
│   ├── Attrition_by_Overtime.png
│   ├── Attrition_by_Job_Role.png
│   ├── Average_Salary_Attrition.png
│   └── Risk_Level_Distribution.png
│
└── Dashboard_Screenshots/
    ├── Executive_Overview.png
    ├── Attrition_Retention.png
    ├── Risk_Center.png
    └── Employee_Insights.png

Ye 4 Power BI pages ke screenshots zaroor add karna. README me ye sabse important visuals honge.

Ab README.md me ye pura content paste karo
# HR Workforce Analytics Dashboard

An interactive HR analytics project built to analyze employee attrition, workforce demographics, compensation, and employee risk factors using Python, Microsoft Excel, MySQL, and Power BI.

The project follows a complete analytics workflow from data cleaning and exploratory analysis to SQL analysis and interactive dashboard development.

---

## 📊 Project Overview

Employee attrition is an important workforce challenge for organizations. This project analyzes employee data to understand:

- Overall employee attrition
- Department-wise and job-role-wise attrition
- Overtime and attrition patterns
- Employee demographics
- Salary and compensation trends
- Experience and tenure distribution
- Employee risk levels
- High-risk employee groups
- Workforce retention patterns

The final Power BI dashboard provides an interactive view of workforce trends and potential attrition risk areas.

---

## 🛠️ Tools & Technologies

- **Python** – Data cleaning, preprocessing, feature engineering and exploratory data analysis
- **Pandas & NumPy** – Data manipulation and analysis
- **Matplotlib & Seaborn** – Exploratory data visualizations
- **Microsoft Excel** – Data validation, summary analysis and pivot analysis
- **MySQL** – SQL-based workforce and attrition analysis
- **Power BI** – Interactive dashboard development
- **GitHub** – Project documentation and version control

---

## 🔄 Project Workflow

```text
Raw HR Dataset
      ↓
Python Data Cleaning & Preprocessing
      ↓
Feature Engineering & EDA
      ↓
Cleaned Dataset
      ↓
Excel Validation & Pivot Analysis
      ↓
MySQL Analysis
      ↓
Power BI Dashboard
      ↓
Workforce Insights

1. Data Cleaning & Preprocessing

The raw HR dataset was cleaned and prepared using Python.

Key preprocessing steps
Loaded the raw CSV dataset using Pandas
Checked dataset structure, data types and missing values
Checked and removed duplicate records
Removed unnecessary columns:
EmployeeCount
Over18
StandardHours
Cleaned text-based columns
Created employee age groups
Created experience groups
Created salary bands
Created a rule-based employee risk score
Categorized employees into:
Low Risk
Medium Risk
High Risk
Exported the cleaned dataset for further analysis

📈 2. Exploratory Data Analysis

EDA was performed to identify important workforce and attrition patterns.

EDA Visualizations

The analysis includes:

Attrition by Department
Attrition by Overtime
Attrition by Job Role
Average Salary by Attrition
Risk Level Distribution

EDA charts are available in:

Documentation/EDA_Charts/

📊 3. Excel Analysis

Microsoft Excel was used for data validation, summary analysis and pivot-based exploration.

Excel Analysis Includes
Workforce summary
Department-wise employee distribution
Overtime-wise attrition
Department-wise attrition
Job role-wise attrition
Risk level distribution
Average monthly income analysis

The Excel workbook is available in:

Excel/

🗄️ 4. MySQL Analysis

The cleaned HR dataset was imported into MySQL for SQL-based analysis.

SQL Analysis Includes
Total employee count
Total attrition count
Attrition rate
Average monthly income
Average employee tenure
Department-wise attrition
Job role-wise attrition
Overtime-wise attrition
Employee risk analysis

SQL queries are available in:

SQL/

📊 5. Power BI Dashboard

The final interactive Power BI dashboard contains four analytical pages.

Page 1 — Executive Overview

Provides a high-level overview of the workforce.

Key Metrics
Total Employees
Total Attrition
Attrition Rate
Average Monthly Income
Average Tenure
Visualizations
Employee Distribution by Department
Attrition by Department
Workforce by Job Role
Age Distribution
Gender Distribution

Page 2 — Attrition & Retention Analysis

Focuses on employee turnover and retention patterns.

Analysis Includes
Attrition by Department
Attrition by Job Role
Attrition by Overtime
Attrition by Age Group
Attrition by Salary Band
Attrition by Experience
Workforce Retention Overview
Key Metrics
Total Attrition
Attrition Rate
High Risk Employees
Overtime Employees

Page 3 — Workforce Risk Center

Focuses on identifying employees and workforce segments associated with higher risk.

Analysis Includes
Risk Level Distribution
High Risk Employees by Department
Risk Level by Overtime
High Risk Employees by Job Role
High Risk Employees by Age Group
High Risk Employees by Job Satisfaction
High Risk Employees by Work-Life Balance
High Risk Employees by Experience
Risk Categories
Low Risk
Medium Risk
High Risk

Page 4 — Employee Insights

Provides a broader view of employee demographics, roles and compensation.

Analysis Includes
Workforce by Department
Workforce by Job Role
Gender Distribution
Age Distribution
Employees by Education Field
Average Income by Department
Business Travel Distribution
Experience Distribution

📌 Key Workforce Metrics
Metric	Value
Total Employees	1,470
Total Attrition	237
Attrition Rate	16.12%
Average Monthly Income	6,502.93
Average Age	36.92
Average Tenure	7.01 Years
High Risk Employees	93

🔎 Key Insights

Based on the analysis:

The overall employee attrition rate is 16.12%.
Overtime is an important factor observed in the employee risk analysis.
Attrition varies across departments and job roles.
Employee age and experience groups show different workforce patterns.
Compensation levels differ between employees who stayed and employees who left.
The risk analysis identifies 93 employees as High Risk based on the project's rule-based risk scoring approach.
Workforce demographics such as gender, age, education field and business travel were analyzed to understand workforce structure.

📁 Project Structure
HR-Workforce-Analytics/
│
├── README.md
│
├── Python/
│   └── HR_Analytics.py
│
├── Excel/
│   ├── HR_Cleaned_Data.csv
│   └── HR_Workforce_Analytics.xlsx
│
├── SQL/
│   └── HR_Workforce_Analytics.sql
│
├── Power BI/
│   └── HR_Workforce_Analytics_Dashboard.pbix
│
└── Documentation/
    │
    ├── EDA_Charts/
    │   ├── Attrition_by_Department.png
    │   ├── Attrition_by_Overtime.png
    │   ├── Attrition_by_Job_Role.png
    │   ├── Average_Salary_Attrition.png
    │   └── Risk_Level_Distribution.png
    │
    └── Dashboard_Screenshots/
        ├── Executive_Overview.png
        ├── Attrition_Retention.png
        ├── Risk_Center.png
        └── Employee_Insights.png

🎯 Skills Demonstrated
Data Cleaning
Data Preprocessing
Exploratory Data Analysis
Feature Engineering
Data Validation
SQL Analysis
Excel Pivot Analysis
Data Visualization
Dashboard Development
KPI Development
Workforce Analytics
Attrition Analysis
Basic Risk Analysis
Business Insight Generation

👩‍💻 Project Purpose

This project was developed as part of my journey toward building practical skills in Data Analytics and Business Intelligence.

It helped me practice working with a complete analytics workflow — from raw data cleaning and analysis to SQL queries and interactive Power BI dashboards.

📌 Dataset
The project uses the IBM HR Analytics Employee Attrition dataset for educational and analytical purposes.