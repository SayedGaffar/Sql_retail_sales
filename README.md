## Retail Sales Data Analysis (PostgreSQL)
This project analyzes a retail sales dataset using PostgreSQL, focusing on business-critical insights using SQL techniques such as CTEs, Views, Aggregations, and Window Functions.

🧰 Technologies Used
PostgreSQL

SQL Core Concepts:

Views & CTEs

Aggregations

Window Functions

Conditional Logic

🗃️ Dataset Overview
The dataset represents sales transactions and includes the following columns:

Column Name	Data Type	Description
transaction_id	INT	Unique identifier for each sale
sale_date	DATE	Date of the transaction
sale_time	TIME	Time of the transaction
customer_id	INT	ID of the customer
gender	VARCHAR	Gender of the customer
age	INT	Age of the customer
category	VARCHAR	Product category
quantity	INT	Quantity sold
price_per_unit	FLOAT	Price per unit
cogs	FLOAT	Cost of goods sold
total_sale	FLOAT	Total sale amount

📊 Business Questions Answered
Q1: Sales made on 2022-11-05
Retrieve all transactions from this specific date.

Q2: Clothing sales with quantity > 10 in November 2022
Filter for clothing items with high-volume transactions.

Q3: Total Sales by Category
Summarizes total revenue per product category.

Q4: Average Age of 'Beauty' Shoppers
Identifies the age demographic of Beauty product buyers.

Q5: High-Value Transactions
Find transactions where total sale exceeds 1000.

Q6: Transaction Count by Gender and Category
Gives a breakdown of transaction frequency across gender and category.

Q7: Average Monthly Sales and Best Month
Uses CTEs to calculate monthly averages and identify top-performing months.

Q8: Top 5 Customers by Sales
Ranks customers based on their total purchase value.

Q9: Unique Customers per Category
Counts distinct customers purchasing within each product category.

Q10: Sales by Shift (Time of Day)
Categorizes transactions into Morning (≤12), Afternoon (12–17), and Evening (>17) shifts.

🧹 Data Cleaning
Corrected column name typo: quantiy ➝ quantity

Removed rows with any NULL values

📁 Views
Created a view: unique_customers_per_category to summarize unique customer counts per category.

🚀 How to Use
Load the SQL file into your PostgreSQL environment.

Run individual queries to analyze specific aspects of the dataset.

Extend the analysis by introducing KPIs, joins, or dashboards in BI tools.

📌 Key Learnings
Leveraged window functions for cumulative analysis

Implemented time-based data slicing using EXTRACT

Used CASE statements to create dynamic grouping
