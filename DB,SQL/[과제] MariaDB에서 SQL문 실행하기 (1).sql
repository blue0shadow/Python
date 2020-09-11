use company;
set sql_safe_updates = 0;
show tables;

### dept_locations 테이블에 애트리뷰트 phone을 추가하기
select * from dept_locations;
alter table dept_locations add column phone char(15);
select * from dept_locations;

### dept_locations 테이블에 있는 5개 튜플의 phone 애트리뷰트 값을 임의의 값으로 수정한 후 결과 확인하기 
UPDATE dept_locations SET phone = "010-1111-1111" WHERE dnumber = 1 and dlocation = "Houston";
UPDATE dept_locations SET phone = "010-2222-2222" WHERE dnumber = 4 and dlocation = "Stafford";
UPDATE dept_locations SET phone = "010-3333-3333" WHERE dnumber = 5 and dlocation = "Bellaire";
UPDATE dept_locations SET phone = "010-4444-4444" WHERE dnumber = 5 and dlocation = "Houston";
UPDATE dept_locations SET phone = "010-5555-5555" WHERE dnumber = 5 and dlocation = "Sugarland";
select * from dept_locations;

### project 테이블에 금액 이라는 이름의 애트리뷰트를 추가하기. 데이터 타입은 int로 할 것.
select * from project;
alter table project add column 금액 int(15);
select * from project;

### project 테이블에 있는 6개 튜플의 금액 애트리뷰트 값을 임의의 값으로 수정하기.
UPDATE project SET 금액 = "10000" WHERE pnumber = 1;
UPDATE project SET 금액 = "20000" WHERE pnumber = 2;
UPDATE project SET 금액 = "30000" WHERE pnumber = 3;
UPDATE project SET 금액 = "40000" WHERE pnumber = 10;
UPDATE project SET 금액 = "50000" WHERE pnumber = 20;
UPDATE project SET 금액 = "60000" WHERE pnumber = 30;
select * from project;

### department 테이블에 아래 2개의 튜플을 추가하기
insert into department values('영업부', 7, '333445555', '1990-01-01');
insert into department values('비서실', 8, '999887777', '2010-01-01');
select * from department;

### dept_locations 테이블에 7번 부서의 위치 3개를 추가하기. 애트리뷰트 값은 임의로 부여함.
insert into dept_locations values(7, "Houston", "010-6666-6666");
insert into dept_locations values(7, "Bellaire", "010-7777-7777");
insert into dept_locations values(7, "Sugarland", "010-8888-8888");
select * from dept_locations;

### employee 테이블에 7번 부서에 근무하는 사원 3명을 추가하기. 애트리뷰트 값은 임의로 부여함.
insert into employee values("Alex", "C", "Kebin" , "987612345" , "2000-01-01", "563 Fire , Houston , TX", "M", 40000 , "987654321", 7);
insert into employee values("Sood", "D", "Mark" , "123434567" , "2010-09-04", "211 Stone , Bellair , TX", "F", 20000 , "333445555", 7);
insert into employee values("Jenir", "F", "Subin" , "987687654" , "2010-11-07", "122 Derry , Humble , TX", "F", 11000 , "888665555", 7);
select * from employee;

### works_on 테이블에 튜플 5개를 추가함. 애트리뷰트 값은 참조 무결성 조건을 만족하는 임의의 값을 부여함.
insert into works_on values('987612345', 2, 20);
insert into works_on values('123434567', 2, 15);
insert into works_on values('987687654', 3, 20);
select * from works_on;

### 30000 이상의 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, fname, bdate from employee where salary >= 30000;

###  5번 부서에 근무하는 사람 중에서 30000 이상 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, fname, bdate from employee where salary >= 30000 and dno = 5;

### 'Research' 부서에 근무하는 사람 중에서 30000 이상 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, lname, bdate from employee where salary >= 30000 and dno = (select dnumber from department where dname = "Research");
select * from department;

### 'Research' 부서에 근무하는 사람들의 ssn과 그 사람이 참여하는 프로젝트 번호를 검색하기.
select ssn from employee where dno = (select dnumber from department where dname = "Research");
select * from project;

### 'Research' 부서에 근무하는 사람들의 이름과 그 사람이 참여하는 프로젝트의 이름을 검색하기.
select * from employee as e 
INNER JOIN department as d on e.dno = d.dnumber
INNER JOIN project as p on d.dnumber = p.dnum
where d.dname = 'Research';

select * from project;
select * from employee;
select * from department;

### department 테이블에서 '영업부'의 부서번호, 관리자 사원번호(mgr_ssn)를 검색하기.
select dnumber, mgr_ssn from department where dname = "영업부";

### '영업부'가 위치한 위치의 위치(dlocation)과 전화번호(phone)을 검색하기.
select * from dept_locations as l where l.dnumber in (select dnumber from department where dname = "영업부");  
select * from department;

### 사원의 이름(fname, lname)과 그 사원의 감독자(멘토)의 이름(fname, lname)을 검색하기.
select e.fname, e.lname, super.fname as "멘토fname",super.lname as "멘토lname"
from employee as e LEFT JOIN employee super on super.ssn = e.super_ssn;

select * from employee;

### 사원의 소속부서와 그 사원의 감독자(멘토)의 소속부서가 서로 다른 사원의 이름과 감독자(멘토)의 이름을 검색하기
 select e.fname, e.lname, super.fname as "멘토fname",super.lname as "멘토lname"
from employee as e LEFT JOIN employee super on super.dno = e.dno;


### 위 질의에 해당하는 select문을 작성하여 실행하여 원하는 결과가 나오는 올바른 질의인지 확인함. 
### 모든 실습을 완료하면, 실습한 질의들을 스크립트 파일에 저장하여 실습 결과 과제로 제출함

### 수고하셨습니다.
