-- task 6--
CREATE TABLE employees (emp_id INT PRIMARY KEY,name TEXT,department_id INT,salary INT);
INSERT INTO employees VALUES
(101, 'Alice', 1, 50000),
(102, 'Bob', 2, 75000),
(103, 'Charlie', 2, 65000),
(104, 'David', 3, 45000),
(105, 'Eve', 1, 55000);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    dept_name TEXT
);

INSERT INTO departments VALUES
(1, 'HR'), (2, 'IT'), (3, 'Sales');

-- subqueries in select 
SELECT name,salary,(SELECT AVG(salary)
     FROM employees e2
	WHERE e2.department_id = e1.department_id) AS avg_dept_salary FROM employees e1;

-- Subqueries in WHERE
SELECT name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
-- in
SELECT name FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE dept_name IN ('IT', 'Sales')
);
-- exit
SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM employees e2 WHERE e2.department_id = e.department_id AND e2.salary > 70000
);

-- Subqueries in FROM
SELECT d.dept_name, avg_salaries.avg_salary
FROM (SELECT department_id, AVG(salary) AS avg_salary FROM employees GROUP BY department_id) AS avg_salaries
JOIN departments d ON d.department_id = avg_salaries.department_id
WHERE avg_salaries.avg_salary > 60000;

-- Bonus: Nested Subquery
SELECT name, salary FROM employees WHERE salary > (SELECT MIN(salary)FROM employees WHERE department_id = (
SELECT department_id FROM (SELECT department_id, AVG(salary) AS avg_salary FROM employees
GROUP BY department_id ORDER BY avg_salary DESC LIMIT 1) AS top_dept
    )
);