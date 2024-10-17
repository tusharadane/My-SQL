---select
--from
--join
--on
--where
--group by
--having
--order by
--limit
--offset;

sELECT employee_department, avg(employee_salary) FROM employee1
GROUP BY employee_department,employee_salary
ORDER BY employee_salary desc
LIMIT 5;





use employee_records1;

use shree_enterprises;

show tables;

select*from customers;


drop tables customers;
select*from orders;
drop tables orders;



create database Airline_info;

use Airline_info;


show variables like 'secure_file_priv';

show global variables like "local_infile";

set global local_infile=1;

create table Airline(
id int,
airline varchar(50),
flight varchar(50),
source_city varchar(50),
departure_time varchar(50),
stops varchar(50),
arrival_time varchar(50),
destination_city varchar(50),
class varchar(50),
duration float,
days_left int,
price int);

select*from Airline;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\uploads\\Airline.csv'
into table airline_info.airline
fields terminated by','
enclosed by ""
lines terminated by '\n'
ignore 1 rows;


select count(id) from airline;

select airline,avg(price) from airline
group by airline ,price;

select airline,avg(price) from airline
group by airline ,price order by price desc;


select source_city, departure_time from airline
group by source_city,departure_time;

select source_city, departure_time from airline
group by source_city,departure_time
having source_city in ("delhi","mumbai");

select source_city, departure_time from airline
group by source_city,departure_time
having source_city in ("delhi","mumbai") order by departure_time desc;

select*from airline;

select source_city,departure_time,destination_city,count(airline) from airline
group by departure_time,destination_city,source_city
having source_city="mumbai" and destination_city="delhi" and departure_time="evening";

select source_city,departure_time,destination_city,airline from airline
group by departure_time,destination_city,source_city,airline
having source_city="mumbai" and destination_city="delhi" and departure_time="evening";

select source_city,departure_time,destination_city,airline, count(id) from airline
group by departure_time,destination_city,source_city,airline
having source_city="mumbai" and destination_city="delhi" and departure_time="evening";

select source_city,departure_time,destination_city,airline, count(id) from airline
group by departure_time,destination_city,source_city,airline
having source_city="mumbai" and destination_city="delhi" and departure_time="morning";


select*from airline;

select*from airline where airline="indigo" and id="10";

select*from airline where airline="indigo" order by airline limit 10;


select source_city,price,departure_time from airline group by source_city,price,departure_time
having departure_time="morning"  order by price asc;

select source_city,price,departure_time from airline group by source_city,price,departure_time
having departure_time="morning" and source_city="hyderabad" order by price asc;

select source_city,price,departure_time from airline group by source_city,price,departure_time
having departure_time="morning" and source_city="hyderabad" order by price asc;


select source_city,price,departure_time,airline from airline group by source_city,price,departure_time,airline
having departure_time="morning" and source_city="hyderabad" and airline="air_india" order by price asc;

select source_city,destination_city,min(price) from airline group by
source_city,destination_city having source_city="mumbai" and destination_city="delhi";




use airline_info;
select count(id) ,source_city from airline where source_city="mumbai" group by source_city;
select*from airline;

select class,source_city,departure_time from airline where class="business" and source_city="mumbai" and departure_time="night";


select*from airline where stops="zero";





select source_city,destination_city,min(price) from airline group by
source_city,destination_city having source_city="mumbai" and destination_city="delhi";

select source_city,destination_city,price from airline group by
source_city,destination_city,price having source_city="mumbai" and destination_city="delhi" and price<2500;

use airline_info;

show databases;

use employee_records1;
select*from orders;
select*from customers;

create view orders_customers as
select c.customerid,o.orderid,c.firstname,c.lastname,o.amount,o.orderdate from orders o
join customers c ;

drop view orders_customers;
select*from orders_customers;

select c.customerid, o.customerid,o.orderid ,c.firstname,c.lastname from orders o 
 join customers c where firstname="john" and lastname="doe";

select o.orderid,count(c.customerid),c.firstname,sum(o.amount) from orders o 
join customers c group by o.orderid,c.firstname;


select count(o.orderid) ,sum(amount) , c.firstname from orders o join customers c 
group by c.firstname ;

select avg(o.amount), o.orderid ,c.firstname,c.customerid from orders o 
join customers c group by o.orderid,c.firstname,c.customerid; 

select c.customerid ,o.orderid ,sum(amount) from orders o 
join customers c group by c.customerid,o.orderid,o.amount having o.amount>500 order by o. amount desc;


select o.amount, c.customerid, o.orderid from orders o 
join customers c group by c.customerid,o.orderid,o.amount having o.amount>300 order by amount desc;

select sum(amount),o.amount,o.orderdate,c.customerid,c.firstname from orders o
join customers c group by o.orderdate,c.customerid,c.firstname ,o.amount order by o.amount>600 , o.orderdate>2024-07-01
, o.orderdate desc;

select sum(amount),orderdate,customerid,amount from orders_customers group by 
orderdate,customerid ,amount having amount>600 and orderdate>"2024-07-01"
order by orderdate desc;

select*from orders_customers;

select*from orders_customers order by orderdate desc;

select*from customers;

select sum(amount),orderid from orders_customers group by orderid having orderid>1;

select*from orders_customers where orderdate between "2024-07-01" and "2024-07-31" order by amount asc;

select sum(amount),customerid,firstname,lastname,orderid from orders_customers group by orderid,
customerid,firstname,lastname;


create view zero_stops_flight as
select*from airline where stops="zero";

select*from airline;

create view 5hr_duration as
select*from airline where duration>"5";
select*from airline where duration>"5";
create view cheapest_flight as
select airline,price from airline ;
select airline,min(price) from airline group by airline ;

select duration as short  from airline where duration<"5" or  duration>"5";

select duration ,if(duration>"5", "long","short") from airline;

select stops, if(stops="zero", "direct","indirect") from airline;

select duration, price, if(duration>"10" and price>8000,"eligible","Not_eligible") from airline;

select price, if(price>10000, "expensive", "affordable") from airline;

