-- ex06_casting.sql
/*

형변환 함수

1. to_char() : 숫자 -> 문자
2. to_char() : 날짜 -> 문자 (***)
3. to_number() : 문자 -> 숫자
4. to_date() : 문자 -> 날짜 (***)


1. to_char() : 숫자 -> 문자
- char to_char(컬럼명, 형식문자열)

형식 문자열 구성 요소
a. 9 : 숫자 1자리를 문자 1개로 바꾸는 역할(모자란 자리는 공백으로 채운다.)
b. 0 : 숫자 1자리를 문자 1개로 바꾸는 역할(모자란 자리는 '0'으로 채운다.)
c. $ : 달러 표시
d. L : 지역별 통화 표시(Locale)
e. . : 소숫점 표시
f. , : 천단위 표시

*/
select 100 as "aaaaaaaaaaaaaaaaaaa.", '100' as "bbbbbbbbbbbbbbbbbbb." from dual;

select to_char(100, '999') from dual; -- 100 -> '100'
select to_char(100, '000') from dual; -- 100 -> '100'

select to_char(10, '999') from dual; -- 10 -> '10'
select to_char(10, '000') from dual; -- 10 -> '10'

select to_char(1, '999') from dual; -- 1 -> '1'
select to_char(1, '000') from dual; -- 1 -> '1'

select to_char(1, '0000000000') from dual;

-- 실인자인 숫자보다 형문자열의 자리수가 더 크면 형변환 불가(####)
select to_char(1000, '999') from dual; -- 1000 -> '1000'
select to_char(1000, '000') from dual; -- 1000 -> '1000'

select 
    weight, 
    weight || 'kg', 
    to_char(weight, '999') || 'kg', 
    to_char(weight, '000') || 'kg',
    lpad(weight, 3, '0') || 'kg'
from tblname;

-- 주의점 : trim() 처리를 해서 쓸모없는 공백을 제거 후 사용하는 것을 권장
select 
    '@' || to_char(-100, '999'),
    '@' || to_char(100, '999')
from dual;

select length(to_char(1, '999')), '@' || ltrim(to_char(1, '999')) from dual;


select to_char(100, '$999') from dual;
select to_char(100, '999원') from dual;
select to_char(100, 'L999') from dual;
select to_char(100, '999') || '원' from dual;


select to_char(123.456, '999.999') from dual;
select to_char(123.456, '9999.99') from dual; --반올림 + 문자열 변환
select to_char(123.456, '9999') from dual; 

--String.format("%,d", 10000000);
select to_char(1000000, '9,999,999') from dual;
select to_char(1000000, '9,9,9,9,9,9,9') from dual;



/*
2. to_char() : 날짜 -> 문자 (**********)
- cahr to_char(컬럼명, '형식 문자열')

형식 문자열 구성 요소
- yyyy
- yy
- month
- mon
- mm
- day
- dy
- ddd, dd, d
- hh(hh12), hh24
- mi
- ss
- am(pm)
*/


--쓰면 안되는 행동(툴의 설정에 따라 결과가 다르게 나온다.) > date형은 문자열을 취급을 하면 안된다.
select substr(sysdate, 1, 10) from dual;
select substr(sysdate, 9, 2) from dual;
select substr(sysdate, 11) from dual;


select sysdate from dual;
select to_char(sysdate, 'yyyy') from dual; -- 2018년(4자리)(********************)
select to_char(sysdate, 'yy') from dual; -- 18년(2자리) X
select to_char(sysdate, 'month') from dual; --8월, 로케일(풀네임)
select to_char(sysdate, 'mon') from dual; --8월, 로케일(약어)
select to_char(sysdate, 'mm') from dual; --08, 2자리 숫자(********************)
select to_char(sysdate, 'day') from dual; --요일, 로케일(풀네임)
select to_char(sysdate, 'dy') from dual; --요일, 로케일(약어)
select to_char(sysdate, 'ddd') from dual; --236. 올해 들어 며칠째인지?
select to_char(sysdate, 'dd') from dual; --24. 이번달 들어 며칠째인지?
select to_char(sysdate, 'd') from dual; --6. 이번주 들어 며칠째인지? > 요일(1~7)
select to_char(sysdate, 'hh') from dual; --11. 시간(12시간)
select to_char(sysdate, 'hh24') from dual; --11. 시간(24시간) (**********)
select to_char(sysdate, 'mi') from dual; --02. 분
select to_char(sysdate, 'ss') from dual; --44. 초
select to_char(sysdate, 'am') from dual; --오전/오후
select to_char(sysdate, 'pm') from dual; --오전/오후

select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'hh24:mi:ss') from dual;
select to_char(sysdate, 'am hh:mi:ss') from dual;


--조건절에 사용
-- 12월에 입사한 직원은?
select * from tblinsa where to_char(ibsadate, 'mm') = '12';

-- 토요일에 등록한 할일은?
select title, to_char(adddate, 'day') from tbltodo where to_char(adddate, 'd') = '7';

--정렬(입사 월)
select * from tblinsa order by to_char(ibsadate, 'mm') asc;


-- 주의!!!!!
-- 1997년 ~ 1999년 사이에 입사한 직원?
select * from tblinsa
        --where ibsadate between '1997-01-01' and '1999-12-31'; --손실분 발생 
        --where ibsadate between '1997-01-01' and '2000-01-01'; --과잉분 발생
        --where ibsadate between '1997-01-01 00:00:00' and '1999-12-31 23:59:59'; --사용 불가능
        where to_char(ibsadate, 'yyyy') between 1997 and 1999;



/*
3. to_number() : 문자 -> 숫자
- number to_number(문자열)
- 자바 : Integer.parseInt(문자열)
*/

select to_number('123') * 2 from dual;
select '123' * 2 from dual; -- "123" * 2


/*
4. to_date() : 문자 -> 날짜 (***)
- date to_date(컬럼명, '형식 문자열')
- 형식 문자열이 2번과 동일
*/

--SQL은 날짜시간 데이터의 리터럴은 문맥에 따라 문자열 or 날짜시간 중 선택
select '2018-08-24', sysdate from dual; --문자열
select * from tblinsa where ibsadate > '2018-08-24'; --날짜시간

select to_date('2018-08-24', 'yyyy-mm-dd'), sysdate from dual; --******* 
select to_date('2018-08-24 11:37:40', 'yyyy-mm-dd hh24:mi:ss'), sysdate from dual; --*******






























