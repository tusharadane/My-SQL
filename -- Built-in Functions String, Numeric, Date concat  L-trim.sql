-- Built-in Functions: String, Numeric, Date

-- Functions in SQL are reusable blocks of code that perform specific operations on data. 
-- They can be built-in (like COUNT(), AVG(), SUM()) or user-defined to handle custom logic. 
-- Functions take input parameters, process them, and return a single value. 
-- They enhance code modularity and efficiency by encapsulating common tasks.

-- Using database 'db'
USE db;

-- Show tables
SHOW TABLES;

-- Select all records from 'df' table
SELECT * FROM df;

-- String Functions
-- String functions in SQL are used to manipulate and query text data.

-- Concatenate strings
SELECT CONCAT("SQL", "Programming") AS cn;

-- Concatenate 'custName' and 'state' with '###' in between
SELECT CONCAT(custName, "###", state) AS cn FROM df;

-- Concatenate multiple columns with '###' in between
SELECT CONCAT(custName, "###", State, "###", City, "###", BankName) AS info FROM df;

-- Concatenate with separator '---'
SELECT CONCAT_WS("---", custName, State, City) AS info FROM df;

-- Convert to uppercase
SELECT UPPER(custName) AS upper_name FROM df;

-- Convert to uppercase using UCASE
SELECT UCASE(custName) AS upper_name FROM df;

-- Convert to lowercase
SELECT LOWER(custName) AS upper_name FROM df;

-- Convert to lowercase using LCASE
SELECT LCASE(custName) AS upper_name FROM df;

-- Trim functions
SELECT ("        SQL Programming            ") AS tr;
SELECT TRIM("        SQL Programming            ") AS tr;
SELECT LTRIM("        SQL Programming            ") AS tr;
SELECT RTRIM("        SQL Programming            ") AS tr;

-- Right substring
SELECT RIGHT("SQL Programming", 3) AS ri;

-- Left substring
SELECT *, LEFT(State, 3) AS ri FROM df;

-- Right substring of 'cardNum'
SELECT *, RIGHT(cardNum, 4) AS ri FROM df;

-- Substring functions
SELECT SUBSTR("SQL is incase sensitive language", 3, 6) AS lt;
SELECT custName, SUBSTRING(custName, 2, 4) AS su FROM df;
SELECT MID("SQL is incase sensitive language", 4, 5) AS mi;
SELECT SUBSTR("SQL is incase sensitive language", -10, 3) AS sb;

-- Reverse string
SELECT REVERSE(custName) AS re FROM df;

-- Left pad
SELECT LPAD(custName, 20, "*") AS lp FROM df;

-- Right pad
SELECT RPAD(custName, 20, "#") AS lp FROM df;

-- Locate substring
SELECT LOCATE("is", "Sql is a programming language") AS lc;
SELECT LOCATE("iz", "Sql is a programming language") AS lc;

-- Position of substring
SELECT POSITION("g l" IN "SQL is a programming language") AS pos;

-- String comparison
SELECT STRCMP("Sql works with database", "Sql works with databases") AS st;

-- Replace substring
SELECT REPLACE("SQL is case sensitive Language", "case", "In-Case") AS re;

-- Format numbers
SELECT FORMAT(42252.2425, 2) AS fr;
SELECT FORMAT(42252.2425, 3) AS fr;

-- Repeat string
SELECT REPEAT(custName, 3) AS rp FROM df;

-- Space function
SELECT SPACE(10) AS sp;

-- Group by State and sum transaction amount
SELECT State, SUM(tranAmount) AS total_trans_amount FROM df
GROUP BY State;

-- Distinct group_concat and sum transaction amount
SELECT DISTINCT(GROUP_CONCAT(bankName)), SUM(tranAmount) AS total_trans_amount FROM df;

-- Numeric Functions
-- Numeric functions in SQL are used to perform operations on numeric data.

-- Binary representation of 10
SELECT BIN(10) AS bi;
/*
2   10
2    5     0   ^
2    2     1   |
2    1     0   |
	 ^ ->  1   |
          
binary(10) = 10101	
*/

-- Absolute value
SELECT ABS(-35) AS ab;

-- Select even transaction amounts
SELECT tranAmount FROM df
WHERE tranAmount LIKE '%0'
 OR tranAmount LIKE '%2'
 OR tranAmount LIKE '%4'
 OR tranAmount LIKE '%6'
 OR tranAmount LIKE '%8';

-- Select odd transaction amounts
SELECT * FROM df
WHERE tranAmount % 2 != 0;

-- Rounding functions
SELECT ROUND(345.573) AS rn;
SELECT ROUND(345.493) AS rn;
SELECT ROUND(345.57573, 2) AS rn;

-- Ceiling and floor functions
SELECT CEILING(35.00000000000000000000000001) AS ce;
SELECT FLOOR(35.99999999999999999999) AS ce;

-- Random number
SELECT RAND() AS rd;

-- Square root
SELECT SQRT(36) AS sq;

-- Power function
SELECT POW(2, 4) AS pw;

-- Random number with rounding
SELECT ROUND(RAND() * 1000, 2) AS rd;

-- Modulus
SELECT MOD(30, 4) AS md;

-- Pi constant
SELECT PI() AS pi;

-- Truncate function
SELECT TRUNCATE(23.359953, 2) AS tr;

-- Sign function
SELECT SIGN(3) AS si;
SELECT SIGN(-3) AS si;

-- Square root of transaction amounts
SELECT tranAmount, SQRT(tranAmount) AS sq FROM df;

-- Alter table to add column for transaction square root
ALTER TABLE df ADD COLUMN transaction_sqrt FLOAT;

-- Update table with square root of transaction amounts
UPDATE df SET transaction_sqrt = SQRT(tranAmount);

-- Disable SQL safe updates
SET sql_safe_updates = 0;

-- Alter table to add column with default value
ALTER TABLE df ADD COLUMN data_info INT DEFAULT 1000;
