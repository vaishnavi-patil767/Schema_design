-- task4--
CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    order_date DATE
);
INSERT INTO orders VALUES
(1, 'Alice', 'Laptop', 2, 60000, '2024-05-10'),
(2, 'Bob', 'Mouse', 3, 500, '2024-05-11'),
(3, 'ram', 'tv', 1, 50000, '2024-05-12'),
(4, 'Charlie', 'Keyboard', 2, 1500, '2024-05-13'),
(5, 'priya', 'ipad', 1, 60000, '2024-05-14'),
(6, 'om', 'mobile', 1, 30000, '2024-05-01'),
(7, 'rohan', 'charger', 5, 600, '2024-03-11');

select sum(price_per_unit) from orders;
select max(price_per_unit) from orders;
select min(price_per_unit) from orders;
select avg(price_per_unit) from orders;
select count(price_per_unit) from orders;
select count(order_id) from orders;


SELECT customer_name, SUM(quantity) AS total_quantity FROM orders GROUP BY customer_name;
SELECT customer_name, max(quantity) AS max_total_quantity FROM orders GROUP BY customer_name;
SELECT customer_name, min(quantity) AS min_total_quantity FROM orders GROUP BY customer_name;
SELECT customer_name, COUNT(order_id) AS order_count FROM orders GROUP BY customer_name;
SELECT product, AVG(quantity) AS avg_quantity FROM orders GROUP BY product;
SELECT customer_name,SUM(quantity) AS total_quantity FROM orders GROUP BY customer_name HAVING total_quantity > 1;
SELECT customer_name,max(quantity) AS max_quantity FROM orders GROUP BY customer_name HAVING max_quantity > 2;
SELECT product, SUM(quantity * price_per_unit) AS total_revenue FROM orders GROUP BY product;
SELECT product, MIN(price_per_unit) AS min_price FROM orders GROUP BY product;
SELECT product, max(price_per_unit) AS max_price FROM orders GROUP BY product;
SELECT customer_name, SUM(quantity) AS total_quantity FROM orders GROUP BY customer_name HAVING SUM(quantity) > 2;
select customer_name, avg(price_per_unit) as avg_price_per_unit from orders group by customer_name having avg(quantity)>2;
