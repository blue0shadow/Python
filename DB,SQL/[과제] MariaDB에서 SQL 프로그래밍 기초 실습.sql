use university;
show tables;

### 16일(목)에 제시된 퀴즈 문제 (즉, DB & SQL Quiz #2)를 아직 완성하지 못한 사람들은
### 오늘 오프라인 실습시간에 계속 풀어 보시고 도움이 필요하시면 채팅 창에 질문을 올려 주세요.
### 필요하시면 퀴즈에 대해 보충 설명을 해 드리겠습니다.

### 16일(목)에 제시된 실습 과제 (즉, MariaDB에서 SQL문 실행하기(2))를 아직 완성하지 못한
### 사람들은 오늘 오프라인 실습시간에 계속 풀어 보시고 도움이 필요하시면 채팅 창에 질문을 올려
### 주세요. 도움이 필요하시면 실습 과제의 답을 찾을 수 있도록 보충 설명을 드리겠습니다.

####
#### 위 퀴즈와 실습을 모두 마친 사람들은 아래에 있는 SQL 프로그래밍 기초와 관련된 실습을 진행해
#### 주시고, 그 결과를 스크립트 파일에 저장하여 실습 결과 과제로 제출해 주세요.
####

#### 아래 예제 프로그램을 작성하고 실행하기
set @a = 500; 
set @b =300; 
set @c = @a - @b;
select @a, @b, @c;

drop procedure if exists minus_proc;
delimiter $$
create procedure minus_proc ( )
begin
    declare x int;  declare y int; declare z int;
    set x = 50; set y = 35; set z = x - y; 
    select x, y, z; 
end $$
delimiter ;

call minus_proc;
call minus_proc;

select @a, @b, @c;
select x, y, z;
select @x, @y, @z;

drop procedure if exists minus_proc2;
delimiter $$
create procedure minus_proc2 (IN s int, IN t int)
begin
    declare u int;  
    set u = s - t;  
    select s, t, u; 
end $$
delimiter ;

call minus_proc2(200, 150);
call minus_proc2(5000, 2550);
call minus_proc2(30, 10);

call minus_proc;
call minus_proc;

### 아래 프로시저는 두개의 값과 연산자를 파라메타로 전달 받아서, 그 두개의 값에 대해 해당
### 연산을 실행하는 프로시저이다. 빈 줄을 채워서 프로시저를 완성하시오.

drop procedure if exists oper_proc;
delimiter $$
create procedure oper_proc (IN s int, IN op char, IN t int)
begin
      declare u int;  
      case
	when op = '+' then set u = s + t;
	when op = '-' then set u = s - t;
	when op = '*' then set u = s * t;
	when op = '/' then set u = s / t;
	else set u = -10000;
     end case;
     select s, op, t, '=', u;
end $$
delimiter ;

call oper_proc (100, '+', 50);
call oper_proc (250, '-', 120);
call oper_proc (10, '*', 5);
call oper_proc (400, '/', 80);  

### 임의의 호출문을 4개 이상 작성하여 실행하기 


#호출문 1
drop procedure if exists average;
delimiter $$
create procedure average (IN s int, IN t int)
begin
    declare u int;  
    set u = (s + t) / 2;  
    select s, t, u; 
end $$
delimiter ;

call average (100 , 200);
call average (200 , 300);
call average (300 , 400);


# 호출문 2
drop procedure if exists OPERATER;
delimiter $$
create procedure OPERATER (IN op varchar(15) character set 'utf8' collate 'utf8_bin', IN s int, IN t int)
begin
      declare u int;  
      case
	when op = '더하기' then set u = s + t;
	when op = '빼기' then set u = s - t;
	when op = '곱하기' then set u = s * t;
	when op = '나누기' then set u = s / t;
	else set u = -10000;
     end case;
     select s, op, t, '=', u;
end $$
delimiter ;

call OPERATER ('더하기', 3 , 4);
call OPERATER ('뺴기', 3 , 4);
call OPERATER ('곱하기', 3 , 4);
call OPERATER ('나누기', 3 , 4);


### 호출문 3
drop procedure if exists mg;
delimiter $$
create procedure mg (IN s  varchar(15) character set 'utf8' collate 'utf8_bin',
 IN t  varchar(15) character set 'utf8' collate 'utf8_bin')
begin
    declare u varchar(30) character set 'utf8' collate 'utf8_bin';
    set u = concat(s,t);
    select s, t, u; 
end $$
delimiter ;

call mg ('love' , 'test');
call mg ('big' ,'data');
call mg ('he is ', 'handsome');


##호출문 4
drop procedure if exists we;
delimiter $$
create procedure we (IN op int)
begin
      declare u varchar(15) character set 'utf8' collate 'utf8_bin';
      case
		when op = 1 then set u = "월요일";
		when op = 2 then set u = "화요일";
		when op = 3 then set u = "수요일";
		when op = 4 then set u = "목요일";
        when op = 5 then set u = "금요일";
        when op = 6 then set u = "토요일";
        when op = 7 then set u = "일요일";
		else set u = "에러입니다";
     end case;
     select op , u;
end $$
delimiter ;

call we (1);
call we (2);
call we (3);
call we (4);
call we (5);
call we (6);
call we (7);
call we (100);

### 여기까지 모든 문장의 실습을 완료하면, 이 문장들을 스크립트 파일에 저장하여 실습 결과 과제로 
### 제출하세요.

### 수고하셨습니다.
