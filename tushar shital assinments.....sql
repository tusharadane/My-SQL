create database shree_enterprises;

use shree_enterprises;
create table worker(
id int,
full_name varchar(50),
bod date,
doj_logintime datetime,
city varchar(50),
salary int,
department text);

select*from worker;
insert into worker value(
101,"tushar_adane","1998-06-12","2010-01-01 12:00:00","pune",10000,"ceo"),(
102,"shital_ghumare","1998-10-07","2011-01-02 01:00:00","patoda",20000,"hr"),(
103,"umesh_ghumare","1999-06-22","2013-01-02 02:10:00","pachangri",30000,"it"),(
104,"tanish_adane","2022-12-10","2014-12-02 03:00:00","pune",50000,"manager"),(
105,"shivaji_adane","1998-06-12","2015-01-11 12:40:00","keshav_nagar",45000,"finance"),(
106,"asha_adane","1999-08-07","2016-01-04 01:10:00","tambarajuri",26000,"employee"),(
107,"tushar_mundhe","2000-06-08","2020-05-03 02:30:00","mumbai",35000,"it"),(
108,"om_mundhe","1999-06-09","2020-09-01 04:30:00","satara",10000,"hr"),(
109,"vaishali_mundhe","1998-12-16","2018-09-04 05:00:00","pimpari",40000,"it"),(
110,"trisha_adane","2001-09-09","2016-09-01 02:20:00","rajuri",40000,"manager"),(
111,"bablu_adane","1997-06-08","2012-03-01 04:30:00","nagar",10000,"it"),(
112,"aditya_kharpade","1996-02-09","2010-09-01 11:30:00","beed",10000,"hr"),(
113,"rupali_kharpade","1997-02-01","2013-01-01 04:30:00","satara",10000,"hr"),(
114,"pratiksha_waghmare","1998-06-09","2021-09-01 04:30:00","pune",70000,"developer"),(
115,"datta_waghmare","1997-06-01","2022-02-01 03:30:00","daskhed",35000,"manager"),(
116,"om_satav","1999-06-09","2020-09-01 04:30:00","satara",10000,"hr"),(
117,"shital_adane","1998-06-09","2020-09-01 04:30:00","satara",20000,"finanace"),(
118,"pratiksha_ghumare","1999-06-09","2021-09-01 04:30:00","patoda",30000,"developer"),(
119,"pari_waghmare","2001-06-25","2021-09-08 04:30:00","pune",40000,"manager"),(
120,"pratiksha_mundhe","2002-08-28","2017-09-01 09:30:00","pachangri",70000,"it");

select*from worker;

use shree_enterprises;

select*from worker where salary>40000;

select*from worker where salary<40000;

select*from worker where salary=40000;

select*from worker where salary>=40000;

select*from worker where salary<=40000;

select*from worker order by salary desc;
select*from worker order by salary asc;

select*from worker where not department="manager" and not department="finance"; 

select*from worker where full_name like'ta%';
select*from worker where full_name like'__sh%';

select*from worker where city in("mumbai","pune","beed","pachangri");

select*from worker where bod="1999-06-22";

select*from worker where id=109;

update worker set department="kamvali_bai" where id=109;

set sql_safe_updates=0;

update worker set city="mumbai" where id=111;
select*from worker where id=111;

select*from worker where full_name="vaishali_mundhe";

insert into worker value(
109,"pooja_bhosale","1998-11-15","2024-07-24 11:12:00","hadapsar",50000,"helper","shivaji");

select*from worker;

alter table worker add column father_name varchar(50);

alter table worker drop column father_name;

select*from worker;
delete from worker where id=109;