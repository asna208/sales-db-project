--Total Sales Revenue
SELECT SUM(s.sales) AS total_revenue 
FROM Sales s;

--Total order count
SELECT COUNT(order_id) AS total_orders
FROM orders o;

--Best-Selling Products
SELECT p.product_line, SUM(od.quantity) AS total_sold
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_line
ORDER BY total_sold DESC
LIMIT 5;

---Monthly Revenue Calculation
SELECT strftime('%Y-%m', o.order_date) AS sales_month, SUM(s.sales) AS revenue
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Sales s ON od.orderdetail_id = s.orderdetail_id
GROUP BY sales_month
ORDER BY sales_month;

--Top 10 Customers by Total Spending
SELECT c.customer_name, SUM(s.sales) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Sales s ON od.orderdetail_id = s.orderdetail_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

--Low-Selling Product Lines
SELECT p.product_line, SUM(od.quantity) AS total_sold
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_line
HAVING SUM(od.quantity) < 10
ORDER BY total_sold ASC;

--Order Status Breakdown
SELECT status, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY status
ORDER BY total_orders DESC;

--Average Order Value
SELECT AVG(s.sales) AS avg_order_value
FROM Sales s;

.mode csv
.output sales_report.csv
.output stdout

 -- Sales by Country (Output to CSV)

.mode csv
.output sales_report.csv
SELECT c.country, SUM(s.sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN sales s ON od.orderdetail_id = s.orderdetail_id
GROUP BY c.country
ORDER BY total_sales DESC;
.output stdoutv