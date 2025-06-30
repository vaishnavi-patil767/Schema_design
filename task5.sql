CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO customer (customer_id, name, city) VALUES
(1, 'Alice', 'Pune'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Delhi'),
(4, 'David', 'Bangalore');

CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10, 2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
INSERT INTO orders1 (order_id, customer_id, amount, order_date) VALUES
(101, 1, 250.00, '2023-06-01'),
(102, 2, 300.00, '2023-06-05'),
(103, 1, 150.00, '2023-06-07'),
(104, 3, 400.00, '2023-06-10');

-- inner join--
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customer c
INNER JOIN orders1 o ON c.customer_id = o.customer_id;

-- left join-
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customer c
LEFT JOIN orders1 o ON c.customer_id = o.customer_id;

-- right joins
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customer c
RIGHT JOIN orders1 o ON c.customer_id = o.customer_id;

-- fullouter join--
SELECT c.customer_id, c.name, o.order_id, o.amount FROM customer c LEFT JOIN orders1 o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, c.name, o.order_id, o.amount FROM customer c RIGHT JOIN orders1 o ON c.customer_id = o.customer_id;

-- cross join--
SELECT c.name, o.order_id FROM customer c CROSS JOIN orders1 o;
