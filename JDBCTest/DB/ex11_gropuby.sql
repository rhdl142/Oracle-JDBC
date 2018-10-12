-- ex11_gropuby.sql
/*

group by 절
- 레코드들을 특정 컬럼값(1개 이상)에 맞춰서 그룹을 나누는 작업
- 편가르기
- 그룹을 왜 묶을까?
    1. 그룹을 나눠서 구분해서 관리하려고? 따로 정렬을 하기 위해서? : X
    2. 나눠 놓은 그룹을 완전 분리 > 별도의 테이블로 관리 : X
    3. 각각의 나눠놓은 그룹별로 집계함수를 적용하기 위해서 : O(group by 절의 목적)

- group by 컬럼명
    : 그룹을 나누는데 기준이 되는 컬럼명(1개 or 그 이상)

- group by 구문
- select 컬럼리스트 from 테이블명 [where 절] [group by 절] [order by절]

- group by 사용 시 컬럼리스트에 올 수 있는 대상
    a. 집계 함수(주목적*****)
    b. group by의 대상 컬럼
    c. a와 b를 제외하고는 모두 불가능

*/
-- tblinsa. 부서별(그룹) 평균(집계) 급여?
select round(avg(basicpay)) from tblinsa; --155만원 + 전체 직원 평균 급여

-- 부서 정보?
select distinct buseo from tblinsa;

select round(avg(basicpay)) from tblinsa where buseo = '총무부'; -- 171만원
select round(avg(basicpay)) from tblinsa where buseo = '개발부'; -- 138만원
select round(avg(basicpay)) from tblinsa where buseo = '영업부'; -- 160만원
select round(avg(basicpay)) from tblinsa where buseo = '기획부'; -- 185만원
select round(avg(basicpay)) from tblinsa where buseo = '인사부'; -- 153만원
select round(avg(basicpay)) from tblinsa where buseo = '자재부'; -- 141만원
select round(avg(basicpay)) from tblinsa where buseo = '홍보부'; -- 145만원


-- tblinsa. 부서별(그룹) 평균(집계) 급여?
-- 집계함수, group by 대상 컬럼 : 집합 값
-- 나머지 컬럼 : 개인 값
select buseo, round(avg(basicpay))  from tblinsa group by buseo;


select name, ssn from tblinsa;

-- 남자직원 몇명? 여자직원 몇명? > 성별로 그룹을 나눈 뒤 count() 함수 적용
select count(*), ssn from tblinsa group by substr(ssn, 8, 1);
select count(*), substr(ssn, 8, 1) from tblinsa group by substr(ssn, 8, 1);

select
    count(decode(substr(ssn, 8, 1), '1', 1)) as 남자직원수, 
    count(decode(substr(ssn, 8, 1), '2', 1)) as 여자직원수 
from tblinsa;


-- 입사한 월 기준 : 각 월별 몇명씩 입사?
select to_char(ibsadate, 'mm'), count(*) from tblinsa
    group by to_char(ibsadate, 'mm')
        --order by to_char(ibsadate, 'mm') asc;
        order by count(*) desc;


select substr(name, 1, 1), count(*) from tblinsa
    group by substr(name, 1, 1)
        order by count(*) desc, substr(name, 1, 1) asc;


-- 백만원 단위로 그룹 > 각각의 그룹 몇명?
select floor(basicpay / 1000000) * 100 || '만원대', count(*) from tblinsa
    group by floor(basicpay / 1000000);


-- 실행 순서 : from > where > group by > select > order by

-- 질문?
-- tblinsa. 60명 전직원을 가지고 buseo별로 평균 급여를 가져오시오.
-- 추가조건. 각 직원이 월급이 2백만원 이상인 사람들만 가지고 buseo별로 그룹 짓기 > 평균 급여
select buseo, round(avg(basicpay)), count(*) --3.
    from tblinsa --1.
        group by buseo; --2.

select buseo, round(avg(basicpay)), count(*) --4.
    from tblinsa --1.
        where basicpay >= 2000000 --2.
            group by buseo; --3.

-- p205
-- cte, with, merge 패스

--
--
--create table testPivot
--(
--    name varchar2(10),
--    season varchar2(10),
--    amount number(3)
--);
--
--insert into testPivot (name, season, amount) values ('김범수', '겨울', 10);
--insert into testPivot (name, season, amount) values ('김범수', '겨울', 5);
--insert into testPivot (name, season, amount) values ('김범수', '봄', 10);
--insert into testPivot (name, season, amount) values ('김범수', '여름', 10);
--insert into testPivot (name, season, amount) values ('윤종신', '가을', 10);
--insert into testPivot (name, season, amount) values ('윤종신', '봄', 10);
--insert into testPivot (name, season, amount) values ('싸이', '봄', 10);
--insert into testPivot (name, season, amount) values ('싸이', '봄', 5);
--insert into testPivot (name, season, amount) values ('싸이', '여름', 10);
--insert into testPivot (name, season, amount) values ('싸이', '가을', 10);
--insert into testPivot (name, season, amount) values ('싸이', '겨울', 10);
--
--
--select name, season, sum(amount) from testPivot
--    group by name, season;
--
--select * from testPivot
--    pivot (sum(amount) for season in ('봄', '여름', '가을', '겨울'));



select * from tblZoo where family = '파충류';

--새끼 몇종류? 알 몇종류?
select born, count(*) from tblZoo group by born;

select family, round(avg(leg)), sum(leg), count(*), min(leg), max(leg) 
    from tblZoo 
        group by family;


select sizeof, born, wing, count(*) from tblZoo
    group by sizeof, born, wing;


-- select(3) + group by(2) + where(1)
select * from tblZoo;


select thermo, count(*) from tblZoo
    group by thermo;

select thermo, count(*) from tblZoo
    where born = 'young'
        group by thermo;

select thermo from tblZoo
    where born = 'young';



/*
having 절
- group by 절과 반드시 함께 사용
- 조건절(where 절과 같은 역할)
- from 절(모든 레코드 반환, 개개인 반환) -> 조건 -> where 절(각 개인에 대한 조건 & 질문) -> 결과 -> 만족하는 레코드 반환
- group by 절(레코드 그룹 형성) -> 통계 함수 적용 -> 통계 함수 적용 값 조건 -> having(통계 함수에 대한 조건) -> 결과 -> 만족하는 그룹 반환
*/

select buseo, round(avg(basicpay)) --3.
    from tblinsa --1.
        group by buseo; --2.

select buseo, round(avg(basicpay)) --4.
    from tblinsa --1.
        where basicpay >= 1500000 --***2.
            group by buseo; --3.

select buseo, round(avg(basicpay)) --4.
    from tblinsa --1.
        group by buseo --2.
            having avg(basicpay) >= 1500000; --*** 3.

-- 실행순서 : from -> where -> group by -> having -> select -> order by
select buseo, round(avg(basicpay)) --5.
    from tblinsa --1.
        where basicpay >= 1500000 --2.
            group by buseo --3.
                having avg(basicpay) >= 1500000 --4.
                    order by round(avg(basicpay)) asc; --6


select * from tblZoo;

select born, count(*), avg(leg) from tblZoo
    where fly = 'n'
        group by born
            having avg(leg) <= 2;
















