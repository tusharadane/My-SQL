-- Switch to the 'employe' database
USE employe;


-- Show all tables in the 'employe' database
SHOW TABLES;


-- Select all columns from the 'employee2' table
SELECT * FROM employee2;


-- Select the 'empname' column from the 'employee2' table
SELECT empname FROM employee2;


-- Select the 'empname' and 'salary' columns from the 'employee2' table
SELECT empname, salary FROM employee2;

-- WHERE Clause: 
-- Syntax: SELECT * FROM table_name WHERE condition;
-- Used to filter records based on specific conditions.
-- Use it to retrieve only those records that meet the defined criteria.


-- Select all columns from the 'employee2' table where 'empcode' is 103
SELECT * FROM employee2 WHERE empcode = 103;


-- Select all columns from the 'employee2' table where 'empname' is 'Akash'
SELECT * FROM employee2 WHERE empname = "Akash";


-- Switch to the 'today' database
USE today;

-- Relational/Comparison Operators: Used to compare values
-- > : Greater than
-- >= : Greater than or equal to
-- < : Less than
-- <= : Less than or equal to
-- <> or != : Not equal to
-- = : Equal to

-- Select all columns from the 'employee' table
SELECT * FROM employee;


-- Select all columns from the 'employee' table where 'employee_salary' is greater than 60000
SELECT * FROM employee WHERE employee_salary > 60000;


-- Select all columns from the 'employee' table where 'employee_salary' is greater than or equal to 60000
SELECT * FROM employee WHERE employee_salary >= 60000;


-- Select all columns from the 'employee' table where 'employee_salary' is less than 60000
SELECT * FROM employee WHERE employee_salary < 60000;


-- Select all columns from the 'employee' table where 'employee_salary' is less than or equal to 60000
SELECT * FROM employee WHERE employee_salary <= 60000;


-- Select all columns from the 'employee' table where 'employee_salary' is equal to 60000
SELECT * FROM employee WHERE employee_salary = 60000;


-- Select all columns from the 'employee' table where 'employee_salary' is not equal to 60000
SELECT * FROM employee WHERE employee_salary != 60000;


-- Select all columns from the 'employee' table where 'employee_salary' is not equal to 60000 (using <>)
SELECT * FROM employee WHERE employee_salary <> 60000;


-- Select the 'employee_name' column from the 'employee' table where 'employee_city' is 'Pune'
SELECT employee_name FROM employee WHERE employee_city = "Pune";

-- Data Manipulation Language (DML): Used to manage data within tables
-- Data Manipulation Language (DML):
-- Includes commands like SELECT, INSERT, UPDATE, and DELETE.
-- Used to manage and manipulate data within tables.
-- These commands allow querying, inserting, updating, and deleting records.

-- Select all columns from the 'employee' table
SELECT * FROM employee;

-- UPDATE Clause:
-- Syntax: UPDATE table_name SET column_name = value WHERE condition;
-- Used to modify existing records in a table.
-- Use it to update the values of specified columns for records that meet the condition.
-- Syntax: UPDATE table_name SET column_name = value WHERE condition;

-- Update the 'employee_city' to 'Bangalore' for the record where 'employee_id' is 5
UPDATE employee SET employee_city = "Bangalore" WHERE employee_id = 5;


-- Update the 'employee_department' to 'Testing' and 'employee_city' to 'Mumbai' for the record where 'employee_id' is 25
UPDATE employee SET employee_department = "Testing", employee_city = "Mumbai" WHERE employee_id = 25;


-- If you need to disable safe updates mode, use the following command
SET sql_safe_updates = 0;

-- DELETE Clause:
-- Used to remove existing records from a table.
-- Use it when you need to permanently delete records that match the specified condition.
-- Syntax: DELETE FROM table_name WHERE condition;


-- Delete the record from the 'employee' table where 'employee_id' is 30
DELETE FROM employee WHERE employee_id = 30;


-- Delete records from the 'employee' table where 'employee_salary' is greater than 50000
DELETE FROM employee WHERE employee_salary > 50000;
