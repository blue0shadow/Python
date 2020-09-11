use company;
show tables;
select bdate, address from employee
where fname = "John" and minit = "B" and lname = "Smith";

select fname, lname, dno from employee, department
where dname = "Research" and dnumber  = dno;
select pname, dnum, lname, address, bdate from project as p, department as d, employee e
where p.plocation = "Stafford" and p.dnum = d.dnumber
and d.mgr_ssn = e.ssn;

select e.fname, e.lname, s.fname, s.lname
from employee e , employee s
where e.super_ssn = s.ssn;

select * from employee, department;