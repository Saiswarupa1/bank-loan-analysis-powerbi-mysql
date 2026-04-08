/*==============================================================================
   MySQL Queries for Bank Loan Analysis KPIs
-------------------------------------------------------------------------------
   This script demonstrates how to calculate key KPIs using MySQL,
   starting from basic aggregations and progressing to advanced analysis.

   Table of Contents:
     1. Basic KPIs
     2. MTD & PMTD Calculations
     3. Averages & Ratios
     4. Good vs Bad Loan KPIs
     5. Loan Status Analysis
     6. Trend Analysis
     7. Segmentation Analysis
==============================================================================*/

/*------------------------------------------------------------------------------
1. BASIC KPIs
------------------------------------------------------------------------------*/

-- Total Loan Applications:
SELECT 
	COUNT(id) AS Total_Loan_Applications 
FROM financial_loan_1;

-- Total Funded Amount:
SELECT 
	SUM(loan_amount) AS total_funded_amount 
FROM financial_loan_1 ;

-- Total Amount Received :
SELECT 
	SUM(total_payment) AS total_amount_received  
FROM financial_loan_1 ;

/*------------------------------------------------------------------------------
2. MTD & PMTD CALCULATIONS
------------------------------------------------------------------------------*/

-- MTD Loan Applications:
SELECT 
	COUNT(id) AS MTD_Total_Loan_Applications 
FROM financial_loan_1 
WHERE MONTH (issue_date) = 12 AND YEAR (issue_date) = 2021 ;
 
-- PMTD Loan Applications:
SELECT 
	COUNT(id) AS PMTD_Total_Loan_Applications 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;
 
 
-- MTD Total Funded Amount:
SELECT 
	SUM(loan_amount) AS MTD_total_funded_amount 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 12 AND YEAR (issue_date) = 2021;
 
 -- PMTD Total Funded Amount:
SELECT 
	SUM(loan_amount) AS PMTD_total_funded_amount 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 11 AND YEAR (issue_date) = 2021;
  

-- MTD Total Amount Received :
SELECT 
	SUM(total_payment) AS MTD_total_amount_received 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 12 AND YEAR (issue_date) = 2021;
  
-- PMTD Total Amount Received :
SELECT 
	SUM(total_payment) AS PMTD_total_amount_received 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 11 AND YEAR (issue_date) = 2021;
  
/*------------------------------------------------------------------------------
3. AVERAGES & RATIOS
------------------------------------------------------------------------------*/
-- Average Interest Rate:
SELECT 
	ROUND(AVG(int_rate) * 100, 2) AS avg_int_rate 
FROM financial_loan_1;
  
-- MTD Average Interest Rate:
SELECT 
	ROUND(AVG(int_rate) * 100, 2) AS MTD_avg_int_rate 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 12 AND YEAR (issue_date) = 2021;

-- PMTD Average Interest Rate:
SELECT 
	ROUND(AVG(int_rate) * 100, 2) AS PMTD_avg_int_rate 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 11 AND YEAR (issue_date) = 2021;
    
-- Average Debt-to-Income Ratio (DTI):  
SELECT 
	ROUND(AVG(int_rate) * 100, 2) AS avg_int_rate 
FROM financial_loan_1;
  
-- MTD Average DTI:
SELECT 
	ROUND(AVG(dti)*100,2) AS MTD_avg_dti 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 12 AND YEAR (issue_date) = 2021;
  
-- PMTD Average DTI:
SELECT 
	ROUND(AVG(dti)*100,2) AS PMTD_avg_dti 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 11 AND YEAR (issue_date) = 2021;
      
/*------------------------------------------------------------------------------
4. GOOD VS BAD LOAN KPIs
------------------------------------------------------------------------------*/
-- Good Loan Applications (Fully Paid + Current)
SELECT 
	COUNT(id) AS good_loan_applications 
FROM financial_loan_1 
WHERE loan_status IN ('FULLY PAID' , 'CURRENT');

-- Good Loan Percentage: 
   SELECT 
  (COUNT(CASE 
      WHEN loan_status IN ('FULLY PAID', 'CURRENT') 
      THEN id 
   END) * 100) / COUNT(id) AS good_loan_percentage
FROM financial_loan_1;


-- Good Loan Funded Amount:
SELECT 
	SUM(loan_amount) AS good_loan_funded_amount 
FROM financial_loan_1 
WHERE loan_status IN ('FULLY PAID' , 'CURRENT');
  
-- Good Loan Amount Received
SELECT 
	SUM(total_payment) AS good_loan_received_amount 
FROM financial_loan_1 
WHERE loan_status IN ('FULLY PAID' , 'CURRENT');


-- Bad Loan Applications (Charged Off)
SELECT 
	COUNT(id) AS bad_loan_applications 
FROM financial_loan_1 
WHERE loan_status = 'CHARGED OFF';

--   Bad Loan Application Percentage:
SELECT 
	(COUNT(CASE 
        WHEN loan_status = 'CHARGED OFF' 
        THEN id 
	END )*100 )/COUNT(id) AS bad_loan_app_percentage 
FROM financial_loan_1 ;

-- Bad Loan Funded Amount: 
SELECT 
	SUM(loan_amount) AS bad_loan_funded_amount
FROM financial_loan_1 
WHERE loan_status = 'CHARGED OFF';

-- Bad Loan Received Amount:
SELECT 
	SUM(total_payment) AS bad_loan_received_amount 
FROM financial_loan_1 
WHERE loan_status = 'CHARGED OFF';

/*------------------------------------------------------------------------------
5. LOAN STATUS 
------------------------------------------------------------------------------*/
SELECT 
    loan_status,
	COUNT(id) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amount,
	SUM(total_payment) AS total_amount_received,
	Round(AVG(int_rate *100),2) AS avg_int_rate,
	AVG(dti *100) AS avg_dti 
FROM financial_loan_1 
GROUP BY loan_status; 

-- MTD Loan Status 
SELECT
	 loan_status, 
	 SUM(loan_amount) AS MTD_funded_amount,
	 SUM(total_payment) AS MTD_amount_received 
FROM financial_loan_1 
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status ;
    
/*-----------------------------------------------------------------------------
6. TREND ANALYSIS
------------------------------------------------------------------------------*/
-- Monthly Trends by Issue Date:
SELECT 
    YEAR(issue_date) AS issue_year,
    MONTH(issue_date) AS issue_month_num,
    MONTHNAME(issue_date) AS issue_month,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM 
	financial_loan_1
GROUP BY 
    YEAR(issue_date),
    MONTH(issue_date),
    MONTHNAME(issue_date)
ORDER BY issue_year,issue_month_num;
    
/*------------------------------------------------------------------------------
7. SEGMENTATION ANALYSIS
------------------------------------------------------------------------------*/

-- Regional Analysis by State:
SELECT address_state,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_1
GROUP BY address_state
ORDER BY address_state;

-- Loan Term Analysis:
SELECT term,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_1
GROUP BY term
ORDER BY term;

-- Employee Length Analysis:
SELECT emp_length,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_1
GROUP BY emp_length
ORDER BY emp_length;

-- Loan Purpose Breakdown:
SELECT purpose,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_1
GROUP BY purpose
ORDER BY COUNT(id) DESC;

-- Home Ownership Analysis:
SELECT home_ownership,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_1
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;
      