show databases;

use employee_records;

show tables;
select*from employee;


set sql_safe_updates=0;
set sql_safe_updates=0;

create database employee_records1;
create database employee_records1;

show databases;

use employee_records1;


create table employee1(
employee_id int primary key,
employee_first_name varchar(50)not null,
employee_last_name varchar(50)not null,
employee_salary int,
employee_department varchar(20),
employee_post varchar(25),
employee_doj date ,
employee_email_id varchar(50)unique,
employee_experience int default 0,
employee_age int check(employee_age between 18 and 70)not null
);


select*from employee1;


insert into employee1 value(

"1","john","Doe","50000","HR","Manager","2022-1-15","john@gmail.com",1,23),
("2","jane","smith","42000","IT","developer","2021-09-05","jane@gmail.com",2,24),
("3","mike","johnson","55000","finance","accountant","2023-02-10","mike@gmail.com",3,25),
("4","emily","brown","48000","HR","assitant","2020-06-20","emily@gmail.com",4,26),
("5","robert","williams","60000","IT","Manager","2021-11-30","robert@gmail.com",5,27),
("6","olivia","Davis","49000","finance","Analyst","2022-04-08","olivia@gmail.com",6,28),
("7","michael","miller","53000","IT","developer","2020-12-01","michael@gmail.com",7,29),
("8","sophia","wilson","51000","HR","assistant","2023-03-25","sophia@gmail.com",8,30),
("9","william","Garcia","56000","finance","Manager","2021-06-15","william@gmail.com",9,31),
("10","Emma","rodriguez","47000","IT","developer","2022-09-18","emma@gmail.com",10,32),
("11","Liam","martinez","58000","finance","analyst","2022-10-08","liam@gmail.com",11,33),
("12","ava","hernandez","54000","HR","assistant","2021-02-05","ava@gmail.com",12,34),
("13","noah","lopez","52000","IT","Manager","2023-07-20","noah@gmail.com",13,35),
("14","isabella","gonzales","59000","finance","accountant","2022-05-12","isabella@gmail.com",14,36),
("15","ethan","perez","50000","IT","developer","2021-11-05","ethan@gmail.com",15,37);


select*from employee1;


select employee_department,sum(employee_salary) from employee1 group by
 employee_department,employee_salary;
 

select employee_post,avg(employee_salary) from employee1 group by employee_post;


select employee_department,sum(employee_salary) from employee1 group by
 employee_department,employee_salary>150000;
 
 
select count(employee_department),employee_post from employee1 group by
 employee_department,employee_post;
 
 
select avg(employee_salary),employee_department from employee1 group by
 employee_department limit 3;

select count(employee_doj),employee_department from employee1
 group by employee_department,employee_doj>"2021-01-01";
 
 select avg(employee_salary),employee_department from employee1 group by
 employee_department ,employee_salary>50000 limit 2;
 
 
SELECT employee_department, avg(employee_salary) FROM employee1
GROUP BY employee_department,employee_salary
ORDER BY employee_salary desc
LIMIT 5;

select employee_department,avg(employee_salary) from employee1 group by
 employee_department,employee_salary order by employee_salary desc limit 3;
 
 select employee_department,employee_id,employee_salary from employee1 where employee_salary>50000
 group by employee_id,employee_salary,employee_department order by employee_salary desc limit 3;
 
 
 select avg(employee_salary),employee_department from employee1 where employee_salary>55000
 group by employee_salary,employee_department order by employee_salary desc limit 2;
 
 
 create table student(
 student_id int primary key,
 first_name varchar(50) not null,
 last_name varchar(40) not null,
 email_id varchar(50) unique not null,
 dob date not null,
 grade int(100) check(grade between 0 and 100),
 enorllment_date date not null);
 
 select*from student;
 describe table student;
 
 
 insert into student value(
 1,"tushar","adane","tusharadane719@gmail.com","1998-06-12","12","2024-07-18"),
 (2,"tanish","bhosale","tanish@gmail.com","2002-11-12","11","2023-10-14"),
 (3,"sagar","ghumare","sagar@gmail.com","2001-09-04","13","2022-11-03"),
 (4,"shubham","gaikwad","shubham@gmail.com","1997-09-07","18","2022-09-04"),
 (5,"yogesh","kolhe","yogesh@gmail.com","1998-11-19","15","2020-12-15");
 
 select*from student;