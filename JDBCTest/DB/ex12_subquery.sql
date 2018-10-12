-- ex12_subquery.sql
/*

서브쿼리, Sub Query
- 하위 쿼리, 부분 쿼리
- SQL 안에 또 다른 SQL이 들어있는 형태
- 서브쿼리를 사용할 있는 위치(어디든지 데이터가 필요한 곳이면 다 사용이 가능하다.)
    a. where 절 : 서브쿼리의 결과셋을 조건값으로 사용한다.
    b. 컬럼리스트 : 서브쿼리의 결과셋을 하나의 컬럼값으로 사용한다.
    c. from 절 : 서브쿼리의 결과셋을 하나의 테이블로 사용 > 인라인 뷰(Inline View)
    d. order by 절
    e. group by 절
*/

select * from tblhousekeeping order by price desc;

-- 단가가 가장 높은 물건의 이름?
-- 1. 가장 높은 단가? 얼마?
select max(price) from tblhousekeeping;

-- 2. 모든 항목 중 단가가 15000원인 물건?
select item from tblhousekeeping where price = 15000;


-- 집계함수는 where 절에서 사용이 불가능하다.(***)
select item from tblhousekeeping where price = max(price);


-- 서브 쿼리
-- 서브 쿼리가 먼저 질의한 후에 반환되는 결과값을 원래 쿼리에 사용하고자 할때..
select item from tblhousekeeping where price = (select max(price) from tblhousekeeping);
select item from tblhousekeeping where price = (select min(price) from tblhousekeeping);
select item from tblhousekeeping where price < (select avg(price) from tblhousekeeping);


-- select buseo, count(*) from tblinsa group by buseo;
select avg(basicpay) from tblinsa; --155만원

select count(*) from tblinsa where basicpay >= (select avg(basicpay) from tblinsa);

select count(*) from tblinsa 
    where basicpay >= (select avg(basicpay) from tblinsa where substr(ssn, 8, 1) = '1') and substr(ssn, 8, 1) = '1';
    

-- '영업부' 직원 중 가장 적은 급여를 받는 사람보다 더 많은 급여를 받는 직원이 전체 직원 중 몇명입니까?
select count(*) from tblinsa
    where basicpay >= (select min(basicpay) from tblinsa where buseo = '영업부');

-- '영업부' 직원 중 가장 고참의 급여보다 더 많이 받는 직원이 총 몇명?
select name, buseo, jikwi from tblinsa
    where basicpay >= (select basicpay from tblinsa 
                                            where ibsadate = (select min(ibsadate) from tblinsa 
                                                                                    where buseo = '영업부'));
-- test(aaa(bbb()))


-- hr
select * from employees;
select * from departments;
select * from locations;

-- 직원 중 'Steven King'이(employees) 소속된 부서가(departments) 어느 지역에 있는지 주소를(locations) 알려주세요.


select department_id from employees
    where first_name = 'Steven' and last_name = 'King';

select location_id from departments
    where department_id = 90;

select * from locations
    where location_id = 1700;

select * from locations
    where location_id = (select location_id from departments
                                                         where department_id = (select department_id from employees
                                                                                    where first_name = 'David' and last_name = 'Austin'));





-- 컬럼리스트에서 서브쿼리 사용하기

-- 모든 직원들이 '홍길동'보다 얼마를 더 받거나 덜 받는지 궁금?
select basicpay from tblinsa where name = '홍길동'; --2610000

select name, basicpay, basicpay - 2610000 as "차액" from tblinsa where name <> '홍길동';


select name, basicpay, basicpay - (select basicpay from tblinsa where name = '김정훈') as "차액"
    , (select basicpay from tblinsa where name = '김정훈') as "김정훈 급여"
        from tblinsa 
                where name <> '김정훈';


-- 집계 함수
-- 1. where 절에서 사용 불가 > where 절에서 서브쿼리를 사용하면 가능하다.
-- 2. 컬럼리스트에 일반 컬럼과 집계 함수를 동시 사용 불가 > 컬럼리스트에 서브쿼리를 사용하면 가능하다.

select round(avg(basicpay)) as "평균 급여" from tblinsa;
select name, basicpay from tblinsa;

select name, basicpay
    , (select round(avg(basicpay)) from tblinsa) as "평균 급여" 
    , (select round(max(basicpay)) from tblinsa) as "최대 급여"
    , (select round(min(basicpay)) from tblinsa) as "최대 급여" 
        from tblinsa;


select name, basicpay
    , basicpay - (select round(avg(basicpay)) from tblinsa) as "평균 급여" 
    , basicpay - (select round(max(basicpay)) from tblinsa) as "최대 급여"
    , basicpay - (select round(min(basicpay)) from tblinsa) as "최대 급여" 
        from tblinsa;




-- from 절에서 서브쿼리를 사용하기
-- 인라인 뷰
-- 임시 테이블 역할(익명 테이블 - 재사용 불가)
select * from tblname where gender = 'f';

select * from (select * from tblname where gender = 'f');

select name, jikwi, city from (select name, jikwi as "직위", city from tblinsa where buseo = '영업부'); --임시 영업부 테이블

select name, 직위, city, firstname from (select name, substr(name, 2, 2) as firstname, jikwi as "직위", city from tblinsa where buseo = '영업부'); --임시 영업부 테이블
    



-- where 절에서의 서브쿼리에서만..

-- 1. 서브쿼리의 결과가 단일행인 경우
-- : 비교 연산자를 사용한다.(단일값)

-- 2. 서브쿼리의 결과가 다중행인 경우
-- : in을 사용한다.(다중값 & 열거값)

-- 3. 서브쿼리의 결과가 단일 컬럼인 경우
-- : 값으로 취급

-- 4. 서브쿼리의 결과가 다중 컬럼인 경우
-- : = 연산자와 () 를 사용해서 다대다 비교를 만들어서 사용한다.(순서와 갯수가 다르면 안된다.***)


-- '홍길동'과 '이순애'가 속한 부서의 직원 명단을 가져오시오.
--ORA-01427: single-row subquery returns more than one row
select * from tblinsa
    where buseo = (select buseo from tblinsa where name = '홍길동' or name = '이순애');

select * from tblinsa
    where buseo = '기획부' or buseo = '개발부';

select * from tblinsa
    where buseo in ('기획부', '개발부');

select * from tblinsa
    where buseo in (select buseo from tblinsa where name = '홍길동' or name = '이순애');


select * from tblinsa
    where buseo in (select buseo, city from tblinsa where name = '홍길동');


-- '엄용수'과 같은 부서에 소속 + 같은 직위를 가진 직원??
select * from tblinsa where name = '엄용수';

select * from tblinsa where buseo = '개발부' and jikwi = '사원';--최종 목적


select * from tblinsa 
    where buseo = (select buseo from tblinsa where name = '엄용수') 
                and jikwi = (select jikwi from tblinsa where name = '엄용수');


select * from tblinsa 
    where (buseo, jikwi, city, to_char(ibsadate, 'yyyy')) = (select buseo, jikwi, city, to_char(ibsadate, 'yyyy') from tblinsa where name = '엄용수');



-- 컬럼 리스트에 서브쿼리를 사용하는 경우에만..
-- : 서브쿼리가 무조건 단일값 반환해야 한다.(1번만 가능) 나머지는 사용 불가능하다.

-- 1. 단일 컬럼 + 단일 행
select first, last, (select avg(weight) from tblname) as "평균 몸무게" from tblname;

-- 2. 단일 컬럼 + 다중 행 : 100% 불가능
select first, last, (select height from tblname where height > 170) from tblname;

-- 3. 다중 컬럼 + 단일 행
select first, last, (select height, weight from tblname where first='재석') from tblname;



-- from 절에서 사용하는 경우에만..
-- : 1 ~ 4번까지 모두 다 사용 가능
-- : where 절(값의 역할), select 절(단일 컬럼값의 역할), from 절(테이블의 역할)

-- 1. 단일 컬럼 + 단일 행
-- 2. 단일 컬럼 + 다중 행
-- 3. 다중 컬럼 + 단일 행
-- 4. 다중 컬럼 + 다중 행














--\z