use company;
show tables;
select * from department;
select dname as dept_name , mgr_ssn as manager_ssn from department;
select dname , mgr_ssn from department;
select * from department as d (dn, dnum, m_ssn, m_date) where dn = 5;

select distinct salary from employee;
select all salary from employee;

select salary from employee where dno = 5
union
select salary from employee where dno = 4;

select * from employee where minit is not null
order by lname desc, fname asc;