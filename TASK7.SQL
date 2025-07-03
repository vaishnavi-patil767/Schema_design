
-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES 
(1, 'Laptop', 60000),
(2, 'Mouse', 500),
(3, 'Keyboard', 1500),
(4, 'Monitor', 10000);

-- Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO sales VALUES 
(101, 1, 2, '2024-06-01'),
(102, 2, 5, '2024-06-02'),
(103, 3, 3, '2024-06-05'),
(104, 1, 1, '2024-06-10'),
(105, 4, 4, '2024-06-12');

-- CREATING VIEW
CREATE VIEW sales_summary AS
SELECT p.product_name,s.quantity,p.price,(s.quantity * p.price) AS total_amount,s.sale_date
FROM sales s
JOIN products p ON s.product_id = p.product_id;

SELECT * FROM sales_summary;

-- FILTERING THE VIEW
CREATE VIEW high_value_sales AS
SELECT * FROM sales_summary WHERE total_amount > 20000;
SELECT * FROM high_value_sales;

-- A view in SQL is a virtual table based on the result of a SELECT query. It doesn’t store actual data—it just stores a saved query you can use like a table.

