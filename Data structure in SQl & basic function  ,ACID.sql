/*

Data Types in SQL

-- Numeric Data Types

-- TINYINT: 1 byte, range from -128 to 127 or 0 to 255 (unsigned)
-- SMALLINT: 2 bytes, range from -32,768 to 32,767 or 0 to 65,535 (unsigned)
-- MEDIUMINT: 3 bytes, range from -8,388,608 to 8,388,607 or 0 to 16,777,215 (unsigned)
-- INT or INTEGER: 4 bytes, range from -2,147,483,648 to 2,147,483,647 or 0 to 4,294,967,295 (unsigned)
-- BIGINT: 8 bytes, range from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 or 0 to 18,446,744,073,709,551,615 (unsigned)
-- FLOAT: 4 bytes, approximate range from -3.402823466E+38 to 3.402823466E+38
-- DOUBLE: 8 bytes, approximate range from -1.7976931348623157E+308 to 1.7976931348623157E+308
-- DECIMAL: Variable, exact numeric value with a specified precision and scale


-- Date and Time Data Types

-- DATE: 'YYYY-MM-DD', range from '1000-01-01' to '9999-12-31'
-- DATETIME: 'YYYY-MM-DD HH:MM:SS', range from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'
-- TIMESTAMP: 'YYYY-MM-DD HH:MM:SS', range from '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC
-- TIME: 'HH:MM:SS', range from '-838:59:59' to '838:59:59'
-- YEAR: 1 byte, range from 1901 to 2155


-- String Data Types

-- CHAR: Fixed length, range from 0 to 255 characters
-- VARCHAR: Variable length, range from 0 to 65,535 characters
-- TEXT: Variable length, range from 0 to 65,535 characters
-- TINYTEXT: Variable length, range from 0 to 255 characters
-- MEDIUMTEXT: Variable length, range from 0 to 16,777,215 characters
-- LONGTEXT: Variable length, range from 0 to 4,294,967,295 characters

*/


/*
-- Data Definition Language (DDL)
1. Defines and modifies the structure of database objects.
2. Commands are typically used during the initial database setup and schema changes.
3. DDL operations are auto-committed, meaning changes are saved immediately.

-- Commands under DDL:
   -- CREATE: Creates new database objects like tables.
   -- ALTER: Modifies existing database objects.
   -- DROP: Deletes database objects.
*/

-- Create a new database named Student_Records
create database Student_Records;

-- Use the newly created database
use Student_Records;

-- Display all the tables in the current database
show tables;

-- Create a table named employee with various data types
create table employee (
    employee_id int,
    employee_name varchar(100),
    employee_gender char(1),
    employee_salary float,
    employee_summary text,
    employee_height decimal(5,2),
    employee_dob date,
    employee_login_time time,
    employee_doj_with_time datetime
);

-- Display the structure of the employee table
describe employee;

-- Insert records into the employee table
insert into employee values
(1001, "Jack William", "M", 45000.50, "Judging your own performance is always tricky, as you need to be honest, but you might find answering some of the questions too exposing. However, it is still vital to complete self-assessments, as you will be able to reflect on your performance and skills, which will help you improve on its own but will also get you valuable feedback from your supervisors later.", 67.78, "1990-12-03", "10:00:00", "2021-03-12 12:30:00"),
(1002, "Jacob Wilson", "F", 48000.75, "Jacob has shown great potential in her role and has been a valuable asset to the team.", 64.78, "1990-12-25", "23:30:00", "2020-01-01 12:30:00"),
(1003, "Ava Smith", "F", 50000.00, "Ava has consistently exceeded expectations and has demonstrated strong leadership skills.", 65.12, "1988-07-14", "09:00:00", "2019-11-10 08:45:00"),
(1004, "Liam Brown", "M", 52000.25, "Liam has been instrumental in driving the success of our recent projects.", 68.90, "1985-09-30", "14:00:00", "2018-05-22 11:20:00"),
(1005, "Noah Johnson", "M", 47500.60, "Noah's technical expertise and innovative ideas have greatly benefited our company.", 70.10, "1992-11-05", "08:30:00", "2022-08-15 09:00:00");

-- Select all records from the employee table
select * from employee;

-- create a new database named students
create database students;

-- use the newly created database
use students;

-- select all records from the employee table (note: this will fail if the employee table does not exist in this database)
select * from employee;

-- create a table named students with relevant data types
create table students (
    roll_no int,
    student_name varchar(100),
    student_dob date
);

-- insert 5 records into the students table
insert into students values
(1, "alice johnson", "2005-05-15"),
(2, "bob smith", "2006-07-22"),
(3, "catherine lee", "2005-12-01"),
(4, "david brown", "2006-03-10"),
(5, "eva green", "2005-08-30");

-- select all records from the students table
select * from students;

-- syntax for adding a new column to an existing table
-- alter table table_name add column column_name data_type;

-- add a new column named student_division of type char(1) to the students table
alter table students add column student_division char(1);

-- add new columns student_class of type int and student_age of type int to the students table
alter table students
add column student_class int,
add column student_age int;

-- show all tables in the current database
show tables;

-- select all records from the students table to verify the changes
select * from students;

-- syntax for dropping a column from an existing table
-- alter table table_name drop column column_name;

-- drop the student_age column from the students table
alter table students drop column student_age;

-- drop the student_division and student_class columns from the students table
alter table students
drop column student_division,
drop column student_class;

-- syntax for truncating a table (removes all rows)
-- truncate table table_name;

-- truncate the students table (removes all records)
truncate table students;

-- syntax for dropping a table
-- drop table table_name;

-- drop the students table
drop table students;

-- syntax for dropping a database
-- drop database database_name;

-- drop the students database
drop database students;



##    Acid
#EIn SQL, ACID stands for Atomicity, Consistency, Isolation, and Durability. These are the key properties of a transaction in a database system. Here's a quick rundown:

#Atomicity: Ensures that all operations within a transaction are completed successfully. If one part fails, the entire transaction fails, and the database state is left unchanged.

#Consistency: Ensures that a transaction can only bring the database from one valid state to another. It means that data written to the database must be valid according to all defined rules, including constraints, cascades, triggers, etc.

#Isolation: Ensures that transactions are securely and independently processed at the same time without interference. The changes made by a transaction are invisible to other transactions until the transaction is committed.

#Durability: Ensures that once a transaction has been committed, it will remain so, even in the event of a system failure.

