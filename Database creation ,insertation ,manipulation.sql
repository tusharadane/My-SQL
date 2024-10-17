-- Comprehensive SQL Script for Database Creation, Data Insertion, and Data Manipulation

-- Create a new database named 'new_db'
CREATE DATABASE new_db;

-- Show all databases to confirm the creation of 'new_db'
SHOW DATABASES;

-- Switch to the 'new_db' database
USE new_db;

-- Show all tables in the 'new_db' database (should be empty initially)
SHOW TABLES;

-- Create the 'Customers' table with the following schema:
-- CustomerID: Integer, primary key
-- FirstName: Variable character (max 50 characters)
-- LastName: Variable character (max 50 characters)
-- EmailID: Variable character (max 50 characters)
-- Phone: Variable character (max 50 characters)
-- salary: Variable character (max 4 characters)
CREATE TABLE Customers
(
CustomerID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
EmailID VARCHAR(50),
Phone VARCHAR(50),
salary VARCHAR(4)
);

-- Show all records from the 'Customers' table (should be empty initially)
SELECT * FROM Customers;

-- Insert a record into the 'Customers' table
INSERT INTO Customers VALUES
(2, "Jay", "Shah", "jay123@gmail.com", "435585", "3434");

-- Drop the 'Customers' table
DROP TABLE Customers;

-- Show all tables in the 'new_db' database (should be empty after dropping the 'Customers' table)
SHOW TABLES;

-- Show all records from the 'Customers' table (will produce an error since the table is dropped)
SELECT * FROM Customers;

-- Show the directory path for secure file imports in MySQL
SHOW VARIABLES LIKE 'secure_file_priv';

-- Show the global variable setting for 'local_infile'
SHOW GLOBAL VARIABLES LIKE "local_infile";

-- Set the global variable 'local_infile' to 1 to allow local file imports
SET GLOBAL local_infile = 1;

-- Create the 'Airline_Info' table with the following schema:
-- id: Integer, primary key
-- airline: Variable character (max 50 characters)
-- flight: Variable character (max 50 characters)
-- source_city: Variable character (max 50 characters)
-- departure_time: Variable character (max 50 characters)
-- stops: Variable character (max 50 characters)
-- arrival_time: Variable character (max 50 characters)
-- destination_city: Variable character (max 50 characters)
-- class: Variable character (max 50 characters)
-- duration: Float
-- days_left: Integer
-- price: Integer


CREATE TABLE Airline_Info
(
id INT,
airline VARCHAR(50),
flight VARCHAR(50),
source_city VARCHAR(50),
departure_time VARCHAR(50),
stops VARCHAR(50),
arrival_time VARCHAR(50),
destination_city VARCHAR(50),
class VARCHAR(50),
duration FLOAT,
days_left INT,
price INT
);

-- Describe the 'Airline_Info' table to see its structure
DESCRIBE Airline_Info;

-- Load data from the 'Airline.csv' file into the 'Airline_Info' table
-- FIELDS TERMINATED BY ',' specifies that fields in the CSV file are separated by commas
-- ENCLOSED BY '' specifies that fields are not enclosed by any character
-- LINES TERMINATED BY '\n' specifies that each line ends with a newline character
-- IGNORE 1 ROWS skips the header row in the CSV file


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Airline.csv'
INTO TABLE new_db.Airline_Info
FIELDS TERMINATED BY ','
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Count the number of records in the 'Airline_Info' table
SELECT COUNT(*) FROM Airline_Info;

-- Show all records from the 'Airline_Info' table
SELECT * FROM Airline_Info;

-- Group by 'airline' and calculate the average price of tickets for each airline
SELECT airline, AVG(price) FROM Airline_Info 
GROUP BY airline;

-- Group by 'departure_time', count the number of records, and calculate the average price of tickets for each departure time
-- Order the results by average price in descending order
SELECT departure_time, COUNT(*), AVG(price) FROM Airline_Info
GROUP BY departure_time
ORDER BY AVG(price) DESC;
