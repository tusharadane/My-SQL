create database employee_records;
use employee_records;
create table employee(
Eid int,
first_name varchar(50),
last_name varchar(50),
salary int,
department varchar(20),
post varchar(25)
);

insert into employee value
(
"1","john","Doe","50000","HR","Manager"),
("2","jane","smith","42000","IT","developer"),
("3","mike","johnson","55000","finance","accountant"),
("4","emily","brown","48000","HR","assitant"),
("5","robert","williams","60000","IT","Manager"),
("6","olivia","Davis","49000","finance","Analyst"),
("7","michael","miller","53000","IT","developer"),
("8","sophia","wilson","51000","HR","assistant"),
("9","william","Garcia","56000","finance","Manager"),
("10","Emma","rodriguez","47000","IT","developer"),
("11","Liam","martinez","58000","finance","analyst"),
("12","ava","hernandez","54000","HR","assistant"),
("13","noah","lopez","52000","IT","Manager"),
("14","isabella","gonzales","59000","finance","accountant"),
("15","ethan","perez","50000","IT","developer");

show table employee;

select*from employee;


-- --Query

select*from employee where department="IT";
select*from employee where salary>"55000";

select*from employee where department!="IT";
select*from employee where post="manager";
select*from employee where doj<"2022-01-01";
update employee set salary=55000 where department="IT";

update employee set deparment
set sql_safe_updates = 0;

select "emily_brown"from employee where department="finance";
select*from employee;

delete from employee where post="assistant";

delete from employee where first_name="robert";

delete from employee where salary<45000;

delete from employee where post="assitant";

delete from employee where post="assistants";
update employee set department="finance" where Eid="1";

update employee set last_name="Adane" where Eid="1";

select*from employee;
update employee set department="finance" where Eid="4";