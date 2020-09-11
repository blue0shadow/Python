use company;
show tables;

### 부서 이름을 입력 파라메터로 받아서, 그 부서에 근무하는 (소속된) 사원들의 급여의 평균을 
### 전달하는 저장 프로시저를 작성하시오.
select * from employee;
select * from department;

drop procedure if exists getdname;
delimiter $$
create procedure getdname (in dn varchar(15) character set 'utf8' collate 'utf8_bin', out pn int )
begin
	select avg(salary) into pn from employee, department where dno in (select dnumber from department where dname = dn);
end $$
delimiter ;

### 위 프로시저를 호출하는 호출문 및 전달받은 결과 값을 출력하는 문장을 3개 이상 작성하시오.
call getdname("Research", @pp);
select @pp;

call getdname("영업부", @pp);
select @pp;

call getdname("Administration", @pp);
select @pp;

### 위 프로시저를 저장 함수로 바꾸서 작성하시오.

drop function if exists getdnameFunc;
delimiter $$
create function getdnameFunc (dn varchar(15) character set 'utf8' collate 'utf8_bin')
		returns int
begin
	declare sa int;
    select avg(salary) into sa from employee, department where dno in (select dnumber from department where dname = dn);
    return sa;
end $$
delimiter ;

### 위 저장 함수를 호출하는 문장을 3개 이상 작성하시오.
select getdnameFunc('Research');
select getdnameFunc('영업부');
select getdnameFunc('Administration');


### 여기까지 작성하고 실습한 문장을 스크립트 파일에 저장하여 실습 결과 과제로 제출하시오.

