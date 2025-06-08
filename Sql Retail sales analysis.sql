-- RETAIL SALES DATA ANALYSIS
CREATE DATABASE Retail_sales;

-- CREATE TABLE
CREATE TABLE retail_sales_data (
            transaction_id INT PRIMARY KEY, 
            sale_date DATE,
            sale_time TIME,
            customer_id INT,
            gender VARCHAR(10),
            age INT,
            category VARCHAR(15),
            quantiy INT,
            price_per_unit FLOAT,
            cogs FLOAT,
            total_sale FLOAT
)

SELECT * FROM retail_sales_data;

-- Data cleaning

ALTER TABLE retail_sales_data
RENAME quantiy TO quantity;

SELECT * FROM retail_sales_data
WHERE
transaction_id IS NULL
OR
sale_date IS  NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantity IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL
;

DELETE FROM retail_sales_data
WHERE
transaction_id IS NULL
OR
sale_date IS  NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantity IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL
;

SELECT COUNT(*) FROM retail_sales_data;

-- Data Exploration

--1.Retrieve all sales made on '2022-11-05'

SELECT * FROM retail_sales_data
WHERE sale_date ='2022-11-05';

--2.Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in Nov 2022

SELECT *,
       SUM(quantity) OVER (PARTITION BY category) AS total_category_quantity
FROM retail_sales_data
WHERE category = 'Clothing'
  AND quantity > 10
  AND sale_date >= '2022-11-01'
  AND sale_date <= '2022-12-01';

-- 3.Calculate the total sales (total_sale) for each category

SELECT SUM(total_sale) AS Total_sales, category
FROM retail_sales_data
GROUP BY category
ORDER BY Total_sales DESC;

--4.Find the average age of customers who purchased items from the 'Beauty' category

SELECT AVG(age) AS Customer_avg_age
FROM retail_sales_data
where category = 'Beauty'
;

--5.Retrieve all transactions where total_sale is greater than 1000

SELECT COUNT(*) AS high_value_transaction_count
FROM retail_sales_data
WHERE total_sale > 1000;

--6.Find the total number of transactions (transaction_id) made by each gender in each category

select count (transaction_id) AS no_of_transactions, gender, category
from retail_sales_data
group by gender, category
order by gender, category
;

--7.Calculate the average sale for each month and find the best-selling month in each year

WITH monthly_sales AS (
    SELECT 
        EXTRACT(MONTH FROM sale_date) AS sale_month,
        EXTRACT(YEAR FROM sale_date) AS sale_year,
        total_sale
    FROM retail_sales_data
)

SELECT 
    sale_month,
    sale_year,
    AVG(total_sale) AS avg_sales
FROM monthly_sales
GROUP BY sale_month, sale_year
ORDER BY sale_month, sale_year;


-- 8.Find the top 5 customers based on the highest total sales

SELECT * FROM retail_sales_data
ORDER BY total_sale DESC
LIMIT 5;

--9.Find the number of unique customers who purchased items from each category

SELECT COUNT (DISTINCT customer_id) AS unique_customers, category
FROM retail_sales_data
GROUP BY category
;
CREATE VIEW unique_customers_per_category AS
SELECT 
    COUNT(DISTINCT customer_id) AS unique_customers,
    category
FROM retail_sales_data
GROUP BY category;

--10.Create each shift and count the number of orders (Morning <=12, Afternoon Between 12 & 17, Evening >17)

SELECT
  CASE
    WHEN EXTRACT(HOUR FROM sale_time) <= 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(transaction_id) AS order_count
FROM retail_sales_data
GROUP BY shift
ORDER BY shift;
