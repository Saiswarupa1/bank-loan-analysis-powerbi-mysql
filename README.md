# Bank Loan Analysis Dashboard | Power BI + MySQL

## Project Overview

This project delivers an end-to-end **Bank Loan Analysis Dashboard** built using **Power BI** and **MySQL**, designed to identify patterns in loan applications, funding, repayments, and risk (good vs bad loans), enabling better financial decision-making.

## Project Highlights

- Built an interactive 3-page Power BI dashboard (Summary, Overview, Details)
- Analyzed 38K+ loan records using MySQL
- Identified 86% good loans vs 14% risk segment
- Performed KPI analysis including MTD and MoM trends
- Delivered business recommendations to reduce default risk

## Tools & Technologies

- **Power BI** – Data visualization & dashboard development
- **MySQL** – Data querying and KPI calculations
- **Excel / CSV** – Data source

## Dataset 

The dataset consists of loan-level records with the following attributes:

- Loan applications
- Loan Amount & Funded Amount
- Total Amount Received
- Interest Rate (%)
- Debt-to-Income Ratio (DTI)
- Loan Status (Fully Paid, Current, Charged Off)
- Term (60 months, 36 months)
- Issue Date
- Borrower attributes (State, Purpose, Home Ownership, Employment Length)

## Methodology

1. Data Preparation (MySQL)
   
  - Imported CSV dataset into MySQL
  - Cleaned and structured data
  - Handled missing/null values
  - Standardized columns for analysis
    
2. SQL Analysis
   
Calculated KPIs:
    - Total Loan Applications
    - Total Funded Amount
    - Total Amount Received
    - Average Interest Rate
    - Average DTI
 Segmented data:
    - Good vs Bad Loans
    - Loan Status (Fully Paid, Current, Charged Off)
 Performed aggregations by:
    - Month
    - State
    - Loan Purpose
    - Employee Length
    - Home Ownership

3. Data Visualization (Power BI)
   
  - Connected Power BI with MySQL / imported processed data
  - Built interactive dashboard with filters:
  - State
  - Grade
  - Loan Type (Good vs Bad)

  
## Key Metrics

###  Core Metrics

- Total Loan Applications: **38.6K**
- Total Funded Amount: **$435.8M**
- Total Amount Received: **$473.1M**

###  Time-Based Metrics

- MTD Loan Applications: **4.3K**
-  Month-over-Month Growth: **6.9%**
- MTD Funded Amount: **$54.0M**
- MTD Amount Received: **$58.1M**

###  Risk & Financial Metrics

- Average Interest Rate: **12.0%**
- Average Debt-to-Income Ratio: **13.3%**


## Good vs Bad Loan Analysis

###  Good Loans (Healthy Portfolio)

- Percentage: **86.2%**
- Applications: **33K**
- Funded Amount: **$370.2M**
- Amount Received: **$435.8M**

###  Bad Loans (Risk Segment)

- Percentage: **13.8%**
- Applications: **5.3K**
- Funded Amount: **$65.5M**
- Amount Received: **$37.3M**


## Dashboard Overview

###  Summary Dashboard

- High-level KPI overview  
- Good vs Bad Loan distribution  
- Loan status performance grid  

![Summary Dashboard](images/Screenshot%20Summary.png)

###  Overview Dashboard

- Monthly loan application trends (growth analysis)  
- Regional distribution (state-wise analysis)  
- Loan term segmentation (36 vs 60 months)  
- Borrower profiling:
  - Employment length  
  - Loan purpose  
  - Home ownership  

![Overview Dashboard](images/Screenshot%20Overview.png)


###  Detailed Dashboard

- Transaction-level loan data  
- Drill-down capabilities  
- Dynamic filtering (State, Grade, Loan Type)  

![Detailed Dashboard](images/Screenshot%20Details.png)

## Key Insights

- **86% of loans are classified as good**, indicating a relatively healthy portfolio
- **Debt consolidation** is the most common loan purpose
- Loan applications show a **consistent upward trend throughout the year**
- Certain loan grades and segments contribute more to **default risk**
- Borrowers with higher DTI ratios show **increased risk of default**


##  Business Recommendations

- Strengthen approval criteria for **high-risk loan grades**
- Focus on customers with **lower DTI ratios** to reduce default risk
- Monitor regions with higher **charged-off loan percentages**
- Optimize **interest rates** to balance profitability and repayment
- Expand lending strategies in **low-risk segments**


## How to Run

1. Setup MySQL
    - Install MySQL
    - Create a database (e.g., bank_loan_db)
    - Import the dataset (CSV)
2. Run SQL Queries
    - Execute queries from:
        SQL Bank Loan Analysis Queries.sql
3. Open Power BI
    - Import processed data OR connect to MySQL
    - Refresh dataset

##  Acknowledgment

This project was inspired by a YouTube tutorial on Bank Loan Analysis using SQL Server and Power BI.
My contributions in this project:

* Re-implemented the complete data processing and analysis using **MySQL instead of SQL Server**
* Wrote custom SQL queries for KPI calculations and segmentation
* Cleaned and structured the dataset independently

For the Power BI dashboard:

* Followed the visualization approach from the original tutorial
* Recreated the dashboard to understand business insights and reporting techniques

This project reflects my hands-on learning in SQL, data analytics, and dashboard development.

Reference: [Bank Loan Analysis Project Tutorial](https://www.youtube.com/watch?v=3I8wd1AShXs)

## Conclusion

This project demonstrates the ability to transform raw financial data into actionable insights using SQL and Power BI. It highlights lending trends, risk segmentation, and borrower behavior, enabling effective decision-making in financial services.


    












