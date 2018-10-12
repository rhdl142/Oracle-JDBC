
-- ex05_function.sql
/*

오라클(SQL) 함수
- 집계함수, 문자열함수, 숫자함수, 날짜시간함수 등..

집계함수
- 통계함수, 집약함수, 집합함수
- 집계 결과를 만들어 낸다
- 복수의 행을 입력받아 단일 값을 반환한다.(***)

1. count() : 갯수
2. sum() : 총합(누적)
3. avg() : 평균
4. max() : 최댓값
5. min() : 최솟값

*/

/*
1. count()
- 행의 갯수를 반환한다.
- number count(컬럼명) **
- number count(연산식)
- number count(상수)
- 특정 컬럼을 지정했을 때 그 컬럼값이 null을 가지면, null을 가지는 레코드는 카운트에서 제외
- *을 지정했을 때 null과 상관없이 항상 모든 레코드의 카운트를 반환
*/

select * from tblname;
select count(*) from tblname;
select * from tblname where gender = 'f';
select count(*) from tblname where gender = 'f';
select count(*) from tblname where gender = 'm';

select * from tblcountry; --14개
select count(name) from tblcountry; --특정 컬럼값의 카운트
select count(*), count(name), count(capital), count(population), count(continent), count(area) from tblcountry;

-- tblinsa. 연락처가 아직 없는 직원? 몇명?
select count(*) from tblinsa where tel is null;
select count(*) - count(tel) from tblinsa;

-- tblinsa. 연락처가 있는 직원? 몇명?
select count(*) from tblinsa where tel is not null;
select count(tel) from tblinsa;

-- tbltodo
select * from tbltodo;
-- 아직 해야할 일이 몇개 남았는지?
select count(*) from tbltodo where completedate is null;
select count(*) - count(completedate) as cnt from tbltodo;


-- tblinsa
-- 서울에 있는 직원 몇명?
select count(*) from tblinsa where city = '서울'; --20명

-- 1000000000 -> 모든 직원 보너스 지급 -> 1/N -> 개인 당 얼마 받는지?
select count(*) from tblinsa; -- 60명
select 1000000000 / count(*) from tblinsa; 

-- 부서가 7개 -> 7 반환 : tblinsa에는 부서가 총 몇개 있습니까? + distinct
select buseo from tblinsa;
select count(buseo) from tblinsa;
select count(distinct buseo) from tblinsa;


--집계 함수 사용 시 주의할 것!!!!!!!!!!!!!!
--1. 집계함수의 결과는 일반 컬럼과 함께 컬럼 리스트에 기재할 수 없다.
-- ORA-00937: not a single-group group function
--2. 집계함수의 결과는 where절에서 사용할 수 없다.
-- where절 : 레코드의 대한 조건절(개인에 대한 조건)
-- ORA-00934: group function is not allowed here
select count(*), name from tblinsa;

--평균 급여
select avg(basicpay) from tblinsa; --155만원

--직원들 중 평균 급여보다 많이 받은 직원들이???
select * from tblinsa where basicpay >= avg(basicpay);



/*
2. sum()
- number sum(컬럼명)
- 해당 컬럼값의 총합을 반환
- 숫자 컬럼만을 대상으로..
*/
select sum(weight) from tblname; --843kg
select sum(height) from tblname; --1723cm
select sum(basicpay) from tblinsa; --

select sum(name) from tblinsa; --ORA-01722: invalid number
select sum(ibsadate) from tblinsa; --ORA-00932: inconsistent datatypes: expected NUMBER got DATE

select sum(weight), sum(weight * 10), sum(weight) * 10 from tblname;

--총급여, 총수당
select sum(basicpay), sum(sudang), sum(basicpay + sudang) from tblinsa;


/*
3. avg()
- number avg(컬럼명)
- 숫자 컬럼을 대상으로
*/
select 10, height from tblname;
select sum(height), sum(10), count(*), count(10) from tblname;


select avg(height) from tblname;
select avg(weight) from tblname;

--** 주의
select population from tblcountry;

--모든 나라의 평균 인구수?
select count(*) from tblcountry; --14
select sum(population) from tblcountry; --202652

select 202652 / 14 from tblcountry;
select 202652 / 14 from dual; --14475
select * from dual;

select 202652 / 14;


-- avg()는 null을 제외하고 평균을 낸다.
-- 총인구수 / 14 (X)
-- 총인구수 / 13 (O)
select avg(population) from tblcountry; --15588
select 202652 / 13 from dual;
select population from tblcountry; 

select sum(population) / count(population) from dual;  --avg()
select sum(population) / count(*) from dual; 

-- 10억 / 20명 -> avg()
-- 10억 / 30명 -> sum(수익) / count(*)
select avg(ibsadate) from tblinsa; --X

/*
4. max()
5. min()
- object max(컬럼명)
- object min(컬럼명)
- 해당 컬럼값들 중 가장 큰값 or 가장 작은값 반환
- 숫자, 문자, 날짜 등..
*/
select basicpay from tblinsa;
select max(basicpay), min(basicpay) from tblinsa;

select max(height), min(weight) from tblname;

select min(ibsadate) from tblinsa where buseo='총무부';

select max(nick) from tblname;


-- 오라클(DBMS)은 모든 식별자(테이블명,컬럼명,계정명,DB Object 명)의 길이가 최대 30자이내
select
    count(*) as "총 직원수",
    sum(basicpay) as "총 급여 합",
    avg(basicpay) as "모든 직원 평균 급여",
    max(basicpay) as "최대 급여",
    min(basicpay) as "최소 급여",
    max(basicpay) - avg(basicpay) as "최대 급여차",
    avg(basicpay) - min(basicpay) as "최소 급여차"
from tblinsa;


/*
숫자 관련 함수(수학 함수)

1. round()
- 반올림
- number round(컬럼명)
- number round(컬럼명,소수이하자릿수)
*/
select 3.14, round(3.14) from dual;
select 3.64, round(3.64) from dual;

select round(avg(basicpay)) from tblinsa;
select round(avg(basicpay), 2) from tblinsa;
select round(avg(basicpay), 0) from tblinsa;

select round(name) from tblinsa; --ORA-01722: invalid number
select round(ibsadate), ibsadate from tblinsa;
select round(sysdate), sysdate from dual; --날짜 시간 가능(오전,오후)


/*
2. floor(), trunc()
- 무조건 내림
- 절삭 함수
- number floor(컬럼명)
- number trunc(컬럼명)
- number trunc(컬럼명, 소수이하자릿수)
*/
select 123.654, round(123.654), floor(123.654), trunc(123.654), trunc(123.654, 1) from dual;

/*
3. ceil()
- 무조건 올림
- number ceil(컬럼명)
*/
select 123.456, round(123.456), floor(123.456), ceil(123.156) from dual;
select ceil(123.00000000000000000000000000000000001) from dual;
select ceil(123.000000000000000000000000000000000001) from dual;
select ceil(123) from dual;

/*
4. mod()
- 나머지 함수
- number mod(피제수, 제수)
*/
select mod(10, 3) from dual;

-- 100분 -> 몇시간 몇분?
select floor(100 / 60) as "시", mod(100, 60) as "분" from dual;


/*
문자열 함수

1. upper(), lower(), initcap()
- varchar2 upper(컬럼명)
*/

select 'studentName', upper('studentName'), lower('studentName'), initcap('studentName') from dual;

select * from employees;
select upper(first_name), lower(last_name) from employees;

--검색
--검색어 사용자 입력 : an
select * from employees
    --where first_name like 'D%';
    --where first_name like '%an%';
    where upper(first_name) like '%' || upper('an') || '%';



-- 오라클 키워드는 대소문자 구분안한다.
-- 오라클 데이터는 대소문자 구분한다.
-- 오라클은 문법을 파싱(해석)하는 과정에서 전부 대문자로 변환시킨다.
select * from employees;


/*
2. substr
- 문자열 추출
- 자바 : substring
- varchar2 substr(컬럼명, 시작위치, 갯수)
- varchar2 substr(컬럼명, 시작위치) : 끝까지
- SQL은 서수를 1부터 시작(****)
*/
select '가나다라마바사아자차카타파하' from dual;
select substr('가나다라마바사아자차카타파하', 3, 5) from dual;
select substr('가나다라마바사아자차카타파하', 3) from dual;


select name, substr(name, 1, 1) as 성, substr(name, 2) as 이름 from tblinsa;

select name, ssn,
    '19' || substr(ssn, 1, 2) as "태어난 년도",
    substr(ssn, 3, 2) as "태어난 월",
    substr(ssn, 8, 1) as "성별",
    case
        when substr(ssn, 8, 1) = '1' then '남자'
        when substr(ssn, 8, 1) = '2' then '여자'
    end as "성별",
    case
        when substr(ssn, 3, 2) >= 3 and substr(ssn, 3, 2) <= 5 then '봄' 
        when substr(ssn, 3, 2) >= 6 and substr(ssn, 3, 2) <= 9 then '여름'
        when substr(ssn, 3, 2) >= 10 and substr(ssn, 3, 2) <= 11 then '가을'
        else '겨울'
    end as "계절"
from tblinsa;


-- 남자 직원만 가져오기
select * from tblinsa
    --where ssn like '______-1______';
    --where ssn like '%-1%';
    --where substr(ssn, 8, 1) = '1';
    --where substr(ssn, 8, 1) = '1' or substr(ssn, 8, 1) = '3' or substr(ssn, 8, 1) = '5';
    --where substr(ssn, 8, 1) in ('1','3','5','7','9');
    where mod(substr(ssn, 8, 1), 2) = 1;


--집계 함수
-- : 컬럼리스트(O), where절(X), order by절(X)

--수학함수,문자열함수
-- : 컬럼리스트(O), where절(O), order by절(O)

--직원들을 태어난 월 순서대로 정렬
select * from tblinsa order by substr(ssn, 3, 2), substr(ssn, 5, 2);
select * from tblinsa order by basicpay + sudang;


/*
3. length()
- 문자열 길이
- number length(컬럼명)
*/
select email, length(email) from employees;
select round(avg(length(email))) from employees;


select email, length(email) from employees where length(email) >= 5 order by length(email) asc;

/*
4. instr()
- 자바 : indexOf()
- 검색어의 위치를 반환
- number instr(컬럼명, 검색어)
- number instr(컬럼명, 검색어, 시작위치)
- 못찾으면 0을 반환
*/
select '안녕하세요. 홍길동님' from dual;
select instr('안녕하세요. 홍길동님', '홍길동') from dual;
select instr('안녕하세요. 홍길동님. 잘가세요. 홍길동님', '홍길동', 11) from dual;
select instr('안녕하세요. 홍길동님', '아무개') from dual;

select count(*) from tblinsa
    --where name like '%길%';
    where instr(name, '길') > 0;


/*
5. lpad(), rpad()
- left padding, right padding
- varchar2 lpad(컬럼, 갯수, 문자)
*/

select first_name, lpad(first_name, 20, '☆'), rpad(first_name, 20, '☆') from employees;
select lpad('-', 20, '-') from dual;

select name, basicpay, lpad(' ', ceil(basicpay / 1000000) + 1, '☆') as 등급 from tblinsa;


/*
6. trim(), ltrim(), rtrim()
- varchar2 trim(컬럼명)
*/

select '    홍길동    ', trim('    홍길동    '), ltrim('    홍길동    '), rtrim('    홍길동    ') from dual;

-- char vs varchar2
create table tblString
(
    name1 char(50) not null,
    name2 varchar2(50) not null
);

insert into tblString (name1, name2) values ('홍길동', '홍길동');

commit;

select * from tblString;
select * from tblString where name1 = '홍길동'; --char -> char형을 조건절에 사용하면 자동으로 trim() 실행
select * from tblString where name2 = '홍길동'; --varchar2
select * from tblString where name1 = name2;
select length(name1), length(name2) from tblString;


select * from tblString where rtrim(name1) = name2;


/*
7.replace()
- 문자열 치환 함수
- varchar2 replace(컬럼명, 찾을문자열, 바꿀문자열)
*/
select '홍길동', replace('홍길동', '홍', '김') from dual;

select
    last || first as name,
    gender,
    case
        when gender = 'm' then '남자'
        when gender = 'f' then '여자'
    end as gender2,
    replace(replace(gender, 'm', '남자'), 'f', '여자') as gender3
    -- gender.replace("m","남자").replace("f","여자")
from tblname;


select name, 
    replace(replace(replace(replace(replace(continent, 'AS', '아시아'), 'SA', '아메리카'), 'EU', '유럽'), 'AF', '아프리카'), 'AU', '호주')
from tblcountry;

/*
8. decode() ************
- 문자열 치환
- replace() 유사
- varchar2 decode(컬럼명, 찾을문자열, 바꿀문자열 [, 찾을문자열, 바꿀문자열] [, 찾을문자열, 바꿀문자열]...)
- 못찾으면 null 반환(******)
*/
select name, decode(continent, 'AS', '아시아', 'EU', '유럽', 'AF', '아프리카', 'SA', '아메리카', 'AU', '호주') from tblcountry;

--총무부 직원이 몇명?
select count(*) from tblinsa where buseo = '총무부'; --7명

--영업부 직원이 몇명?
select count(*) from tblinsa where buseo = '영업부'; --16명

--홍보부 직원이 몇명?
select count(*) from tblinsa where buseo = '홍보부'; --6명

--위의 3가지 질문과 동일한 질문 + 결과를 1개의 테이블 받고 싶다.
/*
[총무부]       [영업부]       [홍보부]
         7               16                 6
*/
select
    --count(buseo) as "전체",
    count(decode(buseo, '총무부', 1)) as "총무부",
    count(decode(buseo, '영업부', 1)) as "영업부",
    count(decode(buseo, '홍보부', 1)) as "홍보부"
from tblinsa;

select
    --count(buseo) as "전체",
    decode(buseo, '총무부', 1) as "총무부",
    decode(buseo, '영업부', 1) as "영업부",
    decode(buseo, '홍보부', 1) as "홍보부"
from tblinsa;

-- 직원 남자 몇명? 여자 몇명?
select
    count(*) as "전체 직원수",
    count(decode(substr(ssn, 8, 1), '1', '1')) as "남자 직원수",
    count(decode(substr(ssn, 8, 1), '2', '1')) as "여자 직원수"
from tblinsa;

-- tblinsa. '김' 몇명? '이', '박', '정', '최'
select
    count(decode(substr(name, 1, 1), '김', 1)) as "김씨",
    count(decode(substr(name, 1, 1), '이', 1)) as "이씨",
    count(decode(substr(name, 1, 1), '박', 1)) as "박씨",
    count(decode(substr(name, 1, 1), '정', 1)) as "정씨",
    count(decode(substr(name, 1, 1), '최', 1)) as "최씨"
from tblinsa;


/*
nvl, nvl2
- null 함수, null value
- object nvl(컬럼명, 대체값)
- 해당 컬럼이 null이면 대체값을 반환하고, not null이면 원래 컬럼값을 반환한다.
*/

select name, nvl(population, 0) from tblcountry;
select name, nvl(population, 100) + 10 from tblcountry;
select name, nvl(population, '인구수 미기재') from tblcountry;

desc tblinsa;

select name, nvl(tel, '010-1234-5678') from tblinsa;
select name, nvl(tel, '연락처 없음') from tblinsa;



/*
날짜 시간 함수

1. sysdate
- 현재 시각 반환(오라클 서버 시간 - 기준 적합)
- date sysdate

date + number(일) = date
date - number(일) = date
date - date = number(일)


*/
select sysdate from dual;

-- 날짜 연산
-- date + 숫자(일) : 일단위 누적 연산
select sysdate, sysdate + 1 as 내일, sysdate - 1 as 어제 from dual;

select name, ibsadate + 10000 from tblinsa where name = '홍길동';

-- 도서관(대여기간 : 14일)
select 고객명, 대여일, 대여일 + 14 as 반납일 from 도서대출;


-- 시각 - 시각 = 시간(일)
select name, ibsadate, ceil(sysdate - ibsadate) from tblinsa;
select name, ibsadate, ceil((sysdate - ibsadate) / 365)  from tblinsa;


--
select title, ceil(completedate - adddate) from tbltodo;

select title, ceil(nvl(completedate, sysdate) - adddate) from tbltodo
    where ceil(nvl(completedate, sysdate) - adddate) > 7
        order by ceil(nvl(completedate, sysdate) - adddate) desc;



/*
2. last_day
- 해당 시각이 포함된 달의 마지막 날짜
- date last_day(컬럼명)
*/
select last_day(sysdate) from dual;


/*
3. months_between
- number months_between(date, date)
- 시간 간격 계산(단위 : 월, 년)
- 시간 간격 계산(단위 : 일, 시, 분, 초) -> date - date
*/
select
    name,
    ibsadate,
    ceil(sysdate - ibsadate) as "근무일수",
    ceil((sysdate - ibsadate) / 365) as "근무년수", --사용 X
    ceil(months_between(sysdate, ibsadate)) as "근무개월수", --사용 O
    ceil(months_between(sysdate, ibsadate) / 12) as "근무년수" --사용 O
from tblinsa;


/*
4. add_months
- date add_months(date, number)
- 월단위 누적 연산
*/

select sysdate as "오늘", sysdate + 1 as "내일(일)", add_months(sysdate, 1) as "다음달(월)" 
    , add_months(sysdate, 12) as "내년 오늘날짜"
    , add_months(sysdate, -12) as "작년 오늘날짜"
from dual;

/*
시각, 시간 연산
1. date + 숫자(일), date - 숫자(일)
2. date - date = 시간차(일)
3. months_between(date, date) = 시간차(월) : 3번
4. add_months(date, 숫자(월)) : 1번
*/

--p248 ~ p250
































--z