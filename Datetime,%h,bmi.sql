-- Get the current date and time
SELECT NOW();

-- Get the current date
SELECT CURDATE();

-- Get the current date (alternative syntax)
SELECT CURRENT_DATE();

-- Get the current date and time with timestamp
SELECT CURRENT_TIMESTAMP();

-- Get the current time
SELECT CURTIME();

-- Get the current date and time with system time
SELECT SYSDATE();

-- Switch to the database 'db'
USE db;

-- Select all columns from the table 'df'
SELECT * FROM df;

-- Extract various date parts from 'tranDate'
SELECT tranDate,
       DATE(tranDate) AS tran_Date,
       DAY(tranDate),
       DAYNAME(tranDate),
       DAYOFMONTH(tranDate),
       DAYOFWEEK(tranDate),
       DAYOFYEAR(tranDate)
FROM df;

-- Extract various week, month, and year parts from 'tranDate'
SELECT tranDate,
       WEEK(tranDate),
       WEEKDAY(tranDate),
       WEEKOFYEAR(tranDate),
       MONTH(tranDate),
       MONTHNAME(tranDate),
       QUARTER(tranDate),
       YEAR(tranDate),
       YEARWEEK(tranDate)
FROM df;

-- Select all columns from the table 'df' again
SELECT * FROM df;

-- Extract various time parts from 'tranDate'
SELECT tranDate,
       TIME(tranDate),
       HOUR(tranDate),
       MINUTE(tranDate),
       SECOND(tranDate),
       MICROSECOND(tranDate)
FROM df;

-- Add various intervals to 'tranDate'
SELECT tranDate,
       DATE_ADD(tranDate, INTERVAL 1 DAY) AS day_added,
       DATE_ADD(tranDate, INTERVAL 1 MONTH) AS month_added,
       DATE_ADD(tranDate, INTERVAL 1 WEEK) AS week_added,
       DATE_ADD(tranDate, INTERVAL 1 QUARTER) AS quarter_added,
       DATE_ADD(tranDate, INTERVAL 1 YEAR) AS year_added
FROM df;

-- Subtract various intervals from 'tranDate'
SELECT tranDate,
       DATE_SUB(tranDate, INTERVAL 1 DAY) AS day_subtracted,
       DATE_SUB(tranDate, INTERVAL 1 MONTH) AS month_subtracted,
       DATE_SUB(tranDate, INTERVAL 1 WEEK) AS week_subtracted,
       DATE_SUB(tranDate, INTERVAL 1 QUARTER) AS quarter_subtracted,
       DATE_SUB(tranDate, INTERVAL 1 YEAR) AS year_subtracted
FROM df;

-- Extract various date and time parts using EXTRACT function
SELECT tranDate,
       EXTRACT(DAY FROM tranDate) AS date,
       EXTRACT(WEEK FROM tranDate) AS week,
       EXTRACT(MONTH FROM tranDate) AS month,
       EXTRACT(QUARTER FROM tranDate) AS quarter,
       EXTRACT(YEAR FROM tranDate) AS year,
       EXTRACT(HOUR FROM tranDate) AS hour,
       EXTRACT(MINUTE FROM tranDate) AS minute,
       EXTRACT(SECOND FROM tranDate) AS second,
       EXTRACT(MICROSECOND FROM tranDate) AS microsecond
FROM df;

-- Select all columns from the table 'df' again
SELECT * FROM df;

-- Calculate the difference in days between 'tranDate' and 'BirthDate'
SELECT tranDate, BirthDate, DATEDIFF(tranDate, BirthDate) AS date_difference
FROM df;

-- Calculate the difference in days between now and 'BirthDate'
SELECT DATEDIFF(NOW(), BirthDate) AS diff
FROM df;

-- Calculate the customer's age based on 'BirthDate'
SELECT BirthDate, (YEAR(NOW()) - YEAR(BirthDate)) AS customer_age
FROM df;

-- Format a specific date using DATE_FORMAT function
SELECT DATE_FORMAT("2023-03-12", "%D/%M/%y") AS date_format;

-- Format 'tranDate' with different date and time parts
SELECT tranDate, DATE_FORMAT(tranDate, "%e/%b/%Y/%W") AS date_format
FROM df;

-- Format 'tranDate' with date, time, and day of week
SELECT tranDate, DATE_FORMAT(tranDate, "%e/%b/%Y,%W,%h:%i:%s") AS date_format
FROM df;

-- Convert a string to date using STR_TO_DATE function
SELECT STR_TO_DATE("July 10 2019", "%M %d %y") AS dt;

-- Convert a different string format to date
SELECT STR_TO_DATE("19 March 2019", "%d %M %Y") AS dt;

-- Convert another string format to date
SELECT STR_TO_DATE("August 10 2017", "%M %d %Y");

-- Explanation of date formatting symbols
-- Date: %d (01 to 31), %e (0 to 31), %D (st, nd, rd or th), %j (001 to 366)
-- Month: %M (full month name), %b (Jan to Dec), %m (00 to 12), %c (0 to 12)
-- Year: %Y (2019), %y (19)
-- Week: %a (Mon), %W (Monday), %w (0 to 6)
-- Hour: %h (01 to 12), %H (00 to 23), %g (1 to 12), %G (0 to 23)
-- Minutes: %i (00 to 59)
-- Seconds: %s (00 to 59)
-- Microseconds: %f (000000 to 999999)

-- Get the current system user
SELECT SYSTEM_USER();

-- Get the current MySQL user
SELECT CURRENT_USER();

-- Switch to the database 'import_data'
USE import_data;

-- Select all columns from the table 'insurance'
SELECT * FROM insurance;

-- Categorize age into 'Adults' and 'Young'
SELECT age, IF(age > 50, "Adults", "Young") AS age_category
FROM insurance;

-- Categorize insurance level based on whether the person is a smoker
SELECT age, IF(smoker = "yes", "High Insurance", "Low Insurance") AS insurance_category
FROM insurance;

-- Categorize BMI into different weight categories
SELECT *,
       CASE
           WHEN bmi < 16.0 THEN "Severely Underweight"
           WHEN bmi BETWEEN 16.0 AND 18.4 THEN "Underweight"
           WHEN bmi BETWEEN 18.5 AND 24.9 THEN "Normal"
           WHEN bmi BETWEEN 25.0 AND 29.9 THEN "Overweight"
           ELSE "Obese"
       END AS BMI_Category
FROM insurance;

-- Add a new column 'BMI_Category' to the 'insurance' table
ALTER TABLE insurance ADD COLUMN BMI_Category VARCHAR(20);

-- Update the 'BMI_Category' column based on BMI values
UPDATE insurance SET BMI_Category =
       CASE
           WHEN bmi < 16.0 THEN "Severely Underweight"
           WHEN bmi BETWEEN 16.0 AND 18.4 THEN "Underweight"
           WHEN bmi BETWEEN 18.5 AND 24.9 THEN "Normal"
           WHEN bmi BETWEEN 25.0 AND 29.9 THEN "Overweight"
           ELSE "Obese"
       END;

-- Disable safe updates for the session
SET SQL_SAFE_UPDATES = 0;

-- Count the number of records for each BMI category
SELECT BMI_Category, COUNT(*) 
FROM insurance
GROUP BY BMI_Category;
