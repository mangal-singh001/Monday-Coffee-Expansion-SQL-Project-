# ☕ Monday Coffee Expansion SQL Project



(1.png)

**Objective:**  
To help the fictional coffee company **Monday Coffee** identify the best cities in India to open new branches by analyzing sales performance, population demographics, and city-level affordability using SQL.

---

## 🧠 Business Problem

Monday Coffee has been selling products online since January 2023. The company now aims to expand its offline presence by opening physical coffee shops. Using sales data, customer records, city demographics, and rental estimates, we answer:

> 🟤 “Which 3 cities offer the highest business potential for expansion based on performance, customer base, and cost-efficiency?”

---

## 📁 Project Structure

```

📂 Monday-Coffee-Expansion-SQL-Project-
│
├── 📄 city.csv               → City population, rent & rank
├── 📄 customers.csv          → Customer details (with city ID)
├── 📄 products.csv           → Product name and price
├── 📄 sales.csv              → Sales records (2023)
├── 📄 Schemas.sql            → Table creation scripts
├── 📄 Questions.sql          → All business questions
├── 📄 Solutions.sql          → SQL solutions for analysis
├── 📄 Recommendations.sql    → Final expansion suggestions
├── 📄 ERD Diagram.pgerd      → Entity Relationship Diagram
└── 📄 README.md              → Project documentation (this file)

````

---

## 🛠️ Tools & Technologies

- **SQL** (PostgreSQL/MySQL)
- **Jupyter Notebook** (via Python's SQL extensions, optional)
- **Spreadsheet Tools** (CSV handling)
- **ERD Design** (Schema planning)

---

## 🧮 Database Schema

- `city` – population, rent estimate, city rank  
- `customers` – customer ID, name, city ID  
- `products` – product ID, name, price  
- `sales` – transaction info (product, customer, total, rating, date)  

🧾 [See Full Schema in `Schemas.sql`](./Schemas.sql.sql)

---

## 📊 Key Business Questions Answered


---


1. ☕ **Coffee Consumers Count**
   *How many people in each city are estimated to consume coffee, given that 25% of the population does?*

2. 💰 **Total Revenue from Coffee Sales**
   *What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?*

3. 📦 **Sales Count for Each Product**
   *How many units of each coffee product have been sold?*

4. 🧾 **Average Sales Amount per City**
   *What is the average sales amount per customer in each city?*

5. 🏙️ **City Population and Coffee Consumers**
   *Provide a list of cities along with their populations and estimated coffee consumers.*

6. 🥇 **Top Selling Products by City**
   *What are the top 3 selling products in each city based on sales volume?*

7. 👥 **Customer Segmentation by City**
   *How many unique customers are there in each city who have purchased coffee products?*

8. 💸 **Average Sale vs Rent**
   *Find each city and their average sale per customer and average rent per customer.*

9. 📈 **Monthly Sales Growth**
   *Calculate the percentage growth (or decline) in sales over different months.*

10. 📊 **Market Potential Analysis**
    *Identify the top 3 cities based on highest sales. Return city name, total sale, total rent, total customers, and estimated coffee consumers.*

---



---

## 📌 Summary of Findings

### 🔝 Top Recommended Cities

| City     | Why Recommended |
|----------|------------------|
| **Pune**   | Highest total revenue, low rent per customer |
| **Delhi**  | Largest potential customer base (7.7M), high total customers |
| **Jaipur** | Most customers (69), lowest average rent per customer |

📝 Source: [`Recommendations.sql`](./Recommendations.sql)

---

## 🧠 Sample SQL Query

```sql
-- Total Revenue by City in Q4 2023
SELECT 
  c1.city_name,
  SUM(total) AS total_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN city c1 ON c.city_id = c1.city_id
WHERE EXTRACT(YEAR FROM sale_date) = 2023
  AND EXTRACT(QUARTER FROM sale_date) = 4
GROUP BY c1.city_name
ORDER BY total_revenue DESC;
````

🧾 See full analysis in [`Solutions.sql`](./Solutions.sql)

---

## 🔍 Entity Relationship Diagram (ERD)

📌 4 Tables: `city`, `customers`, `products`, `sales`
Primary–Foreign Key relationships based on city and product/customer mappings.

📎 [View Diagram](./ERD%20Diagram.pgerd)

---

## 🧠 Key Learnings

* Writing optimized joins and aggregations
* Using **CTEs**, **Window Functions**, and **Subqueries**
* Combining business logic with SQL metrics
* Simulating real-world expansion analysis

---

## 📬 Connect with Me

* 💼 [LinkedIn](https://www.linkedin.com/in/mangal-singh123/)
* 💻 [GitHub](https://github.com/mangal-singh001)

---



