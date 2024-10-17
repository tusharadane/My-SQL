USE flipkart;

-- Switch to the 'flipkart' database
SHOW TABLES;

-- Show all tables in the 'flipkart' database
SELECT * FROM book1;

COMMIT;

-- COMMIT:
-- Syntax: COMMIT;
-- Used to save all changes made during the current transaction.
-- Use it to make sure all changes are permanently applied to the database.

-- Update the 'pname' column to "JAVASCRIPT" where 'id' is 54
UPDATE book1 SET pname = "JAVASCRIPT" WHERE id = 54;

COMMIT;

-- Save the changes made by the previous update operation
-- This ensures that the change to 'pname' is permanently saved.

-- Update the 'pname' column to "HTML" where 'id' is 54
UPDATE book1 SET pname = "HTML" WHERE id = 54;

ROLLBACK;

-- ROLLBACK:
-- Syntax: ROLLBACK;
-- Used to undo all changes made during the current transaction.
-- Use it to revert the database to the state it was in before the transaction started.
-- This will undo the last update operation, reverting 'pname' back to "JAVASCRIPT" where 'id' is 54.

USE today;

-- Switch to the 'today' database
SHOW TABLES;

-- Show all tables in the 'today' database
SELECT * FROM info;

-- DISTINCT Clause:
-- Syntax: SELECT DISTINCT column1, column2 FROM table_name;
-- Used to return only distinct (different) values.
-- Use it to remove duplicates from the result set.

-- Select distinct records from the 'info' table
SELECT DISTINCT * FROM info;

-- Select distinct 'department' from the 'info' table
SELECT DISTINCT department FROM info;

-- Select distinct 'department' and 'position' from the 'info' table
SELECT DISTINCT department, position FROM info;

-- Aggregate Functions:
-- Used to perform calculations on a set of values and return a single value.
-- Common aggregate functions include SUM, AVG, MAX, MIN, and COUNT.

-- Calculate the sum of 'salary' from the 'info' table
SELECT SUM(salary) FROM info;

-- Calculate the minimum 'salary' from the 'info' table
SELECT MIN(salary) FROM info;

-- Calculate the maximum 'doj' (date of joining) from the 'info' table
SELECT MAX(doj) FROM info;

-- Calculate the sum of 'first_name' (not meaningful, shown for example)
SELECT SUM(first_name) FROM info;

-- Calculate the maximum 'first_name' (alphabetically) from the 'info' table
SELECT MAX(first_name) FROM info;

-- Calculate the minimum 'first_name' (alphabetically) from the 'info' table
SELECT MIN(first_name) FROM info;

-- Calculate the average 'salary' from the 'info' table
SELECT AVG(salary) FROM info;

-- Calculate the minimum 'salary' from the 'info' table (duplicate, showing correct usage)
SELECT MIN(salary) FROM info;

-- Calculate the total number of records in the 'info' table
SELECT COUNT(*) FROM info;

-- Insert a new record into the 'info' table
INSERT INTO info VALUES
(16, "Mark", "Wilson", 55000, "2021-06-12", NULL, "Manager");

-- Calculate the number of non-null 'department' values in the 'info' table
SELECT COUNT(department) FROM info;

-- Calculate the total number of employees and alias the result as 'total_employees'
SELECT COUNT(*) AS total_employees FROM info;

-- Select distinct 'department' from the 'info' table
SELECT DISTINCT department FROM info;

-- Select distinct 'position' and alias the result as 'Unique_Designation' from the 'info' table
SELECT DISTINCT position AS Unique_Designation FROM info;

-- Create a new table 'person'
CREATE TABLE person (
    pid INT,
    pname VARCHAR(30),
    pcity VARCHAR(30),
    psalary FLOAT
);

-- Insert records into the 'person' table
INSERT INTO person VALUES
-- (1,"Akash","Pune",45000)
-- (2,"","Mumbai",50000);
(3,"Jay",NULL,60000);

-- Select all columns from the 'person' table
SELECT * FROM person;

-- Select all columns from the 'person' table where 'pname' is an empty string
SELECT * FROM person WHERE pname = "";

-- Select all columns from the 'person' table where 'pcity' is NOT NULL
SELECT * FROM person WHERE pcity IS NOT NULL;

-- Insert a record into the 'person' table with only 'pid' and 'pname' specified
INSERT INTO person(pid, pname) VALUES (6, "Rakesh");

-- Insert a record into the 'person' table with only 'pid' and 'pname' specified
INSERT INTO person VALUES (7, "Saurabh");

-- Select records from the 'info' table where 'department' is 'IT' or 'HR' using UNION
SELECT * FROM info WHERE department = "IT"
UNION
SELECT * FROM info WHERE department = "HR";

-- Select 'first_name' and 'last_name' from 'info' where 'department' is 'IT' and all columns where 'department' is 'HR' using UNION
SELECT first_name, last_name FROM info WHERE department = "IT"
UNION
SELECT * FROM info WHERE department = "HR";

-- Select 'first_name' and 'last_name' from 'info' where 'department' is 'IT' and 'doj' and 'department' where 'department' is 'HR' using UNION
SELECT first_name, last_name FROM info WHERE department = "IT"
UNION
SELECT doj, department FROM info WHERE department = "HR";

-- Select records from 'info' where 'salary' is greater than 50000 or 40000 using UNION
SELECT * FROM info WHERE salary > 50000
UNION
SELECT * FROM info WHERE salary > 40000;

-- Select records from 'info' where 'salary' is greater than 50000 or 40000 using UNION ALL
SELECT * FROM info WHERE salary > 50000
UNION ALL
SELECT * FROM info WHERE salary > 40000;

-- NULL: Represents missing or unknown data.
-- NOT NULL: Ensures that a column cannot have a NULL value.
-- UNION: Combines the result sets of two or more SELECT statements.
-- DISTINCT: Removes duplicate records from the result set.

-- Select records from 'employee' where 'first_name' starts with 'M' and 'position' is either 'Analyst' or 'Accountant'
SELECT * FROM employee WHERE first_name LIKE 'M%' AND (position = "Analyst" OR position = "Accountant");

