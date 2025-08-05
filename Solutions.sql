-- 1.Coffee Consumers Count
-- How many people in each city are estimated to consume coffee, given that 25% of the population does?



SELECT 
	city_name, 
	ROUND((population * 0.25)/1000000,2) AS coffee_consumers_in_millions,
	city_rank
FROM city
ORDER BY 2 DESC;



-- 2.Total Revenue from Coffee Sales
-- What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?



SELECT 
	c1.city_name,
	SUM(total) AS Total_revenue
FROM sales AS s
JOIN customers AS c
ON s.customer_id = c.customer_id
JOIN city AS c1
ON c.city_id = c1.city_id
WHERE 
	EXTRACT(YEAR FROM s.sale_date) = 2023
	AND
	EXTRACT(QUARTER FROM s.sale_date) = 4
GROUP BY 1
ORDER BY 2 DESC;



-- 3.Sales Count for Each Product
-- How many units of each coffee product have been sold?



SELECT 
	product_name,
	COUNT(s.sale_id) AS Total_orders
FROM products AS p
LEFT JOIN sales AS s
ON p.product_id = s.product_id
GROUP BY 1
ORDER BY 2 DESC;





-- 4.Average Sales Amount per City
-- What is the average sales amount per customer in each city?

SELECT 
	c1.city_name,
	SUM(s.total) AS total_revenue ,
	COUNT(DISTINCT s.customer_id) AS total_cx,
	ROUND(SUM(s.total)::numeric / COUNT(DISTINCT s.customer_id)::numeric,2) AS average_sale_per_cx
FROM sales AS s 
JOIN customers AS c
ON s.customer_id = c.customer_id
JOIN city c1
ON c.city_id = c1.city_id
GROUP BY 1
ORDER BY  2 DESC;




-- 5.City Population and Coffee Consumers
-- Provide a list of cities along with their populations and estimated coffee consumers.



WITH city_table AS 
(
	SELECT 
		city_name,
		ROUND((population * 0.25) / 1000000,2) AS coffee_consumers_in_millions
	FROM city
),
customer_table
AS
(
	SELECT 
			c1.city_name,
			COUNT(DISTINCT c.customer_id) AS unique_cx
	FROM sales AS s
	JOIN customers AS c
	ON s.customer_id = c.customer_id 
	JOIN city AS c1
	ON c.city_id = c1.city_id 
	GROUP BY 1
 )
 SELECT 
 	ct.city_name,
	ct.coffee_consumers_in_millions,
	cit.unique_cx
FROM city_table AS ct
JOIN customer_table AS cit
ON cit.city_name = ct.city_name





-- 6.Top Selling Products by City
-- What are the top 3 selling products in each city based on sales volume?


SELECT * 
FROM
(
	SELECT
		c1.city_name,
		p.product_name,
		COUNT(s.sale_id) AS total_order,
		DENSE_RANK() OVER(PARTITION BY c1.city_name ORDER BY COUNT(s.sale_id) DESC) AS rank
	FROM sales AS s 
	JOIN products AS p 
	ON s.product_id = p.product_id
	JOIN customers AS c
	ON c.customer_id = s.customer_id 
	JOIN city AS c1
	ON c.city_id = c1.city_id
	GROUP BY 1,2
) AS t1
WHERE rank <= 3;




-- 7.Customer Segmentation by City
-- How many unique customers are there in each city who have purchased coffee products?



SELECT 
	c1.city_name,
	COUNT(DISTINCT c.customer_id) AS unique_cx
FROM city AS c1
LEFT JOIN customers AS c
ON c1.city_id = c.city_id
JOIN sales AS s
ON s.customer_id = c.customer_id
WHERE 
	s.product_id IN(1,2,3,4,5,6,7,8,9,10,11,12,13,14)
GROUP BY 1
ORDER BY 2 DESC;



-- 8.Average Sale vs Rent
-- Find each city and their average sale per customer and avg rent per customer




WITH city_table 
AS
(
	SELECT   
		c1.city_name,
		SUM(s.total) AS total_revenue,
		COUNT(DISTINCT s.customer_id) AS total_cx,
		ROUND(SUM(s.total)::numeric / COUNT(DISTINCT s.customer_id)::numeric,2) AS average_sale_per_cx
	FROM sales AS s
	JOIN customers AS c
	ON s.customer_id = c.customer_id
	JOIN city AS c1 
	ON c1.city_id = c.city_id
	GROUP BY  1
	ORDER BY 2 DESC
),
city_rent 
AS 
(
SELECT 
	city_name,
	estimated_rent
FROM city
)
SELECT
	cr.city_name,
	cr.estimated_rent,
	ct.total_cx,
	ct.average_sale_per_cx,
	ROUND(
		cr.estimated_rent::numeric  / ct.total_cx::numeric,2) AS avg_rent_per_cs
FROM city_rent AS cr
JOIN city_table AS ct
ON cr.city_name = ct.city_name
ORDER BY 4 DESC





-- 9.Monthly Sales Growth
-- Sales growth rate: Calculate the percentage growth (or decline) in sales over different time periods (monthly) By each city.



WITH monthly_sales
AS 
(
	SELECT 
		c1.city_name,
		EXTRACT(MONTH FROM s.sale_date) AS month,
		EXTRACT(YEAR FROM s.sale_date) AS year,
		SUM(s.total) AS total_sale
	FROM sales AS s
	JOIN customers AS c
	ON s.customer_id = c.customer_id 
	JOIN city AS c1
	ON c1.city_id = c.city_id
	GROUP BY 1,2,3
	ORDER BY 1,3,2
),
growth_ratio
AS
(
	SELECT 
		city_name,
		month,
		year,
		total_sale AS cr_month_sale,
		LAG(total_sale,1) OVER(PARTITION BY city_name ORDER BY year,month) AS last_month_sale
	FROM monthly_sales
	)
SELECT
	city_name,
	month,
	year,
	cr_month_sale,
	last_month_sale,
	ROUND(
		(cr_month_sale - last_month_sale)::numeric / last_month_sale::numeric * 100
		, 2
		) AS growth_ratio
FROM growth_ratio
WHERE 
	last_month_sale IS NOT NULL;





-- 10.Market Potential Analysis
-- Identify top 3 city based on highest sales, return city name, total sale, total rent, total customers, estimated coffee consumer





WITH city_table 
AS
(
	SELECT   
		c1.city_name,
		SUM(s.total) AS total_revenue,
		COUNT(DISTINCT s.customer_id) AS total_cx,
		ROUND(SUM(s.total)::numeric / COUNT(DISTINCT s.customer_id)::numeric,2) AS average_sale_per_cx
	FROM sales AS s
	JOIN customers AS c
	ON s.customer_id = c.customer_id
	JOIN city AS c1 
	ON c1.city_id = c.city_id
	GROUP BY  1
	ORDER BY 2 DESC
),
city_rent 
AS 
(
SELECT 
	city_name,
	estimated_rent,
	ROUND((population * 0.25)/1000000,2) as estimated_coffee_consumer_in_millions
FROM city
)
SELECT
	cr.city_name,
	ct.total_revenue,
	cr.estimated_rent as total_rent,
	ct.total_cx,
	cr.estimated_coffee_consumer_in_millions,
	ct.average_sale_per_cx,
	ROUND(
		cr.estimated_rent::numeric  / ct.total_cx::numeric,2) AS avg_rent_per_cx
FROM city_rent AS cr
JOIN city_table AS ct
ON cr.city_name = ct.city_name
ORDER BY 2 DESC





