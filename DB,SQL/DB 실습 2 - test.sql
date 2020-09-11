show databases;
create database company;
use company;
show tables;
create table department
( dname varchar(15) not null,
dnumber int not null,
mgr_ssn char(9) not null,
mgr_start_date date,
primary key(dnumber),
unique(dname)) engine=InnoDB default charset = utf8;

show indexes from department;

create table employee
( fname varchar(15) not null,
minit char,
lname varchar(15) not null,
ssn char(9) not null,
bdate date,
address varchar(30),
sex char,
salary decimal(10,2),
dno int not null,
primary key (ssn),
foreign key(dno) references department(dnumber))
engine=InnoDB default charset = utf8;

show tables;
show indexes from employee;

create table dept_locations
( dnumber int not null,
dlocation varchar(15) not null,
primary key(dnumber , dlocation),
foreign key (dnumber) references department(dnumber))
engine=InnoDB default charset = utf8;

create table project
(pname varchar(15) not null,
pnumber int not null,
plocation varchar(30) not null,
dnum int not null,
primary key(pnumber),
unique(pname),
foreign key(dnum) references department(dnumber))
engine=InnoDB default charset = utf8;

create table works_on
(essn char(9) not null,
pno int not null,
hours decimal(3,1) not null,
primary key(essn, pno),
foreign key(essn) references employee(ssn),
foreign key(pno) references project(pnumber))
engine=InnoDB default charset = utf8;

create table dependent
(essn char(9) not null,
department_name varchar(15) not null,
sex char,
bdate date,
relationship varchar(8),
primary key(essn, department_name),
foreign key(essn) references employee(ssn))
engine=InnoDB default charset = utf8;

show tables;

show indexes from works_on;

select * from employee;