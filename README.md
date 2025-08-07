# ☕ Monday Coffee Expansion SQL Project

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

1. ☕ **How many people in each city are likely to consume coffee?**  
   (25% of population assumed to be coffee drinkers)

2. 💰 **What’s the total revenue and average revenue per customer by city?**

3. 📦 **What are the top-selling products by city?**

4. 🏙️ **What’s the customer base in each city?**

5. 🏠 **What’s the average rent per customer in each city?**

6. 📈 **How is monthly sales growth trending across cities?**

7. 🔍 **Which 3 cities should Monday Coffee expand to?**

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

> “Turning coffee and queries into smart expansion strategies.”

```


