-- Selecting all columns from customers and orders

SELECT*FROM customers

SELECT*FROM orders

-- Counting orders for each city to see which cities with the most orders using JOIN for orders and customers tables

SELECT customers.customer_city, COUNT(customers.customer_city) as count_city FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_city
ORDER BY count_city DESC

-- Counting order status from the top 3 cities with the most orders 'sao paulo', 'rio de janeiro', and 'belo horizonte' using JOIN for orders and customers table

SELECT orders.order_status, COUNT(orders.order_status) as count_status FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.customer_city = 'sao paulo'
GROUP BY orders.order_status
ORDER BY count_status DESC

SELECT orders.order_status, COUNT(orders.order_status) as count_status FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.customer_city = 'rio de janeiro'
GROUP BY orders.order_status
ORDER BY count_status DESC

SELECT orders.order_status, COUNT(orders.order_status) as count_status FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.customer_city = 'belo horizonte'
GROUP BY orders.order_status
ORDER BY count_status DESC
