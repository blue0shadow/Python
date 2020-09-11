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

select fname, lname, address from employee, department
where dname = "Research" and dno = dnumber;

select fname, lname, address
from (employee join department on dno = dnumber)
where dname = "Research";

select fname, lname from employee, works_on, project
where pname = "ProductX" and pnumber=pno and essn=ssn;

select fname, lname from (employee join works_on on ssn = essn)
join project on pnumber=pno where pname = "ProductX";

select dname, dlocation from department as d, dept_locations as l
where d.dnumber = l.dnumber;

select dname, dlocation from department as d join dept_loacations as l
on d.dumber = l.dnumber;

select * from department as d join dept_loacations as l
on d.dumber = l.dnumber;

select * from department natural join dept_locations;

select fname, lname, department_name , relationship
from employee, dependent where ssn = essn;

select fname, lname, department_name , relationship
from employee left outer join dependent on ssn = essn;

select fname, lname, department_name , relationship
from employee full join dependent on ssn = essn;

select * from employee;
select dno, sum(salary), max(salary), min(salary), avg(salary)
from employee group by dno;
select dname, count(*), sum(salary), avg(salary)
from employee, department where dno = dnumber
group by dname;

select * from works_on;
select essn, count(*), sum(hours) from works_on group by essn;

select essn, count(*), sum(hours) from works_on
group by essn having count(*)>=3;

select pno, count(*), sum(hours) from works_on
group by pno having count(*)>=3;

create view works_on1
as select fname,lname, pname, hours from employee, project, works_on
where ssn=essn and pnumber= pno;

select * from works_on1;
select * from works_on1 where pname = "ProductX";
select pname, count(*), sum(hours) from works_on1
group by pname;

