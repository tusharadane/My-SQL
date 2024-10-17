-- Stored Procedure
-- A stored procedure is a collection of sql statements that are stored in the database
-- A stored procedure can contain business logic, which is one of the key aspects that distinguishes stored procedure from views
-- A stored procedure can accept parameter and you can set varaible write IF statement, etc with the Stored Procedure
-- A stored procdure is a prepared SQL code that you can save,so the code can reused over and over again
-- So if you have an SQL query that you write over and over again, ave it as a stored procedure, and then just call it to execute it
-- You can also pass parameter to a stored procedure so that the stored procedure can act based on the paramenter value(s) it is passed

-- Syntax:- 

-- Creates a generic stored procedure template
create procedure sp_name(p_i int)
begin
... code goes here
end;

-- Switches to the 'loadingfile' database
use loadingfile;

-- Displays all tables in the current database
show tables;

-- Creates a stored procedure to show all data from airline_info table
DELIMITER //
-- This procedure selects all records from the airline_info table
create procedure showdata()
BEGIN
	select * from airline_info;
END //
DELIMITER ;

-- Calls the showdata procedure
call showdata();

-- Creates a stored procedure to show specific data based on airline name and number of stops
DELIMITER //
-- This procedure selects records from airline_info table based on airline name and number of stops
create procedure showspecificdata(IN airline_name varchar(50),IN number_of_stops varchar(50))
BEGIN
	select * from airline_info
    where airline = airline_name
    and stops = number_of_stops;     
END //
DELIMITER ;

-- Calls the showspecificdata procedure with specific parameters
call showspecificdata("GO_FIRST","one");

-- Creates a stored procedure to get flights by source and destination cities
DELIMITER $$
-- This procedure selects flight details based on source and destination cities, ordered by price
CREATE PROCEDURE GetFlightsBySourceAndDestination(
    IN SourceCity VARCHAR(50),
    IN DestinationCity VARCHAR(50)
)
BEGIN
SELECT flight, airline, source_city, destination_city, departure_time, arrival_time, price
FROM airline_info_dataset WHERE source_city = SourceCity AND destination_city = DestinationCity ORDER BY price ASC;
END $$
DELIMITER ;

-- Calls a procedure named CalculateAveragePriceByAirline (not defined in the given code)
CALL CalculateAveragePriceByAirline();

-- CTE - COMMON TABLE EXPRESSION 

-- CTE is a temporary named result set that you can reference within a SELECT,INSERT,UPDATE or DELETE statement.
-- Syntax:- 
-- with cte_name as (cte query)
-- The with clause can include one or more CTEs separated by commas
-- Enables user to more easily write and maintain complex queries via increased redability and simplification
-- CTEs can be useful tool when you need to generate temporary result sets than can be accessed in a SELECT,UPDATES,DELETE or merge statement
-- A CTE must be followed by a single SELECT,INSERT,UPDATE or DELETE statement that references some or all the CTE columns

-- Calculates the total price for each airline
select airline, sum(price) as total_price from airline_info group by airline;

-- Creates a CTE with total price by airline and selects airlines ending with 'o'
with airline_data_info as (select airline, sum(price) as total_price from airline_info group by airline)
select * from airline_data_info
where airline like '%o';

-- Attempts to select all data from the previously defined CTE (this will cause an error)
select * from airline_data_info;

-- Creates a CTE that selects all data from airline_info and joins it with itself
with airline_data as (select * from airline_info)
select * from airline_info a
join airline_Data b
ON  a.id = b.id;

-- Finds the cheapest flight for each airline
WITH CheapestFlights AS (SELECT airline, flight, MIN(price) AS MinPrice FROM airline_info GROUP BY airline, flight)
SELECT airline, flight, MinPrice FROM CheapestFlights
ORDER BY MinPrice ASC;

-- Finds flights with prices below the average price
WITH AvgPrice AS (SELECT AVG(price) AS AveragePrice FROM airline_info),
BelowAvgPriceFlights AS (SELECT flight, airline, s_c, d_c, price FROM airline_info, AvgPrice WHERE price < AveragePrice)
SELECT flight, airline, s_c, d_c, price FROM BelowAvgPriceFlights
ORDER BY price ASC;

-- Finds the most expensive flight for each class
WITH MostExpensiveFlight AS (SELECT class, flight, MAX(price) AS MaxPrice FROM airline_info GROUP BY class, flight)
SELECT class, flight, MaxPrice FROM MostExpensiveFlight ORDER BY MaxPrice DESC;

-- scalar function
-- Scalar functions in SQL return a single value from an input.
-- They can be used in SELECT, WHERE, or other clauses.
-- Examples include functions like `LEN()`, `UPPER()`, and `ROUND()`.
-- Unlike aggregate functions that operate on multiple rows and return a single result and
-- window functions that provide results over a set of rows, scalar functions return a single value for each row.

-- aggregate function 
-- Aggregate functions in SQL operate on multiple rows and return a single summarized value.
-- Common aggregate functions include `SUM()`, `AVG()`, `COUNT()`, `MIN()`, and `MAX()`.
-- They are often used with the `GROUP BY` clause to perform calculations on groups of data.
-- Unlike scalar functions, which return a single value for each row, 
-- aggregate functions return one result per group of rows, and differ from window functions as they do not retain row-wise details.

-- window function
-- Window functions in SQL perform calculations across a set of table rows that are related to the current row.
-- They are used to compute values like running totals, rankings, and moving averages without collapsing the result set into a single value per group.
-- Common window functions include `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, and `LAG()`.
-- Unlike aggregate functions, which reduce multiple rows to a single value, 
-- window functions return a value for each row while still considering multiple rows in the computation.

-- Window Function
-- A window function performs a calculation across a set of table rows that are somehow related to the current row.
-- Window functions are used to perform complex calculations that involve multiple rows without having to write subqueries or self-joins.
-- They are essential for advanced data analysis, providing powerful capabilities to compute values that depend on the data context 
-- (like rankings or cumulative sums) efficiently and elegantly.
-- Partitioning: It can partition data into groups and perform calculations within each group.
-- Order: It can order the rows within each partition.
-- Types: Common types include ROW_NUMBER(), RANK(), DENSE_RANK(), and SUM().
-- Syntax: Typically written as function_name() OVER (PARTITION BY column ORDER BY column).
-- Use Cases: Useful for calculating running totals, ranks, moving averages, and more.
-- Non-Aggregating: Unlike GROUP BY, it doesn’t reduce the number of rows returned by the query.
-- Example: Calculating the rank of employees based on their salary within each department.

-- Selects all columns and adds a total sum of price for all rows
select *, sum(price) over()
from airline_info;

-- Switches to the 'window_function' database
use window_function;

-- Displays all data from the employees table
select * from employees;

-- Calculates the sum of salary for each department using a window function
select *, sum(salary) over(partition by department) as ov from employees;

-- Calculates a running sum of salary within each department, ordered by salary descending
select *, sum(salary) over(partition by department order by salary desc) as ov from employees;

-- Calculates a running sum of salary for all employees, ordered by salary descending
select *, sum(salary) over(order by salary desc) as ov from employees;

-- Finds the minimum salary for each department using a window function
select *, min(salary) over(partition by department) as minimun from employees;

-- ROW_NUMBER() Function:
-- Assigns a unique sequential integer to rows within a partition of a result set, starting at 1 for the first row in each partition. Useful for pagination, ranking, or ordering rows within partitions.
-- ROW_NUMBER() OVER (PARTITION BY column ORDER BY column)
-- Numbering employees within each department based on their salary.

-- Assigns a sequential row number to each row in the result set
select *, row_number() over() from employees;

-- Assigns row numbers based on salary in descending order across all employees
select *, row_number() over(order by salary desc) as rn from employees;

-- Assigns row numbers within each department, ordered by salary descending
select *, row_number() over(partition by department order by salary desc) as rn from employees;

-- Assigns row numbers based on performance score in descending order across all employees
select *, row_number() over(order by performanceScore desc) as rn from employees;

-- Assigns hire rank within each department based on hire date (earliest date gets rank 1)
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
ROW_NUMBER() OVER(PARTITION BY Department ORDER BY HireDate ASC) AS HireRank FROM Employees;

-- Assigns performance rank within each department based on performance score (highest score gets rank 1)
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
ROW_NUMBER() OVER(PARTITION BY Department ORDER BY PerformanceScore DESC) AS PerformanceRank FROM Employees;

-- RANK() Function:
-- Assigns a rank to each row within a partition of a result set, with gaps in the ranking where there are ties. Useful for ranking items within a group, like finding the top performers in each department.
-- RANK() OVER (PARTITION BY column ORDER BY column)
-- Ranking employees within each department based on their performance score.

-- Assigns ranks based on performance score in descending order across all employees
select *, rank() over(order by performanceScore desc) as rn from employees;

-- Assigns ranks within each department based on performance score in descending order
select *, rank() over(partition by department order by performanceScore desc) as rn from employees;

-- Assigns salary ranks within each department (highest salary gets rank 1)
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank FROM Employees;

-- Assigns hire date ranks within each department (earliest date gets rank 1)
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
RANK() OVER(PARTITION BY Department ORDER BY HireDate ASC) AS HireDateRank FROM Employees;

-- DENSE_RANK() Function:
-- Assigns a rank to each row within a partition of a result set, without gaps in the ranking where there are ties. Useful for ranking items within a group where consecutive ranks are needed, like determining the rank of sales representatives based on sales figures.
-- DENSE_RANK() OVER (PARTITION BY column ORDER BY column)
-- Ranking employees within each department based on their hire date.

-- Assigns dense ranks based on performance score in descending order across all employees
select *, dense_rank() over(order by performanceScore desc) as rn from employees;

-- Assigns dense ranks within each department based on hire date (earliest date gets rank 1)
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
DENSE_RANK() OVER(PARTITION BY Department ORDER BY HireDate ASC) AS HireDateDenseRank FROM Employees;

-- Assigns dense ranks within each department based on performance score (highest score gets rank 1)
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
DENSE_RANK() OVER(PARTITION BY Department ORDER BY PerformanceScore DESC) AS PerformanceDenseRank FROM Employees;

-- PERCENT_RANK() Function:
-- Calculates the relative rank of a row within a partition as a percentage of the total number of rows in the partition. Useful for determining the relative standing of a value within a group, such as identifying the top 10% of employees based on performance.
-- PERCENT_RANK() OVER (PARTITION BY column ORDER BY column)
-- Calculating the percent rank of employees within each department based on their salary.

-- Calculates percent rank based on performance score in descending order across all employees
select *, percent_rank() over(order by performanceScore desc) as rn from employees;

-- Calculates percent rank of salary within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
PERCENT_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS SalaryPercentRank FROM Employees;

-- Calculates percent rank of performance score within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
PERCENT_RANK() OVER(PARTITION BY Department ORDER BY PerformanceScore DESC) AS PerformancePercentRank FROM Employees;

-- Calculates global percent rank of salary across all employees
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
PERCENT_RANK() OVER(ORDER BY Salary DESC) AS GlobalSalaryPercentRank FROM Employees;

-- NTILE() Function:
-- Divides the result set into a specified number of approximately equal groups, or "tiles". Useful for dividing data into quartiles, deciles, or any other specified number of groups for comparative analysis.
-- NTILE(number_of_tiles) OVER (PARTITION BY column ORDER BY column)
-- Dividing employees within each department into four quartiles based on their salary.

-- Divides employees into 7 groups based on performance score in descending order
select *, ntile(7) over(order by performanceScore desc) as rn from employees;

-- Divides all employees into 4 quartiles based on salary in descending order
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
NTILE(4) OVER(ORDER BY Salary DESC) AS GlobalSalaryQuartile FROM Employees;

-- Divides employees within each department into 3 tiers based on performance score
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
NTILE(3) OVER(PARTITION BY Department ORDER BY PerformanceScore DESC) AS PerformanceTier FROM Employees;

-- Divides employees within each department into 5 groups based on hire date
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
NTILE(5) OVER(PARTITION BY Department ORDER BY HireDate ASC) AS HireDateGroup FROM Employees;

-- Counts the total number of employees in the table
select count(*) from employees;

-- FIRST_VALUE() Function:
-- Returns the first value in an ordered set of values within a partition. Useful for retrieving the earliest or highest value based on specific ordering, such as the highest salary or the earliest hire date within a department.
-- FIRST_VALUE(column) OVER (PARTITION BY column ORDER BY column)
-- Retrieving the highest salary within each department.

-- Selects all columns and adds the first employee name for all rows
select *, first_value(employeename) over() as fv from employees;

-- Selects all columns and adds the highest salary for all rows
select *, first_value(salary) over(order by salary desc) as fv from employees;

-- Selects all columns and adds the highest salary within each department
select *, first_value(salary) over(partition by department order by salary desc) as fv from employees;

-- Selects all columns and adds the lowest ManagerID for all rows
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
FIRST_VALUE(ManagerID) OVER(ORDER BY ManagerID ASC) AS FirstManagerID 
FROM Employees;

-- Selects all columns and adds the highest PerformanceScore within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
FIRST_VALUE(PerformanceScore) OVER(PARTITION BY Department ORDER BY PerformanceScore DESC) AS FirstPerformanceScore FROM Employees;

-- Selects all columns and adds the earliest HireDate within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
FIRST_VALUE(HireDate) OVER(PARTITION BY Department ORDER BY HireDate ASC) AS FirstHireDate FROM Employees;

-- LAST_VALUE() Function:
-- Returns the last value in an ordered set of values within a partition. Useful for retrieving the most recent or lowest value based on specific ordering, such as the most recent hire date or the lowest salary within a department.
-- LAST_VALUE(column) OVER (PARTITION BY column ORDER BY column ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
-- Retrieving the lowest salary within each department.

-- Selects all columns and adds the last employee name in the table for all rows
select *, last_value(employeename) over() as fv from employees;

-- Selects all columns and adds the lowest salary (Note: This may not work as expected without a frame clause)
select *, last_value(salary) over(order by salary desc) as fv from employees;

-- Selects all columns and adds the lowest salary within each department (Note: This may not work as expected without a frame clause)
select *, last_value(salary) over(partition by department order by salary desc) as fv from employees;

-- Selects all columns and adds the lowest PerformanceScore within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
LAST_VALUE(PerformanceScore) OVER(PARTITION BY Department ORDER BY PerformanceScore DESC) AS LastPerformanceScore FROM Employees;

-- Selects all columns and adds the latest HireDate within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
LAST_VALUE(HireDate) OVER(PARTITION BY Department ORDER BY HireDate ASC) AS LastHireDate 
FROM Employees;

-- Selects all columns and adds the lowest Salary within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
LAST_VALUE(Salary) OVER(PARTITION BY Department ORDER BY Salary DESC) AS LastSalary 
FROM Employees;

-- NTH_VALUE() Function:
-- Returns the value of the nth row in an ordered set of values within a partition. Useful for retrieving specific ranks or positions within ordered data, such as the 3rd highest or 2nd lowest value in a dataset.
-- NTH_VALUE(column, n) OVER (PARTITION BY column ORDER BY column ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
-- Retrieving the third highest salary within each department.

-- Selects all columns and adds the 5th employee name in the table for all rows
select *, nth_value(employeename, 5) over() as fv from employees;

-- Selects all columns and adds the 3rd employee name within each department
select *, nth_value(employeename, 3) over(partition by department) as fv from employees;

-- Selects all columns and adds the 4th highest PerformanceScore within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
NTH_VALUE(PerformanceScore, 4) OVER(PARTITION BY Department ORDER BY PerformanceScore DESC) AS FourthHighestPerformanceScore FROM Employees;

-- Selects all columns and adds the 3rd highest Salary within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
NTH_VALUE(Salary, 3) OVER(PARTITION BY Department ORDER BY Salary DESC) AS ThirdHighestSalary FROM Employees;

-- LEAD() Function:
-- Accesses data from the next row in the same result set without using a self-join. Useful for comparing values between consecutive rows, such as comparing a current row's value with the next row's value.
-- LEAD(column, offset, default_value) OVER (PARTITION BY column ORDER BY column)
-- Comparing each employee's salary with the salary of the next employee within the same department.

-- Selects all columns and adds the next row's salary for each row
select *, lead(salary) over() as ld from employees;

-- Selects all columns and adds the next lower performance score within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
LEAD(PerformanceScore, 1) OVER(PARTITION BY Department ORDER BY PerformanceScore DESC) AS FirstLeadPerformanceScore FROM Employees;

-- Selects all columns and adds the salary two positions ahead within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
LEAD(Salary, 2) OVER(PARTITION BY Department ORDER BY Salary DESC) AS SecondLeadSalary FROM Employees;

-- Selects all columns and adds the hire date three positions ahead within each department
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
LEAD(HireDate, 3) OVER(PARTITION BY Department ORDER BY HireDate ASC) AS ThirdLeadHireDate FROM Employees;
       
-- LAG() Function:
-- Accesses data from the previous row in the same result set without using a self-join. Useful for comparing values between consecutive rows, such as comparing a current row's value with the previous row's value.
-- LAG(column, offset, default_value) OVER (PARTITION BY column ORDER BY column)
-- Example use case: Comparing each employee's salary with the salary of the previous employee within the same department.

-- This query selects all columns from the employees table and adds a column `la` that shows the previous row's salary using the LAG() function.
SELECT *, LAG(salary) OVER() AS la FROM employees;

-- This query selects specific columns from the Employees table and calculates the first lead (previous) PerformanceScore within each Department, ordering by PerformanceScore in descending order.
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
LAG(PerformanceScore, 1) OVER(PARTITION BY Department ORDER BY PerformanceScore DESC) AS FirstLeadPerformanceScore 
FROM Employees;

-- This query selects specific columns from the Employees table and calculates the second lead (two rows back) Salary within each Department, ordering by Salary in descending order.
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
LAG(Salary, 2) OVER(PARTITION BY Department ORDER BY Salary DESC) AS SecondLeadSalary 
FROM Employees;

-- This query selects specific columns from the Employees table and calculates the fourth lead (four rows back) ManagerID, ordering the rows by ManagerID in ascending order.
SELECT EmployeeID, EmployeeName, Department, Salary, HireDate, PerformanceScore, ManagerID, 
LAG(ManagerID, 4) OVER(ORDER BY ManagerID ASC) AS FourthLeadManagerID 
FROM Employees;




