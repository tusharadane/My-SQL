-- Switch to the 'grouping_data' database
USE grouping_data;

-- Show all tables in the 'grouping_data' database
SHOW TABLES;

-- This query retrieves all records and columns from the 'employee' table.
SELECT * FROM employee;

-- DISTINCT Clause:
-- Syntax: SELECT DISTINCT column1 FROM table_name;
-- Used to return only distinct (different) values.
-- Use it to remove duplicates from the result set.
-- This query retrieves distinct values of 'employee_department' from the 'employee' table.
SELECT DISTINCT employee_department FROM employee;

-- GROUP BY Clause:
-- Syntax: SELECT column1, aggregate_function(column2) FROM table_name GROUP BY column1;
-- Used to arrange identical data into groups.
-- Use it to perform aggregate functions on groups of rows.

-- This query groups the records by 'employee_department'.
SELECT employee_department FROM employee
GROUP BY employee_department;

-- Group by 'employee_department' and calculate the sum of 'employee_salary'
SELECT employee_department, SUM(employee_salary) FROM employee
GROUP BY employee_department;

-- Group by 'employee_department' and calculate various aggregate functions on 'employee_salary'
SELECT employee_department, SUM(employee_salary),
AVG(employee_salary),
MAX(employee_salary),
MIN(employee_salary),
COUNT(employee_salary) FROM employee
GROUP BY employee_department;

-- Group by 'employee_department' and 'employee_position' and calculate the sum of 'employee_salary'
SELECT employee_department, employee_position,
SUM(employee_salary) FROM employee
GROUP BY employee_department, employee_position;

-- Group by 'employee_department' and count the number of employees in each department
SELECT employee_department, COUNT(*) FROM employee
GROUP BY employee_department;


-- HAVING Clause:
-- Syntax: SELECT column1, aggregate_function(column2) FROM table_name GROUP BY column1 HAVING condition;
-- Used to filter groups based on a condition.
-- Use it to apply conditions on aggregate functions.

-- Group by 'employee_department' and count the number of employees in each department, only showing departments with more than 3 employees
SELECT employee_department, COUNT(*) AS total_employees FROM employee
GROUP BY employee_department
HAVING total_employees > 3;


-- Complex query with GROUP BY, HAVING, ORDER BY, and LIMIT
SELECT employee_department, SUM(employee_salary) FROM employee
WHERE employee_salary > 70000
GROUP BY employee_department
HAVING SUM(employee_salary) > 100000
ORDER BY SUM(employee_salary) ASC
LIMIT 1 OFFSET 1;


-- Constraints:
-- PRIMARY KEY:
-- Ensures that each record in a table is unique and not null.
-- Use it to uniquely identify each record in a table.

-- NOT NULL:
-- Ensures that a column cannot have a NULL value.
-- Use it to enforce that a column must always have a value.

-- CHECK:
-- Ensures that the values in a column meet a specific condition.
-- Use it to enforce domain integrity by limiting the values that can be stored in a column.

-- UNIQUE:
-- Ensures that all values in a column are different.
-- Use it to enforce the uniqueness of values in a column.

-- DEFAULT:
-- Sets a default value for a column when no value is specified.
-- Use it to ensure a column has a default value when no value is provided.

-- FOREIGN KEY:
-- Ensures that the value in a column or group of columns matches the value in a column of another table.
-- Use it to enforce referential integrity between two tables.

CREATE TABLE employee_info
(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(40) NOT NULL,
employee_age INT CHECK(employee_age BETWEEN 18 AND 70) NOT NULL,
email_id VARCHAR(50) UNIQUE, 
employee_experience INT DEFAULT 0,
employee_role VARCHAR(40) CHECK(employee_role IN('Data Analyst','Big Data','DevOps'))
);

-- Insert a new record into 'employee_info' with specific columns
INSERT INTO employee_info(employee_id, employee_name, employee_age)
VALUES
(2, 'Mohit', 28);

-- Insert a new record into 'employee_info' with all columns
INSERT INTO employee_info VALUES
(2, 'Mohit', 28, 'mohit123@gmail.com');

SELECT * FROM employee_info;

-- Create 'department' table
CREATE TABLE department
(
department_id INT PRIMARY KEY,
department_name VARCHAR(40) NOT NULL,
department_location VARCHAR(40)
);

-- Insert records into 'department' table
INSERT INTO department VALUES
(1, 'HR', 'Maharashtra'),
(2, 'IT', 'Delhi'),
(3, 'Sales', 'Goa');

SELECT * FROM department;

-- Create 'employee_info' table with foreign key constraint
CREATE TABLE employee_info
(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(40) NOT NULL,
employee_age INT CHECK(employee_age BETWEEN 18 AND 70) NOT NULL,
email_id VARCHAR(50) UNIQUE, 
employee_experience INT DEFAULT 0,
employee_role VARCHAR(40) CHECK(employee_role IN('Data Analyst','Big Data','DevOps')),
department_id INT,
FOREIGN KEY(department_id) REFERENCES department(department_id)
);

-- This query shows the structure of the 'department' table.
DESCRIBE department;

-- This query shows the structure of the 'employee_info' table.
DESCRIBE employee_info;

-- Insert a new record into 'employee_info' with some columns
INSERT INTO employee_info VALUES
(1,'Akash',30,'akash123@gmail.com',2,'Data Analyst',1),
(2, 'Rahul', 23, 'rahul123@gmail.com', 4, 'DevOps', NULL);

