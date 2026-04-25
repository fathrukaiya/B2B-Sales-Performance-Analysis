/* =========================================================
   Project: B2B Sales Performance Analysis
   File: queries.sql
   Purpose: SQL queries used for sales performance analysis
   Tool: SQL Server / SSMS
   Table: dbo.Sales_Data
   ========================================================= */

-- =========================================================
-- 1. Preview Dataset
-- =========================================================

SELECT *
FROM dbo.Sales_Data;


-- =========================================================
-- 2. Total Revenue
-- =========================================================

SELECT 
    SUM(Revenue) AS total_revenue
FROM dbo.Sales_Data;


-- =========================================================
-- 3. Total Profit
-- =========================================================

SELECT 
    SUM(Profit) AS total_profit
FROM dbo.Sales_Data;


-- =========================================================
-- 4. Average Order Value
-- =========================================================

SELECT 
    ROUND(AVG(Revenue), 2) AS average_order_value
FROM dbo.Sales_Data;


-- =========================================================
-- 5. Overall Profit Margin
-- =========================================================

SELECT 
    ROUND(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0), 2) AS overall_profit_margin
FROM dbo.Sales_Data;


-- =========================================================
-- 6. Revenue by Region
-- =========================================================

SELECT 
    Region,
    SUM(Revenue) AS region_revenue
FROM dbo.Sales_Data
GROUP BY Region
ORDER BY region_revenue DESC;


-- =========================================================
-- 7. Profit Margin by Region
-- =========================================================

SELECT 
    Region,
    SUM(Revenue) AS total_revenue,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0), 2) AS profit_margin
FROM dbo.Sales_Data
GROUP BY Region
ORDER BY profit_margin DESC;


-- =========================================================
-- 8. Monthly Revenue Trend
-- =========================================================

SELECT 
    MONTH(Order_Date) AS month_no,
    SUM(Revenue) AS monthly_revenue
FROM dbo.Sales_Data
GROUP BY MONTH(Order_Date)
ORDER BY month_no;


-- =========================================================
-- 9. Monthly Profit Trend
-- =========================================================

SELECT 
    MONTH(Order_Date) AS month_no,
    SUM(Profit) AS monthly_profit
FROM dbo.Sales_Data
GROUP BY MONTH(Order_Date)
ORDER BY month_no;


-- =========================================================
-- 10. Top 5 Clients by Revenue
-- =========================================================

SELECT TOP 5
    Client_Name,
    SUM(Revenue) AS total_revenue
FROM dbo.Sales_Data
GROUP BY Client_Name
ORDER BY total_revenue DESC;


-- =========================================================
-- 11. Top 5 Clients by Profit
-- =========================================================

SELECT TOP 5
    Client_Name,
    SUM(Profit) AS total_profit
FROM dbo.Sales_Data
GROUP BY Client_Name
ORDER BY total_profit DESC;


-- =========================================================
-- 12. Lowest 5 Clients by Revenue
-- =========================================================

SELECT TOP 5
    Client_Name,
    SUM(Revenue) AS total_revenue
FROM dbo.Sales_Data
GROUP BY Client_Name
ORDER BY total_revenue ASC;


-- =========================================================
-- 13. Revenue by Sales Representative
-- =========================================================

SELECT 
    Sales_Rep,
    SUM(Revenue) AS sales_revenue
FROM dbo.Sales_Data
GROUP BY Sales_Rep
ORDER BY sales_revenue DESC;


-- =========================================================
-- 14. Profit by Sales Representative
-- =========================================================

SELECT 
    Sales_Rep,
    SUM(Profit) AS rep_profit
FROM dbo.Sales_Data
GROUP BY Sales_Rep
ORDER BY rep_profit DESC;


-- =========================================================
-- 15. Sales Representative Ranking by Revenue
-- =========================================================

SELECT 
    Sales_Rep,
    SUM(Revenue) AS total_revenue,
    RANK() OVER (ORDER BY SUM(Revenue) DESC) AS revenue_rank
FROM dbo.Sales_Data
GROUP BY Sales_Rep;


-- =========================================================
-- 16. Revenue by Product Category
-- =========================================================

SELECT 
    Product_Category,
    SUM(Revenue) AS product_revenue
FROM dbo.Sales_Data
GROUP BY Product_Category
ORDER BY product_revenue DESC;


-- =========================================================
-- 17. Profit by Product Category
-- =========================================================

SELECT 
    Product_Category,
    SUM(Profit) AS product_profit
FROM dbo.Sales_Data
GROUP BY Product_Category
ORDER BY product_profit DESC;


-- =========================================================
-- 18. Payment Method Usage
-- =========================================================

SELECT 
    Payment_Method,
    COUNT(*) AS order_count
FROM dbo.Sales_Data
GROUP BY Payment_Method
ORDER BY order_count DESC;


-- =========================================================
-- 19. High Value Orders
-- Orders with revenue above 1,000,000
-- =========================================================

SELECT *
FROM dbo.Sales_Data
WHERE Revenue > 1000000
ORDER BY Revenue DESC;


-- =========================================================
-- 20. Orders Count by Region
-- =========================================================

SELECT 
    Region,
    COUNT(*) AS total_orders
FROM dbo.Sales_Data
GROUP BY Region
ORDER BY total_orders DESC;
