use company;
show tables;

select * from employee;
select fname, lname, bdate from employee where address like '%Houston%';

### employee 테이블에 생일이 1900년~1999년 사이에 1월에 출생한 사원의 fname, lname, bdate 검색하기
select fname, lname, bdate from employee where year(bdate) between "1900" and "1999" and month(bdate) = 1;

### employee 테이블에서 사원들의 급여를 중복없이 검색하기
select distinct salary from employee;

### 일반 중첩 질의를 사용하여, 'Research' 부서에 근무하는 사원들의 fname, lname, bdate 검색하기
select fname, lname, bdate from employee where dno in (select dnumber from department where dname = "Research");

### exists 연산자를 사용하는 상관 중첩 질의를 사용하여, 'Research' 부서에 근무하는 사원들의 fname, lname, bdate 검색하기
select fname, lname, bdate from employee as e where exists (select * from department as d where dname = "Research" and e.dno = d.dnumber);

### 일반 중첩 질의를 사용하여, 부양 가족이 없는 사원들의 fname, lname, bdate 검색하기
select fname, lname, bdate from employee where ssn not in (select essn from dependent);
select * from dependent;
select * from employee;

### 상관 중첩 질의를 사용하여, 부양 가족이 없는 사원들의 fname, lname, bdate 검색하기
select fname, lname, bdate from employee as e where not exists (select * from dependent as d where e.ssn = d.essn);

### 내부 조인을 사용하여, 사원들의 이름과 부양가족의 이름을 검색하기
select fname as "사원이름", department_name as "부양가족 이름" from employee join dependent where ssn=essn;

### 왼쪽 outer join을 사용하여, 사원들의 이름과 부양가족의 이름을 검색하기
select fname "사원 이름", department_name "부양가족 이름" from employee left outer join dependent on ssn=essn;

### 사원들이 근무하는 (소속된) 부서 번호별로 사원들의 숫자와 평균 급여를 검색하기
 select dno as "부서번호", count(ssn) as "사원수", avg(salary) as "평균급여" from employee group by dno;

### 2명 이상의 사원이 근무하는 부서에 대해, 부서 이름별로 사원들의 숫자와 평균 급여를 검색하기
 select dno as "부서번호", count(ssn) as "사원수", avg(salary) as "평균급여" from employee group by dno having count(ssn) >= 2;

### 아래와 같은 뷰를 생성하기
create view works_info as (select fname, lname, pname, dname, hours 
from employee, department, project, works_on where ssn=essn and dnumber=dnum
and pnumber=pno);

select * from works_info;

### works_info 뷰에서, 각 사원의 이름과 사원이 참여하는 프로젝트 이름 및 참여 시간(hours)를 검색하기
select fname, pname, hours from works_info;

### 프로젝트 이름별로, 참여하는 사원들의 인원수와 참여 시간의 합계를 검색하기
select pname as "프로젝트 이름" , count(fname) as "인원수", sum(hours) as "참여시간의 합계" from works_info group by pname;

### 위 질의에 해당하는 select문을 작성하여 실행하여 원하는 결과가 나오는 올바른 질의인지 확인함. 
### 모든 실습을 완료하면, 실습한 질의들을 스크립트 파일에 저장하여 실습 결과 과제로 제출함

### 수고하셨습니다.
