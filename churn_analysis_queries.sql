-- Overall Churn Rate
SELECT 
    Churn,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Churn;  

-- Churn Percentage
SELECT 
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM customers; 

-- Churn by Contract Type
SELECT 
    Contract,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY Contract; 

-- Churn by Tenure
    SELECT 
    CASE 
        WHEN tenure < 12 THEN '0-1 Year'
        WHEN tenure < 24 THEN '1-2 Years'
        ELSE '2+ Years'
    END AS tenure_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY tenure_group; 

-- Churn vs Monthly Charges
    SELECT 
    CASE 
        WHEN MonthlyCharges < 50 THEN 'Low'
        WHEN MonthlyCharges < 80 THEN 'Medium'
        ELSE 'High'
    END AS charge_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY charge_group; 