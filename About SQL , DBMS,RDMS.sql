/*
Data
Data is information that can be stored and processed by computers. 
It can be numbers, text, images, or any other type of information. 
Data is often collected, analyzed, and used to make decisions. 
In computing, data is organized in structures like databases to be easily accessed and managed.

Database
A database is a structured collection of data stored on a computer. 
It helps organize and manage information so it can be easily accessed, updated, and analyzed. 
Databases can store various types of data, like customer information or product inventories. 
They are used in many applications, from websites to business systems, to keep track of important information.

RDBMS
An RDBMS stores data in structured tables with rows and columns, similar to a spreadsheet. 
It uses SQL to manage and manipulate this data, allowing you to create, read, update, and delete records. 
Tables can be linked together using relationships, ensuring organized and efficient data handling. 
Additionally, an RDBMS maintains data integrity and security through various constraints and access controls.

SQL
SQL (Structured Query Language) is a programming language used to manage and interact with databases. 
It allows you to create, read, update, and delete data in a database. 
With SQL, you can write queries to retrieve specific information and perform tasks like sorting and filtering data. 
It's widely used in applications that require database management.

MYSQL
MySQL is a popular open-source database management system. 
It helps store and manage data in a structured way using SQL (Structured Query Language). 
MySQL is widely used for web applications and can handle large amounts of data efficiently. 
It's known for its reliability, ease of use, and strong community support.
*/


-- Show all databases
SHOW DATABASES;

-- Create a new database named Tata
CREATE DATABASE Tata;

-- Use the Tata database
USE Tata;

-- Show all tables in the Tata database (should be empty initially)
SHOW TABLES;

-- Create an employee table with appropriate columns
CREATE TABLE employee (
    employeeid INT,
    employeename TEXT,
    employeesalary FLOAT,
    employeeage INT
);

-- Insert sample data into the employee table
insert into employee values
(1001,"Akash",45000,25),
(1002,"Jayesh",30000,35);

-- Select all data from the employee table
SELECT * FROM employee;



