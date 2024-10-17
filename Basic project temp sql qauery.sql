create database temp;

use temp;

show tables;

select * from temperature;
select year,max(temp) from temperature group by year;