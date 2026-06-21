# HR-Analytics-Dashboard
HR Analytics Dashboard built with SQL and Power BI to analyze workforce demographics, compensation, attrition, and compliance metrics.

## Introduction
This project presents an HR Analytics Dashboard developed using SQL and Power BI to provide actionable insights into workforce demographics, compensation, employee attrition, and compliance metrics. The dashboard enables HR stakeholders to to gain insights into workforce demographics,  evaluate payroll expenditure, identify retention risks, and support data-driven decision-making through interactive visualizations and key performance indicators.

##Business Problem
HR teams often struggle with fragmented data systems that limit visibility into employee demographics, compensation structures, and attrition patterns. This project aims to centralize and visualize these metrics for better decision support.

## Project Objectives
Analyze workforce demographics to understand employee distribution across key categories
Monitor compensation and payroll costs to identify salary trends and budget impact
Track employee attrition trends to understand turnover patterns and retention risks
Evaluate compliance metrics such as PAYE and pension contributions for accuracy and adherence
Support HR decision-making through interactive dashboards and visual insights

## Dataset Overview
Key Columns Include:
Employee ID: Unique identifier for each employee  
Gender: Employee gender   
Age Group: Categorized age bands derivved for analysis  
Department: Employee department  
Employee Status: Current or exited employee status  
Employee Level: Job level within the organization  
Employment Type: Type of employment (e.g., full-time, contract)  
Salary Information: Employee compensation details  
PAYE Tax: Tax deductions for employees  
Pension Contributions: Retirement contribution details  
Start Year: Year the employee joined the organization  
Exit Year: Year the employee left the organization  
Exit Category: Employee exit classification derived for analysis

## Tools Used
SQL (SSMS): Used for data cleaning and transformation, including creating derived fields such as Employee Status, Age Group, and Exit Category, as well as handling missing values and correcting data inconsistencies  
Microsoft Excel: Used for initial data exploration and understanding the structure of the dataset  
 Power BI: Used for building interactive dashboards, applying filters (filter pane/page-level filters using Employee Status), and visualizing HR insights such as demographics, attrition, compensation, and compliance metrics  and visualizing HR insights such as demographics, attrition, compensation, and compliance metrics. 
 Power BI Aggregations: Used built-in SUM, AVERAGE, and COUNT functions in visuals to analyze salary distribution and employee counts (e.g.total employee, Active, and Exited employees)  
 DAX: Used for creating calculated measures such as attrition rate
 
## Data Cleaning & Preparation
 Created Employee Status using Exit Year
 
   Employees with a valid Exit Year were classified as Exited
   Employees without an Exit Year were classified as Active
   
 Corrected inconsistencies where some records had Exit Year populated but were incorrectly labeled as Active
 
 Created Age Group by grouping employee ages into defined ranges for demographic analysis
 
 Standardized Exit Category by consolidating multiple exit reasons (Voluntary, Involuntary, Contract End, Exceptional) into a unified classification for analysis
 
Handled missing values in Exit Reason and Exit Category by replacing blank entries with "Unknown" to ensure consistency in analysis and avoid null-related issues in reporting

## Dashboard Overview
This HR Analytics Dashboard provides an interactive view of workforce structure, compensation, attrition, and compliance metrics. It enables HR stakeholders to to gain insights into workforce demographics, evaluate payroll expenditure, identify retention risks, and make data-driven decisions.

The dashboard includes key visualizations and KPIs such as total employees, active vs exited employees, attrition rate, average salary, and total payroll. It also provides breakdowns across age groups, departments, employee levels, employment types, gender, and exit categories.

Filters such as Employee Status, Department, Gender, and Age Group allow dynamic exploration of workforce patterns. Additionally, compliance metrics such as PAYE tax and pension contributions provide insights into financial obligations across the workforce.
## Key Insights
The organization has a total of 700 employees, with 421 active employees and 279 exited employees, resulting in an attrition rate of 39.86%.

 Average salary across employees is approximately 410.06K, with a total payroll cost of about 390M, indicating significant workforce compensation expenditure.

 Attrition analysis shows that a substantial portion of employees (279 individuals) have left the organization, highlighting workforce turnover concerns.

 Age Group analysis shows that the majority of employees fall within the 20–35 and 36–45 age brackets, indicating a relatively young and mid-career workforce.

 Exit Category analysis shows that employee exits are mainly split between Voluntary and Involuntary categories, providing insight into resignation versus organization-driven exits.

 Departmental distribution shows that Sales & Marketing, Operations, and Engineering & Technical have the highest employee counts, indicating key operational areas.

 Gender distribution shows a relatively balanced workforce composition, supporting diversity within the organization.

 PAYE and Pension contributions vary significantly across departments, reflecting differences in salary structure and compliance contributions.

 Employee Level distribution shows a strong presence of Junior and Mid-Level staff, indicating a developing workforce structure.

## Recommendation
Investigate departments with higher attrition rates to identify underlying causes such as workload, management structure, or employee satisfaction issues.

 Develop retention strategies for high-risk groups identified through exit analysis, especially within key departments and employee levels.

 Review compensation structures across departments and employee levels to ensure fairness and competitiveness, particularly where salary disparities are observed.

 Strengthen employee engagement initiatives for age groups and departments with higher turnover tendencies to improve retention.

 Conduct deeper analysis into voluntary exits to understand employee-driven resignation patterns and improve workplace satisfaction.

 Maintain regular monitoring of PAYE tax and pension contributions to ensure continued compliance and financial accuracy.

 Use workforce segmentation (age group, employee level, and employment type) to support better workforce planning and hiring strategies.




