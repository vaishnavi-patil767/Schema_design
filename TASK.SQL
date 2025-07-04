- TASK7--
CREATE TABLE employees (emp_id INT PRIMARY KEY,name TEXT,department_id INT,salary INT);
INSERT INTO employees VALUES
(101, 'Alice', 1, 50000),
(102, 'Bob', 2, 75000),
(103, 'Charlie', 2, 65000),
(104, 'David', 3, 45000),
(105, 'Eve', 1, 55000);

DELIMITER $$

CREATE PROCEDURE GetEmployeesByDept(IN dept_id INT)
BEGIN
    SELECT * FROM employees
    WHERE department_id = dept_id;
END $$

DELIMITER ;


CALL GetEmployeesByDept(2);

DELIMITER $$
CREATE FUNCTION GetTotalSalaryByDept(dept_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_salary DECIMAL(10,2);
    
    SELECT SUM(salary)
    INTO total_salary
    FROM employees
    WHERE department_id = dept_id;
    
    RETURN total_salary;
END $$

DELIMITER ;

SELECT GetTotalSalaryByDept(2) AS TotalDeptSalary;
