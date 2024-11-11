CREATE DATABASE pizza;
USE pizza;
-- data view 
SELECT *
FROM  pizza_sales_dataset;

-- counting max_pizza sold
SELECT count(order_id) AS Best_Selling,pizza_name
FROM pizza_sales_dataset
GROUP BY pizza_name
LIMIT 5;

-- Total revenue
SELECT cast(sum(total_price) AS DECIMAL(10,2)) AS total_revenue
FROM pizza_sales_dataset;
 
-- Average order value
SELECT cast(sum(total_price)/count(distinct(order_id)) AS DECIMAL(10,1)) AS order_value
FROM pizza_sales_dataset;

-- Total Quantity Sold
select sum(quantity) as total_quantity 
from pizza_sales_dataset;

-- Daily trend for total order
SELECT DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS week_name,count(distinct(order_id)) AS Total_orders
FROM pizza_sales_dataset
GROUP BY week_name
ORDER BY Total_orders DESC;

-- Montly Trend For Total Orders
SELECT MONTHNAME(STR_TO_DATE(order_date,'%d/%m/%y')) AS Month_name,COUNT(DISTINCT(order_id)) AS Total_orders
FROM pizza_sales_dataset
GROUP BY Month_name
ORDER BY Total_orders DESC;

-- %sales by pizza cateogry
SELECT pizza_category,cast(sum(total_price)AS decimal(10,0)) AS category_sales,
cast(sum(total_price/ (SELECT SUM(total_price) FROM pizza_sales_dataset)*100) AS decimal(10,2)) AS sales_percentage
FROM pizza_sales_dataset
GROUP BY pizza_category
ORDER BY sales_percentage;

-- bottom 5  pizza by revenue
SELECT pizza_name,cast(sum(total_price) AS DECIMAL(10,0)) AS TOTAL_SALE 
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY TOTAL_SALE ASC
limit 5;

-- Top 5 pizza by total orders
SELECT COUNT(DISTINCT(order_id)) AS Total_orders,pizza_name
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY Total_orders DESC
LIMIT 5;
-- bottom 5 pizza by total orders
SELECT COUNT(DISTINCT(order_id)) AS Total_orders,pizza_name
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY Total_orders ASC
LIMIT 5;

-- Top 5 pizza by quantity
SELECT sum(quantity) AS Quantity_orderd,pizza_name
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY Quantity_orderd desc
LIMIT 5;

-- Bottom 5 pizza by quantity
SELECT sum(quantity) AS Quantity_orderd,pizza_name
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY Quantity_orderd ASC
LIMIT 5;












