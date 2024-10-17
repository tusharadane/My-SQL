show databases;
use employee_records;

select*from employee;


select*from employee order by max( salary) limit 5;

select high_priority salary from employee order by salary desc; 

select distinct salary from employee order by salary desc limit 5;

select distinct salary from employee order by salary asc limit 3;

select*from employee where salary limit 5 offset 5;

select*from employee where salary limit 1 offset 9;

select*from employee where Eid between 3 and 10 and department="finance";

select*from employee where Eid between 1 and 6 and department="IT";

select*from employee where salary between 45000 and 55000 and post="assistant";

select*from employee where Eid between 7 and 15 and department="HR";
select*from employee;
select*from employee where department in ("it","finance") and salary>50000; 

select*from employee where department in ("hr","manager") and Eid between 5 and 15;

select*from employee where first_name like ("M%") and post in ("analyst","accountant");

select*from employee where post !="manager" and salary between 45000 and 60000;

select*from employee where first_name like ("li%") and post="analyst";
