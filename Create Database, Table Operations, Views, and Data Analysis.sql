-- Comprehensive SQL Script for Database Creation, Table Operations, Views, and Data Analysis

-- Create a new database named 'employee_info'
CREATE DATABASE employee_info;

-- Use the 'employee_info' database
USE employee_info;

-- Show all tables in the 'employee_info' database (should be empty initially)
SHOW TABLES;

-- Select all records from the 'customers info' table (assuming the table exists)
SELECT * FROM `customers info`;

-- Rename the 'customers info' table to 'customer_info'
ALTER TABLE `customers info`
RENAME TO customer_info;

-- Select all records from the 'customer_info' table
SELECT * FROM customer_info;

-- Use the 'today' database
USE today;

-- Show all tables in the 'today' database
SHOW TABLES;

-- Select all records from the 'info' table
SELECT * FROM info;

-- A view in MySQL is a virtual table created from an SQL query result. 
-- It contains rows and columns like a real table, derived from one or more base tables.

-- Purpose of a View:
-- Simplify Complex Queries: Makes complex queries easier to use.
-- Security: Restricts access to specific data.
-- Data Abstraction: Presents data in a specific format.
-- Consistency: Ensures consistent data representation.

-- Advantages of Views:
-- Simplicity: Encapsulates complex SQL logic for easier use.
-- Security: Limits data access to authorized users.
-- Reusable SQL: Reduces redundancy and improves maintainability.
-- Consistency: Provides a consistent view of the data.

-- Disadvantages of Views:
-- Performance: Can be slower than querying base tables.
-- Update Limitations: Not all views are updatable.
-- Dependency Management: Schema changes in base tables can break views.
-- Complexity: Overuse can complicate database management.
-- Storage: Complex views require temporary storage and memory during execution.


-- Create a view 'It_Emp_Info' that contains all records from 'info' where the department is 'IT'
CREATE VIEW It_Emp_Info AS
SELECT * FROM info
WHERE department = "IT";

-- Select all records from the 'It_Emp_Info' view
SELECT * FROM it_emp_info;

-- Update the salary by adding 5000 for employees in the 'IT' department
UPDATE info SET salary = salary + 5000 
WHERE department = "IT";

-- Disable SQL safe updates
SET sql_safe_updates = 0;

-- Update the salary by subtracting 2000 for the 'It_Emp_Info' view (affects the base table 'info')
UPDATE it_emp_info SET salary = salary - 2000;

-- Insert a new record into the 'It_Emp_Info' view (affects the base table 'info')
INSERT INTO it_emp_info (first_name, last_name, salary)
VALUES ("Rakesh", "Sharma", 65000);

-- Use the 'comp_emp' database
USE comp_emp;

-- Select all records from the 'students' table
SELECT * FROM students;

-- Select all records from the 'courses' table
SELECT * FROM courses;

-- Join 'students' and 'courses' tables on 'course_id' and select specific columns
SELECT student_id, student_name, age, s.course_id, course_name, instructor 
FROM students s
JOIN courses c
ON s.course_id = c.course_id;

-- Create a view 'student_course' with records from 'students' where age is greater than 23
CREATE VIEW student_course AS
SELECT * FROM students
WHERE age > 23;

-- Drop the 'student_course' view (if created previously)
DROP VIEW student_course;

-- Create a view 'student_course' that joins 'students' and 'courses' tables and selects specific columns
CREATE VIEW student_course AS
SELECT student_id, student_name, age, s.course_id, course_name, instructor 
FROM students s
JOIN courses c
ON s.course_id = c.course_id;

-- Select all records from the 'student_course' view
SELECT * FROM student_course;

-- Group by 'course_name' and count the number of students in each course
SELECT course_name, COUNT(*) 
FROM student_course
GROUP BY course_name;

-- Group by 'course_name' and calculate the average age of students in each course
SELECT course_name, AVG(age) 
FROM courses
JOIN students
ON courses.course_id = students.course_id
GROUP BY course_name;

-- Drop the 'student_course' view
DROP VIEW student_course;

-- Select all records from the 'info' table
SELECT * FROM info;

-- Use the 'import_data_from_file' database
USE import_data_from_file;

-- Show all tables in the 'import_data_from_file' database
SHOW TABLES;

-- Count the total number of records in the 'ipl_dataset' table
SELECT COUNT(*) FROM ipl_dataset;

-- Select all records from the 'ipl_dataset' table
SELECT * FROM ipl_dataset;

-- Select distinct values of 'dismissal_kind' from the 'ipl_dataset' table
SELECT DISTINCT dismissal_kind FROM ipl_dataset;

-- Group by 'bowler' and count the number of wickets, order by total wickets in descending order, limit to top 5
SELECT bowler, COUNT(is_wicket) AS total_wickets 
FROM ipl_dataset
GROUP BY bowler
ORDER BY total_wickets DESC
LIMIT 5;

-- Group by 'batsman' and sum the total runs, having 'batsman' like 's%', order by total runs in descending order, limit 5 offset 5
SELECT batsman, SUM(total_runs) AS total_runs 
FROM ipl_dataset
GROUP BY batsman
HAVING batsman LIKE 's%'
ORDER BY total_runs DESC
LIMIT 5 OFFSET 5;

-- Group by 'batsman' and 'non_striker' for a specific match (id = 335982), order by partnership for each ball in descending order
SELECT batsman, non_striker, COUNT(*) AS partnership_for_each_balls
FROM ipl_dataset
WHERE id = 335982
GROUP BY batsman, non_striker
ORDER BY partnership_for_each_balls DESC;

-- Group by 'batsman' and 'dismissal_kind', count the number of times a player is dismissed, order by player dismissed in descending order
SELECT batsman, dismissal_kind, COUNT(*) AS player_dismissed
FROM ipl_dataset
WHERE dismissal_kind != "NA"
GROUP BY batsman, dismissal_kind
ORDER BY player_dismissed DESC;

-- Group by 'dismissal_kind' and count the number of each kind of dismissal, excluding 'NA'
SELECT dismissal_kind, COUNT(dismissal_kind) 
FROM ipl_dataset
WHERE dismissal_kind != "NA"
GROUP BY dismissal_kind;


-- In MySQL, the IF() function is used to perform conditional logic within queries. It returns one value if a condition is true and another value if the condition is false.
-- IF(condition, value_if_true, value_if_false)
-- condition: The condition to evaluate.
-- value_if_true: The value returned if the condition is true.
-- value_if_false: The value returned if the condition is false.

-- Conditional select to check if 50 > 2, returns 'High' if true, 'Low' otherwise
SELECT if(50 > 2, "High", "Low") AS dt;

-- Conditional select using 'IF' statement to check if 2 > 5, returns 'High' if true, 'Low' otherwise
SELECT IF(2 > 5, "High", "Low") AS if_code;

-- Group by 'runs_category' and count the number of occurrences, where 'total_runs' > 6 categorized as 'Maximum Runs', otherwise 'Normal Runs'
SELECT IF(total_runs > 6, "Maximum Runs", "Normal Runs") AS runs_category, COUNT(*)
FROM ipl_dataset
GROUP BY runs_category;
