-- ex03_select.sql

/*

select 문
- DML, DQL
- 가장 중요한 구문(************************************************************************************)

1. 테이블로부터 저장되어 있는 데이터 중 원하는 데이터만 가져오는 명령어

2. 테이블이 아닌것으로부터 데이터를 가져오는 명령어

*** SQL은 보통 1개(2개) 이상의 구(절)이 조합되어 문장을 만든다. 
*** 각 절의 우선순위(실행순서)를 기억!!!
*** ; : 문장 종결자


select 구문 정의

select 컬럼리스트 from 테이블명;
select 컬럼리스트 from 테이블명 where절;
select 컬럼리스트 from 테이블명 where절 order by절;
select 컬럼리스트 from 테이블명 where절 group by절 order by절;
select 컬럼리스트 from 테이블명 where절 group by절 having절 order by절;
select 컬럼리스트 from 테이블명 [where절] [group by절] [having절] [order by절];


*/

select hr.tblcountry.name from hr.tblcountry;

select name from tblcountry;

/*

실행 순서 : from > select

1. select 컬럼리스트
    - 가져올 컬럼을 지정한다.

2. from 테이블
    - 가져올 테이블을 지정한다.

*/

select * from tblcountry;

select * 
from tblcountry;

select * 
    from tblcountry;
    
select *
from tblcountry;

select continent
from tblcountry;


-- 현재 존재하는 테이블이?
-- 1. 클라이어트 툴 제공 기능
-- 2. select 명령어 + 시스템 테이블
select * from tabs;

-- tblcountry 테이블 > 어떤 구성?
-- 1. 클라이어트 툴 제공 기능
-- 2. desc 명령어
desc tblcountry;


-- tblcountry로부터 모든 컬럼과 모든 행을 가져오시오.
select name, capital, population, continent, area
from tblcountry;

-- * : wildcard > 모든 컬럼
select * 
from tblcountry;

select area, name, capital, population, continent
from tblcountry;



-- 일부 컬럼 가져오기
select name, capital from tblcountry;


desc tblname;
select * from tblname;

select first, last from tblname;
select last, first from tblname;

-- ORA-00942: table or view does not exist
select last, first from tblnama;

-- ORA-00904: "FIRS": invalid identifier
select last, firs from tblname;

-- 동일한 컬럼을 여러번 가져오는게 가능하다.
select nick from tblname;
select nick, nick from tblname;
select nick, length(nick) from tblname;


-- 컬럼값의 연산
select last, first, weight - 10, weight from tblname;

-- BMI
select last, first, weight / (height * height) * 10000 from tblname;

-- 문자열 연산(+)
select last, first, last || first from tblname;

select * from zipcode;

select zipcode, sido || ' ' || gugun || ' ' || dong || ' ' || bunji from zipcode;


-- 오라클은 컬럼을 연산하는 순간 결과 테이블의 컬럼명이 해당 컬럼의 연산 표현식이 된다.

-- 컬럼의 별칭(Alias) 붙이기
-- : 개명(이름을 완전히 바꾼다)
-- : 공백 문자 사용 금지 > 되도록 토큰(Token, 공백없는 문자열)을 사용
select last, first, last || first as fullname, length(last || first) as length from tblname;

select last, first, weight as 연예인 몸무게 from tblname;
select last, first, weight as "연예인 몸무게" from tblname;
select last, first, weight as "select" from tblname; -- 절대 하지 말것!!!!!!!!!

select last, first, "select" from A;

/*

연산자

1. 산술 연산자
    - +, -, *, /
    - %(없음) -> 함수로 제공(mod())

2. 비교 연산자
    - >, >=, <, <=
    - =(==), <>(!=)

3. 논리 연산자
    - and(&&), or(||), not(!)

4. 문자열 연산자
    - ||(concat)

5. 대입 연산자
    - 존재 X

6. 3항 연산자
    - 존재 X

7. 증감 연산자
    - 존재 X

8. SQL 연산자
    - in, between, like, is, any, all 등...

*/











































