import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

df = pd.read_csv("C:\\Users\\Admin\\OneDrive\\Desktop\\Projects\\HR Workforce Analytics\\Raw Data\\WA_Fn-UseC_-HR-Employee-Attrition.csv")

print(df.head())
print(df.shape)
print(df.columns)

print("\nDataset Information:")
df.info()

print("\nMissing Values:")
print(df.isnull().sum())

print("\nDuplicate Rows:")
print(df.duplicated().sum())

print("\nAttrition Distribution:")
print(df["Attrition"].value_counts())

# Remove duplicate rows
df = df.drop_duplicates()

# Standardize text columns
text_columns = df.select_dtypes(include="object").columns

for col in text_columns:
    df[col] = df[col].astype(str).str.strip()

print("Shape after cleaning:", df.shape)

df = df.drop(columns=["EmployeeCount", "Over18", "StandardHours"])

print(df.shape)

df["AgeGroup"] = pd.cut(
    df["Age"],
    bins=[0, 25, 35, 45, 55, 100],
    labels=["18-25", "26-35", "36-45", "46-55", "56+"]
)

df["ExperienceGroup"] = pd.cut(
    df["TotalWorkingYears"],
    bins=[-1, 2, 5, 10, 20, 100],
    labels=["0-2 Years", "3-5 Years", "6-10 Years", "11-20 Years", "20+ Years"]
)

df["SalaryBand"] = pd.qcut(
    df["MonthlyIncome"],
    q=4,
    labels=["Low", "Medium", "High", "Very High"]
)
df["RiskScore"] = (
    (df["OverTime"] == "Yes").astype(int) * 2
    + (df["JobSatisfaction"] <= 2).astype(int)
    + (df["WorkLifeBalance"] <= 2).astype(int)
    + (df["YearsAtCompany"] <= 2).astype(int)
)

df["RiskLevel"] = pd.cut(
    df["RiskScore"],
    bins=[-1, 1, 3, 10],
    labels=["Low Risk", "Medium Risk", "High Risk"]
)

print(df["Attrition"].value_counts())

print(
    df.groupby("Department")["Attrition"]
    .value_counts()
)

print(
    pd.crosstab(df["OverTime"], df["Attrition"])
)

print(
    pd.crosstab(df["JobRole"], df["Attrition"])
)

print(
    df.groupby("Attrition")["MonthlyIncome"].mean()
)

print(
    df["RiskLevel"].value_counts()
)

# EDA VISUALIZATIONS

# Project folders
BASE_DIR = Path(__file__).resolve().parent.parent
CHART_DIR = BASE_DIR / "Documentation" / "EDA_Charts"
EXCEL_DIR = BASE_DIR / "Excel"

CHART_DIR.mkdir(parents=True, exist_ok=True)
EXCEL_DIR.mkdir(parents=True, exist_ok=True)

# 1. Attrition by Department

department_attrition = pd.crosstab(
    df["Department"],
    df["Attrition"]
)

department_attrition.plot(
    kind="bar",
    figsize=(9, 5)
)

plt.title("Employee Attrition by Department")
plt.xlabel("Department")
plt.ylabel("Number of Employees")
plt.xticks(rotation=15)
plt.legend(title="Attrition")
plt.tight_layout()

plt.savefig(
    CHART_DIR / "01_Attrition_by_Department.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
plt.close()

# 2. Attrition by Overtime

overtime_attrition = pd.crosstab(
    df["OverTime"],
    df["Attrition"]
)

overtime_attrition.plot(
    kind="bar",
    figsize=(7, 5)
)

plt.title("Employee Attrition by Overtime")
plt.xlabel("Overtime")
plt.ylabel("Number of Employees")
plt.xticks(rotation=0)
plt.legend(title="Attrition")
plt.tight_layout()

plt.savefig(
    CHART_DIR / "02_Attrition_by_Overtime.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
plt.close()

# 3. Attrition by Job Role

role_attrition = pd.crosstab(
    df["JobRole"],
    df["Attrition"]
)

role_attrition.plot(
    kind="bar",
    figsize=(11, 6)
)

plt.title("Employee Attrition by Job Role")
plt.xlabel("Job Role")
plt.ylabel("Number of Employees")
plt.xticks(rotation=45, ha="right")
plt.legend(title="Attrition")
plt.tight_layout()

plt.savefig(
    CHART_DIR / "03_Attrition_by_Job_Role.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
plt.close()

# 4. Average Salary: Attrition vs Retained

salary_attrition = df.groupby(
    "Attrition"
)["MonthlyIncome"].mean()

salary_attrition.plot(
    kind="bar",
    figsize=(7, 5)
)

plt.title("Average Monthly Income: Attrition vs Retained")
plt.xlabel("Attrition")
plt.ylabel("Average Monthly Income")
plt.xticks(rotation=0)
plt.tight_layout()

plt.savefig(
    CHART_DIR / "04_Average_Salary_Attrition.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
plt.close()

# 5. Employee Risk Level Distribution

risk_distribution = df["RiskLevel"].value_counts()

risk_distribution.plot(
    kind="bar",
    figsize=(7, 5)
)

plt.title("Employee Attrition Risk Level Distribution")
plt.xlabel("Risk Level")
plt.ylabel("Number of Employees")
plt.xticks(rotation=0)
plt.tight_layout()

plt.savefig(
    CHART_DIR / "05_Risk_Level_Distribution.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
plt.close()

# Export Final Clean Dataset

output_file = EXCEL_DIR / "HR_Cleaned_Data.csv"

df.to_csv(
    output_file,
    index=False
)

print("\nPYTHON HR ANALYTICS COMPLETED!")

print(f"Clean dataset saved at: {output_file}")
print(f"EDA charts saved at: {CHART_DIR}")
print("Total Employees:", len(df))
print("Total Columns:", len(df.columns))
print("Missing Values:", df.isnull().sum().sum())
print("Duplicate Rows:", df.duplicated().sum())