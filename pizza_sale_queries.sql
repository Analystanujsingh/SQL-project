--  1: Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM PizzaSaleRevenue;

-- 2: Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_order_value FROM PizzaSaleRevenue;

--  3: Average Pizza Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM PizzaSaleRevenue;

--  4: Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_order FROM PizzaSaleRevenue;

-- 5: Average Pizzas per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10, 2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) AS DECIMAL(10, 2)) AS Avg_pizza_per_order FROM PizzaSaleRevenue;

--  6: Daily Trends of Order
SELECT TO_CHAR(order_date, 'Day'), COUNT(DISTINCT order_id) AS Total_orders FROM PizzaSaleRevenue GROUP BY TO_CHAR(order_date, 'Day');

--  7: Monthly Trends of Orders
SELECT TO_CHAR(order_date, 'Month') AS Month_name, COUNT(DISTINCT order_id) AS Total_orders FROM PizzaSaleRevenue GROUP BY TO_CHAR(order_date, 'Month');

--  8: Percentage of Sales by Pizza Category
SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM PizzaSaleRevenue) AS Total_sales FROM PizzaSaleRevenue GROUP BY pizza_category;

--  9: Percentage of Sales by Pizza Size (Quarterly)
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM PizzaSaleRevenue WHERE EXTRACT(QUARTER FROM order_date) = 1) AS DECIMAL(10, 2)) AS Total_sales FROM PizzaSaleRevenue WHERE EXTRACT(QUARTER FROM order_date) = 1 GROUP BY pizza_size ORDER BY Total_sales DESC;

--  10: Top 5 Best Performing Pizzas
SELECT pizza_name, SUM(total_price) AS Total_revenue FROM PizzaSaleRevenue GROUP BY pizza_name ORDER BY Total_revenue DESC LIMIT 5;

--  11: Bottom 5 Least Performing Pizzas
SELECT pizza_name, SUM(total_price) AS Total_revenue FROM PizzaSaleRevenue GROUP BY pizza_name ORDER BY Total_revenue ASC LIMIT 5;
