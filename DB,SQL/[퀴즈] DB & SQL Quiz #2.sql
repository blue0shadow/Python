use company;
show tables;
#과제2 부분
#문제1
select dname from department as d, dept_locations as l
where d.dnumber=l.dnumber and dlocation='Houston';

#정답1
select dname from department as d
where d.dnumber in(select dnumber from dept_locations where dlocation='Houston');

#정답2
select dname from department as d where exists
(select dnumber from dept_locations as l where dlocation='Houston' and d.dnumber=l.dnumber);

#정답3
select dname from department as d join dept_locations as l
on d.dnumber=l.dnumber where dlocation='Houston';

#문제2
 select fname, lname from employee
 except
 select fname, lname from employee, works_on where ssn=essn and pno=2;
 
#정답2-1
select fname, lname from employee where ssn
not in (select essn from works_on where pno = 2);

#정답 2-2
select fname, lname from employee where not exists (select essn from works_on where ssn=essn and pno = 2);