drop database if exists mydb;
create database mydb;
use mydb;


create table score (
st_id int primary key,
st_name text,
kor int,
eng int,
math int,
total int,
average int
) engine = InnoDB, charset = utf8;

select * from score ;

insert into score values (201820304, '이홍홍', 80, 100, 100, null, null);
insert into score values (202011111, '박범준', 100,90,80,null, null);
insert into score values (201165486, '홀리', 65, 70, 100,null, null);
insert into score values (201879462, '남궁하은', 50,100,70,null, null);
insert into score values (201922222, '박준범', 80, 90, 50,null, null);
insert into score values (201111326, '이준', 80, 40, 60, null, null);

select * from score ;