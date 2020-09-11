create database university;
show databases;
use university;
show tables;
create table 학과 (
학과번호 int not null primary key,
학과명 char(24) not null,
전화번호 char(16),
위치 varchar(30)) engine = InnoDB default charset= utf8;
drop table 학과;

create table 학생(
학번 int not null,
이름 char(12) not null,
학년 int,
나이 int,
학과번호 int,
primary key(학번),
foreign key(학과번호) references 학과(학과번호))
engine = InnoDB default charset= utf8;

create table 과목(
과목번호 int not null,
과목명 varchar(30) not null,
담당교수 char(10),
강의실 varchar(30),
primary key(과목번호))
engine = InnoDB default charset= utf8;

create table 수강(
학번 int not null,
과목번호 int not null,
점수 int,
primary key(학번, 과목번호),
foreign key(학번) references 학생(학번),
foreign key(과목번호) references 과목(과목번호))
engine = InnoDB default charset= utf8;

select * from 학과;
insert into 학과 values( 1, "물리학과", "250-8446", "자4-410");
insert into 학과 values( 2, "컴퓨터공학과", "250-6380", "공6-205");
insert into 학과 values( 3, "통계학과", "250-6320", "경4-101");

insert into 학생 values (100, '이홍식', 3, 23, 1);
insert into 학생 values (101, '김경태', 2, 22, 1);
insert into 학생 values (102, '박상식', 2, 21, 2);
insert into 학생 values (103, '김윤호식', 1, 20, 3);

insert into 과목 values (10, "데이타베이스", "이준호", "자5-108");
insert into 과목 values (11, "네트워크", "윤경식", "자5-109");
insert into 과목 values (22, "컴퓨터구조", "김병천", "자5-108");
insert into 과목 values (33, "자바", "김상욱", "자4-302");
select * from 과목;

insert into 수강 values( 100, 10, 95 );
insert into 수강 values( 100, 11, 90);
insert into 수강 values( 101, 11, 86);
insert into 수강 values( 101, 22, 83);
insert into 수강 values( 101, 33, 87);
insert into 수강 values( 102, 10, 90);
insert into 수강 values( 102, 11, 95);
insert into 수강 values( 102, 22, 89);
insert into 수강 values( 102, 33, 75 );
select * from 수강;

select * from 학생;
select 학번, 이름 , 학과번호from 학생 where 나이 = 22;
select 학번, 이름, 학과명 from 학생 s, 학과 d where s.학과번호 = d.학과번호;
select 학번, 이름, 학과명 from 학생 s join 학과 d on  s.학과번호 = d.학과번호;
select 학번, 이름, 학과명 from 학생 s , 학과 d
where s.학과번호 = d.학과번호 and 학과명 = "물리학과";

select 학번, 이름, 학과명 from 학생 s join 학과 d on  s.학과번호 = d.학과번호
where 학과명 = "물리학과";

select 학번 , 이름 from 학생 where 학과번호 in
(select 학과번호 from 학과 where 학과명 = "물리학과");

select 학번, 이름 from 학생 s where exists
(select * from 학과 d where 학과명 = "물리학과" and d.학과번호 = s.학과번호);

select 이름 from 수강 e , 학생 s where 과목번호 = 10 and e.학번 = s.학번;
select 이름 from 학생 where 학번 not in(select 학번 from 수강 where 과목번호 = 10);

select 이름 from 학생 s where not exists
(select * from 수강 e where 과목번호 = 10 and e.학번 = s.학번);