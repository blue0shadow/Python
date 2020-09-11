use university;
set sql_safe_updates = 0;
show tables;

### 대학교 테이블들에 대해 아래 질의문을 실행해 보기 
###
### 11번 과목을 90점 이상 받은 학생의 학번과 점수를 검색하기
select 학번, 점수 from 수강 where 과목번호=11 and 점수 >= 90;

### 11번 과목을 90점 이상 받은 학생의 학번, 이름, 점수를 검색하기
select s.학번, 이름, 점수  from 수강 e, 학생 s 
where 과목번호=11 and 점수 >= 90 and e.학번=s.학번;

### 11번 과목을 90점 이상 받은 학생의 학번, 이름, 점수를 검색하기
select s.학번, 이름, 점수  from 수강 e, 학생 s 
where 과목번호=11 and 점수 >= 90 and e.학번=s.학번;

### 11번 과목을 90점 이상 받은 학생의 학번, 이름, 점수, (소속) 학과명를 검색하기
select s.학번, 이름, 학과명, 점수  from 수강 e, 학생 s, 학과 d 
where 과목번호=11 and 점수 >= 90 and e.학번=s.학번 and s.학과번호=d.학과번호;

### 11번 과목을 90점 이상 받은 학생의 학번, 이름, 점수, (소속) 학과명를 검색하기 (조인된 테이블 사용)
select s.학번, 이름, 학과명, 점수  
from (수강 e join 학생 s on e.학번=s.학번) join 학과 d on s.학과번호=d.학과번호 
where 과목번호=11 and 점수 >= 90 ;

### 11번 과목을 90점 이상 받은 학생의 학번, 이름를 검색하기 (중첩 질의 사용)
select 학번, 이름  from 학생 where 학번 in 
(select 학번 from 수강 where 과목번호=11 and 점수 >= 90) ; 

### 11번 과목을 90점 이상 받은 학생의 학번, 이름를 검색하기 (상관 중첩 질의 사용)
select 학번, 이름  from 학생 s where exists  
(select * from 수강 e where 과목번호=11 and 점수 >= 90 and e.학번=s.학번) ; 

### 대학교 테이블들에 대해, 아래 질의에 해당하는 SQL문을 작성하고 실행해 보기 
###
### '네크워크' 과목의 담당교수와 강의실을 검색하기 
select 담당교수, 강의실 from 과목 where 과목명 = "네트워크";


### '네트워크' 과목을 수강하는 학생의 학번을 검색하기 (일반 조인 질의문 사용)
select 학번 from 수강 s join 과목 d on s.과목번호=d.과목번호 where 과목명 = "네트워크";

### '네트워크' 과목을 수강하는 학생의 학번을 검색하기 (중첩 질의문 사용)
select 학번 from 학생 where 학번 in (select 학번 from 수강, 과목 where 과목명 = "네트워크" and 수강.학번=학생.학번);

### '네트워크' 과목을 수강하는 학생의 학번을 검색하기 (상관 질의문 사용)
select 학번 from 학생 s where exists  
(select * from 수강 e, 과목 d where 과목명 = "네트워크" and e.학번=s.학번) ; 


### '네트워크' 과목을 수강하지 않는 학생의 학번을 검색하기 (중첩 질의문 사용)
select 학번 from 학생 where 학번 not in (select 학번 from 수강, 과목 where 과목명 = "네트워크" and 수강.학번=학생.학번);

### '네트워크' 과목을 수강하지 않는 학생의 학번을 검색하기 (상관 질의문 사용)
select 학번 from 학생 s where not exists  
(select * from 수강 e, 과목 d where 과목명 = "네트워크" and e.학번=s.학번) ; 

### 위 질의에 해당하는 select문을 작성하여 실행하여 원하는 결과가 나오는 올바른 질의인지 확인함. 
### 모든 실습을 완료하면, 실습한 질의들을 스크립트 파일에 저장하여 실습 결과 과제로 제출함

### 수고하셨습니다.
