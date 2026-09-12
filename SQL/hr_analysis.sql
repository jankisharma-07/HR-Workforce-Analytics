USE hr_workforce_analytics;
SHOW TABLES;
SELECT COUNT(*) AS Total_Employees
FROM hr_employee_data;

-- 1. Overall Workforce Metrics
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate_Percent,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income,
    ROUND(AVG(YearsAtCompany), 2) AS Average_Years_At_Company
FROM hr_employee_data;

-- 2. Department-wise Attrition Analysis
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM hr_employee_data
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;

-- 3. Job Role-wise Attrition Analysis
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM hr_employee_data
GROUP BY JobRole
ORDER BY Attrition_Rate_Percent DESC;

-- 4. Overtime Impact on Attrition
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM hr_employee_data
GROUP BY OverTime
ORDER BY Attrition_Rate_Percent DESC;

-- 5. Average Salary: Attrition vs Retained
SELECT
    Attrition,
    COUNT(*) AS Employee_Count,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM hr_employee_data
GROUP BY Attrition
ORDER BY Attrition;

-- 6. Age Group-wise Attrition
SELECT
    AgeGroup,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM hr_employee_data
GROUP BY AgeGroup
ORDER BY Attrition_Rate_Percent DESC;

-- 7. Experience Group-wise Attrition
SELECT
    ExperienceGroup,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM hr_employee_data
GROUP BY ExperienceGroup
ORDER BY Attrition_Rate_Percent DESC;

-- 8. Job Satisfaction vs Attrition
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM hr_employee_data
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- 9. Work-Life Balance vs Attrition
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM hr_employee_data
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- 10. Employee Risk Level Distribution
SELECT
    RiskLevel,
    COUNT(*) AS Employee_Count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_employee_data),
        2
    ) AS Percentage_of_Employees
FROM hr_employee_data
GROUP BY RiskLevel
ORDER BY
    CASE RiskLevel
        WHEN 'High Risk' THEN 1
        WHEN 'Medium Risk' THEN 2
        WHEN 'Low Risk' THEN 3
    END;
    
    -- 11. High-Risk Employee Analysis
SELECT
    COUNT(*) AS High_Risk_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS High_Risk_Attrition,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS High_Risk_Attrition_Rate
FROM hr_employee_data
WHERE RiskLevel = 'High Risk';

-- 12. Retention Priority Analysis
SELECT
    Department,
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM hr_employee_data
GROUP BY Department, JobRole
HAVING COUNT(*) >= 10
ORDER BY Attrition_Rate_Percent DESC;

-- FINAL DATA QUALITY CHECK

-- Total rows
SELECT COUNT(*) AS Total_Rows
FROM hr_employee_data;

-- Missing values in important columns
SELECT
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Missing_Attrition,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,
    SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS Missing_JobRole,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS Missing_Income,
    SUM(CASE WHEN RiskLevel IS NULL THEN 1 ELSE 0 END) AS Missing_RiskLevel
FROM hr_employee_data;
-- Final Table Structure
DESCRIBE hr_employee_data;
