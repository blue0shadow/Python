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

select fname, lname from employee, department
where dname = "Research" and dnumber = dno;

select fname, lname from employee
where dno in (select dnumber from department where dname = "Research");

select fname, lname from employee as e
where exists (select * from department as d where d.dname = "Research" and
d.dnumber = e.dno);

select * from works_on;

select essn from works_on  where pno =2;
select ssn from employee
where ssn not in (select essn from works_on where pno = 2);

select ssn from employee e
where not exists ( select * from works_on w where w.pno = 2 and w.essn = e.ssn);

select * from dependent;
select fname, lname, department_name from employee, dependent
where ssn = essn;

select fname, lname from employee where ssn not in
(select essn from dependent);

select fname, lname from employee where not exists
(select * from dependent where essn = ssn);

select * from works_on;