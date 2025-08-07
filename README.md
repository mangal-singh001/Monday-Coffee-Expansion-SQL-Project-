☕ Monday Coffee Expansion SQL Project
Objective:
The goal of this project is to analyze customer and sales data using SQL to help the hypothetical coffee chain "Monday Coffee" identify the most suitable cities for business expansion in India. By leveraging MySQL and business intelligence techniques, we aim to recommend cities based on revenue, affordability, population, and other performance indicators.

📁 Project Structure
bash
Copy
Edit
📂 Monday-Coffee-Expansion-SQL-Project
│
├── 📄 Coffee_Sales_Analysis.ipynb      # SQL queries run in Jupyter Notebook
├── 📄 sales.csv                         # Coffee shop sales data
├── 📄 city_info.csv                     # City-level demographic and rent data
└── 📄 README.md                         # Project documentation
📊 Dataset Overview
The project uses two primary datasets:

Sales Dataset (50,000+ records)

Fields: Order ID, Date, Product, Category, Revenue, Customer ID, City

Purpose: To analyze total revenue, popular products, city-wise performance

City Information Dataset

Fields: City Name, Population, Average Rent, State

Purpose: To evaluate affordability and customer density for expansion

🛠 Tools & Technologies Used
SQL (MySQL) – Core querying and analysis

Python (pymysql, pandas) – To connect MySQL with Jupyter and run queries

Jupyter Notebook – For executing SQL + visualizing output

Matplotlib / Seaborn – For visual insights and comparisons

🔍 Key Business Questions
Which cities are generating the highest revenue?

What is the average revenue per customer per city?

How does each city compare in terms of rent, population, and revenue?

Which cities offer high business potential and low rental costs?

📈 Analysis Highlights
✅ Data Loading & Setup

Loaded sales.csv and city_info.csv into MySQL using Python scripts

Created relational tables and indexes for fast querying

✅ Revenue & City Insights

Identified top-performing cities like Mumbai, Delhi, and Bangalore in terms of total revenue

Calculated revenue per customer and compared it across all cities

✅ Affordability Analysis

Merged rent data and computed revenue-to-rent ratios

Cities like Pune, Jaipur, and Chandigarh emerged as cost-effective options

✅ Expansion Recommendation

Final recommendations were made based on:

High revenue per customer

Lower average rent

Dense population

Recommended Cities:

🏙️ Pune

🏙️ Jaipur

🏙️ Delhi


📌 Key Learnings
Writing optimized SQL queries for large datasets

Using joins, aggregations, and subqueries effectively

Data storytelling through SQL + Python

Decision-making using real-world business metrics

🔗 GitHub Repository
👉 View the full project on GitHub

📬 Connect With Me
LinkedIn: Mangal Singh

GitHub: mangal-singh001

“Transforming raw data into smart business decisions — one query at a time.”



