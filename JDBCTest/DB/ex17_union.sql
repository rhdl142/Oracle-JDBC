-- ex17_union.sql
/*
union, 유니온
- 테이블을 합치는 기술
- 종

join, 조인
- 테이블을 합치는 기술
- 횡

*/

create table 과장
as
select * from tblInsa where jikwi = '과장';

create table 부장
as
select * from tblInsa where jikwi = '부장';

select * from 과장; --8명
select * from 부장; --7명

-- union 구조가 같은 2개 이상 테이블 하나로 합친다.
select * from 과장 
union 
select * from 부장;

-- ORA-01790: expression must have same datatype as corresponding expression
select name, ssn from 과장
union
select name, basicpay from 부장;

-- 구조가 동일하다고 union을 하면 안된다.(***) > 구조와 의미가 모두 같아야 가능!!!!!
select name, sudang from 과장
union
select name, basicpay from 부장;

-- 두 셋의 컬럼수도 동일해야 한다.
select name, sudang, ssn from 과장
union
select name, basicpay, null from 부장;


-- 여러 테이블을 1개의 테이블 취합(***)하는 용도
select name from tblCustomer
union
select name from tblMember
union
select last || first from tblname
union
select name from tblStaff;


--공격수 테이블
--수비수 테이블
select * from 공격수
union
select * from 수비수;

--회사(**부서별 게시판)
--1. 게시판 테이블 1개만 구성
-- : 게시물의 부서를 구분하는 컬럼 생성 & 사용
-- : 업무 중 모든 게시물을 접근하는 업무가 빈번할 때

--2. 게시판 테이블 부서별 구성
-- : 부서별로 별도의 테이블 생성
-- : 쪼개서 볼 업무가 많고, 합쳐서 볼 업무가 적을 때

--영업부, 총무부, 기획부 게시판
create table tblBoard1 --영업부
(
    seq number primary key,
    subject varchar2(1000) not null
);

create table tblBoard2 --총무부
(
    seq number primary key,
    subject varchar2(1000) not null
);

create table tblBoard3 --기획부
(
    seq number primary key,
    subject varchar2(1000) not null
);

delete from tblBoard1;
truncate table tblBoard2;
truncate table tblBoard3;

--게시물
insert into tblBoard1 values (1, '영업부 게시판입니다.');
insert into tblBoard1 values (2, '영업부 회식있습니다.');
insert into tblBoard1 values (3, '영업부 공지입니다.');

insert into tblBoard2 values (1, '총무부 게시판입니다.');
insert into tblBoard2 values (2, '총무부 회식있습니다.');

insert into tblBoard3 values (1, '기획부 게시판입니다.');
insert into tblBoard3 values (2, '기획부 회식있습니다.');
insert into tblBoard3 values (3, '기획부 공지입니다.');
insert into tblBoard3 values (4, '기획부 테스트입니다.');



--일련번호 + 겹치지 않는 숫자 > sequence 객체
create sequence boardSeq;

insert into tblBoard1 values (boardSeq.nextval, '영업부 게시판입니다.');
insert into tblBoard1 values (boardSeq.nextval, '영업부 회식있습니다.');
insert into tblBoard1 values (boardSeq.nextval, '영업부 공지입니다.');

insert into tblBoard2 values (boardSeq.nextval, '총무부 게시판입니다.');
insert into tblBoard2 values (boardSeq.nextval, '총무부 회식있습니다.');

insert into tblBoard3 values (boardSeq.nextval, '기획부 게시판입니다.');
insert into tblBoard3 values (boardSeq.nextval, '기획부 회식있습니다.');
insert into tblBoard3 values (boardSeq.nextval, '기획부 공지입니다.');
insert into tblBoard3 values (boardSeq.nextval, '기획부 테스트입니다.');




--영업부 직원
select * from tblBoard1;
--총무부 직원
select * from tblBoard2;
--기획부 직원
select * from tblBoard3;

--사장님 -> 모든 게시물을 한번에 보게 해달라..
select * from
    (select * from tblBoard1
    union
    select * from tblBoard2
    union
    select * from tblBoard3)
        order by seq desc;


--싸이월드 
--방명록 : 게시물 5년치 > 올해 6년차
--1. 1개 테이블 사용
--  : 일괄 검색, 통합 관리 편함.
--  : 데이터가 많아질 수록 검색에 시간이 오래 걸림
--2. 여러개 테이블 사용
--  : 테이블 개당 레코드를 줄여서 검색 속도를 줄이자
--  : 통합 관리 > union 등의 기술을 사용해서 통합(비용 발생)


create table tblUnionA
(
    name varchar2(50) not null
);

create table tblUnionB
(
    name varchar2(50) not null
);

insert into tblUnionA values ('사과');
insert into tblUnionA values ('귤');
insert into tblUnionA values ('파인애플');
insert into tblUnionA values ('바나나');
insert into tblUnionA values ('포도');

insert into tblUnionB values ('키위');
insert into tblUnionB values ('바나나');
insert into tblUnionB values ('오렌지');
insert into tblUnionB values ('포도');
insert into tblUnionB values ('복숭아');

select * from tblUnionA;
select * from tblUnionB;

select * from tblUnionA
union --중복값은 제거
select * from tblUnionB;

select name, count(*) from
(select * from tblUnionA
union all
select * from tblUnionB) group by name having count(*) > 1;

select * from tblUnionA
union all --중복값도 표현
select * from tblUnionB;

select * from tblInsa where buseo = '기획부'
union all
select * from tblInsa where jikwi = '부장';


select * from tblUnionA
intersect --교집합
select * from tblUnionB;

select * from tblInsa where buseo = '기획부'
intersect
select * from tblInsa where jikwi = '부장';

select * from tblUnionA
minus -- A - B
select * from tblUnionB;

select * from tblUnionB
minus -- B - A
select * from tblUnionA;



















