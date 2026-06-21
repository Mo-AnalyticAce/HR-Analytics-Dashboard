CREATE DATABASE hr_management;
USE hr_management;

SELECT * FROM HRdata;

--Employee_status

SELECT
	CASE
		WHEN Exit_Date IS NULL THEN 'Active'
	ELSE 'Exited'
	END AS Employee_status
	FROM HRdata;

SELECT
	CASE
		WHEN Exit_Reason IS NULL OR Exit_Reason ='' THEN 'Unknown'
	ELSE Exit_Reason
	END AS Exit_Reason_clean
	FROM HRdata;

	
	SELECT Exit_Reason,
	CASE
    WHEN Exit_Reason IN ('Resignation', 'Retirement') 
        THEN 'Voluntary'

    WHEN Exit_Reason IN ('Dismissal', 'Termination', 'Redundancy') 
        THEN 'Involuntary'

    WHEN exit_reason = 'Contract Expiry' 
        THEN 'Contract End'

    WHEN Exit_Reason = 'Death in Service' 
        THEN 'Exceptional'

    ELSE 'Unknown'
END AS Exit_category
FROM HRdata;


--Employee Age_group
	SELECT
    CASE 
        WHEN Age BETWEEN 20 AND 35 THEN '20-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
		WHEN Age BETWEEN 56 AND 65 THEN '56-65'
		WHEN Age BETWEEN 66 AND 75 THEN '66-75'
        ELSE '76+'
    END AS Age_group
	FROM HRdata;

	--Employee demographic

	--Employee gender distribution

SELECT Gender,
COUNT(*) AS Employee_gender
FROM HRdata
GROUP BY Gender
ORDER BY Employee_gender DESC;


--Employee marital status distribution
SELECT Marital_Status,
COUNT(*) AS Employee_marital_status
FROM HRdata
GROUP BY Marital_Status
ORDER BY Employee_marital_status DESC;

--Employee Age_group distribution

SELECT
    CASE 
        WHEN Age BETWEEN 20 AND 35 THEN '20-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
		WHEN Age BETWEEN 56 AND 65 THEN '56-65'
		WHEN Age BETWEEN 66 AND 75 THEN '66-75'
        ELSE '76+'
    END AS Age_group,
COUNT(*) AS Employee_Age_group
FROM HRdata
GROUP BY
    CASE 
        WHEN Age BETWEEN 20 AND 35 THEN '20-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
		WHEN Age BETWEEN 56 AND 65 THEN '56-65'
		WHEN Age BETWEEN 66 AND 75 THEN '66-75'
        ELSE '76+'
    END
ORDER BY Employee_Age_group DESC;


--Organizational structure

--Employee distribution across departments

SELECT Department,
COUNT(*) AS Employee_department_count
FROM HRdata
GROUP BY Department
ORDER BY Employee_department_count DESC;

--Employee distribution across Employee level

SELECT Employee_Level,
COUNT(*) AS Employee_level_count
FROM HRdata
GROUP BY Employee_Level
ORDER BY Employee_level_count DESC;

--Common designation

SELECT TOP 10 
Designation,
COUNT(Designation) AS common_designation
FROM HRdata
GROUP BY Designation
ORDER BY common_designation DESC;

--Compensation and Benefits

--Gross monthly salary across departments

SELECT Department,
SUM(Gross_Monthly_Salary_NGN) AS total_GM_salary
FROM HRdata
GROUP BY Department
ORDER BY total_GM_salary DESC;

--HighestAverage net pay across departments

SELECT TOP 3
Department,
AVG(Net_Monthly_Pay_NGN) AS Average_net_salary
FROM HRdata
GROUP BY Department
ORDER BY Average_net_salary DESC;

--Relationship between employee level and salary

SELECT Employee_level,
AVG(Gross_Monthly_Salary_NGN) AS Average_GM_salary
FROM HRdata
GROUP BY Employee_level
ORDER BY Average_GM_salary DESC;

 -- summary statics of Employee compensation by job level
SELECT Employee_Level,
COUNT(*) AS Employee_count,
AVG(Gross_Monthly_Salary_NGN) AS Avg_salary,
MIN(Gross_Monthly_Salary_NGN) AS Min_salary,
MAX(Gross_Monthly_Salary_NGN) AS Max_salary
FROM HRdata
GROUP BY Employee_Level
ORDER BY Avg_salary desc;

--EMPLOYEE Attrition & TURNOVER

--Exit by department

	SELECT Department,
	COUNT(*) AS total_exits
	FROM HRdata
	WHERE Exit_Date is not null
	GROUP BY Department
	ORDER BY total_exits DESC;

	--Exit by employee_level

	SELECT Employee_Level,
	COUNT(*) AS total_exits
	FROM HRdata
	WHERE Exit_Date is not null
	GROUP BY Employee_Level
	ORDER BY total_exits DESC;

	--Exit Reasons Distribution

	SELECT Exit_Reason,
	COUNT(*) AS Exit_count
	FROM HRdata
	WHERE Exit_Date IS NOT NULL
	GROUP BY Exit_Reason
	ORDER BY Exit_count DESC;

	--Exit category distribution
	SELECT
	CASE
    WHEN Exit_Reason IN ('Resignation', 'Retirement') 
        THEN 'Voluntary'

    WHEN Exit_Reason IN ('Dismissal', 'Termination', 'Redundancy') 
        THEN 'Involuntary'

    WHEN Exit_Reason = 'Contract Expiry' 
        THEN 'Contract End'

    WHEN Exit_Reason = 'Death in Service' 
        THEN 'Exceptional'

    ELSE 'Unknown'
END AS Exit_category,

	COUNT(*) AS Total_exits
	FROM HRdata
	WHERE Exit_Date IS NOT NULL
	GROUP BY 
	CASE
    WHEN Exit_Reason IN ('Resignation', 'Retirement') 
        THEN 'Voluntary'

    WHEN Exit_Reason IN ('Dismissal', 'Termination', 'Redundancy') 
        THEN 'Involuntary'

    WHEN exit_reason = 'Contract Expiry' 
        THEN 'Contract End'

    WHEN Exit_Reason = 'Death in Service' 
        THEN 'Exceptional'

    ELSE 'Unknown'
   END
	ORDER BY Total_exits DESC;

	--Employee Start vs Exit

	SELECT 
	YEAR(Start_Date) AS Year,
	COUNT(*) AS Total_starts,
	COUNT(CASE WHEN Exit_Date IS NOT NULL THEN 1 END) AS total_exit
	FROM HRdata
	GROUP BY YEAR(Start_Date)
	ORDER BY Year DESC;

	--Exit over time

	SELECT 
	YEAR(Exit_Date) AS Year,
	COUNT(CASE WHEN Exit_Date IS NOT NULL THEN 1 END) AS total_exit
	FROM HRdata
	GROUP BY YEAR(Exit_Date)
	ORDER BY Year DESC;

	--Compliance

	--How does PAYE vary across employee levels?

	--Wrong data type and the column carries a ',' which shows as varchar
	UPDATE HRdata
	SET Employee_PAYE_Tax_NGN= REPLACE(Employee_PAYE_Tax_NGN,',','');

	ALTER TABLE HRdata
	ALTER COLUMN Employee_PAYE_Tax_NGN INT;

SELECT Employee_Level,
AVG(Employee_PAYE_Tax_NGN) AS Average_Employee_PAYE
FROM HRdata
GROUP BY Employee_Level
ORDER BY Average_Employee_PAYE DESC;

--Employee pension contribution across employee level

SELECT Department,
AVG(Employee_Pension_Contribution_NGN) AS Average_Employee_pension
FROM HRdata
GROUP BY Department
ORDER BY Average_Employee_pension DESC;

SELECT Employee_Level,
AVG(Employee_Pension_Contribution_NGN) AS Average_Employee_pension
FROM HRdata
GROUP BY Employee_Level
ORDER BY Average_Employee_pension DESC;


GO CREATE VIEW 
VW_HRdata_dashboard AS 
SELECT
Employee_ID,
Gender,
Age,
CASE 
        WHEN Age BETWEEN 20 AND 35 THEN '20-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
		WHEN Age BETWEEN 56 AND 65 THEN '56-65'
		WHEN Age BETWEEN 66 AND 75 THEN '66-75'
        ELSE '76+'
    END AS Age_group,
	Department,
	Employee_Level,
	Employment_Type,
	Designation,
	Gross_Monthly_Salary_NGN,
	Net_Monthly_Pay_NGN,
	Employee_PAYE_Tax_NGN,
	Employee_Pension_Contribution_NGN,
	Exit_Date,
	Start_Date,
	CASE
		WHEN Exit_Date IS NULL THEN 'Active'
	ELSE 'Exited'
	END AS Employee_status,

	CASE
		WHEN Exit_Reason IS NULL OR Exit_Reason ='' THEN 'Unknown'
	ELSE Exit_Reason
	END AS Exit_Reason_clean,
	
	CASE
    WHEN Exit_Reason IN ('Resignation', 'Retirement') 
        THEN 'Voluntary'

    WHEN Exit_Reason IN ('Dismissal', 'Termination', 'Redundancy') 
        THEN 'Involuntary'

    WHEN exit_reason = 'Contract Expiry' 
        THEN 'Contract End'

    WHEN Exit_Reason = 'Death in Service' 
        THEN 'Exceptional'

    ELSE 'Unknown'
END AS Exit_category
FROM HRdata;

