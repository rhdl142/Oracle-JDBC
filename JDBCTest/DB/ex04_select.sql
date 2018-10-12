-- ex04_select.sql

/*

select 절 : 일부 컬럼 반환
from 절 : 모든 데이터 반환
where 절 : 일부 레코드 반환

실행 순서 : from > where > select

where 절
- select * from 테이블 where 절;
- 조건을 제시한 뒤 조건을 만족하는 레코드만을 가져오는 역할(일부 레코드 반환)
- 주로 컬럼값을 대상으로 비교 연산 or 논리 연산을 통해 해당 레코드를 가져올 지 판단

*/

select * from tblname; --모든 컬럼 + 모든 레코드
select first, last from tblname; --일부 컬럼 + 모든 레코드
select * from tblname where gender = 'f'; --모든 컬럼 + 일부 레코드

select first, last from tblname where gender = 'f'; --일부 컬럼 + 일부 레코드

--결과 테이블, Result Table, 결과셋, ResultSet
select first, last --3. 2번으로부터 받은 결과 테이블에 원하는 컬럼만 취한 뒤 최종 결과 테이블 반환한다.
    from tblname -- 1. 테이블 원본을 취한다. 
        where gender = 'f'; --2. 조건을 만족하는 레코드만 존재하는 테이블을 취한다.

select first, last, weight from tblname where weight > 70;
select first, last, weight from tblname where weight > 70 and weight < 100;
select first, last, weight from tblname where weight > 70 and weight < 100 and gender = 'm';


-- 등호(=)
select * from tblinsa;
desc tblinsa;

select * from tblinsa where buseo = '인사부';
select * from tblinsa where jikwi = '부장';
select * from tblinsa where ibsadate = '1998-10-11'; --권장
select * from tblinsa where ibsadate = '98/10/11'; --비권장

-- RRRR-MM-DD HH24:MI:SS

--보너스
-- : 주로 where은 컬럼값을 사용한 조건을 사용한다.
select * from tblname where height > 170;
select * from tblname where 1 = 1; --컬럼값 사용X

--로그인 > SQL Injection
--암호 : 1111
--암호 : 1111' or 1=1;--
select 특정결과 from 회원테이블 where id='hong' and pw='1111' or 1=1;--';



/*

비교 연산에 사용되는 자료형
1. 숫자형
2. 문자형 -> str1.compareTo(str2) : 문자 코드값 비교
3. 날짜 시간형 -> tick값

*/
select * from tblname where height > 160;
select * from tblname where last > '마';
select * from tblname where first < '재석';
select * from tblinsa where ibsadate >= '1999-08-01';


-- where 절과 관계된 구문들..
/*

between
- where 절에서 사용(조건으로 사용)
- 범위 조건 지정
- 컬럼명 between 최솟값 and 최댓값
- 가독성 향상
- 최솟값(inclusive), 최댓값(inclusive)
- between 사용 자제 > 비교(연산) 연산자 사용 속도보다 느리다. > 쓰세요.

*/

--몸무게 60이상 ~ 80이하
select * from tblname where weight >= 60 and weight <= 80;
select * from tblname where weight between 64 and 66;

select * from tblname where first between '마' and '이';

select * from employees where first_name between 'D' and 'G';

select * from tblinsa where ibsadate between '1998-01-01' and '1998-12-31';

select * from tblinsa where not ibsadate between '1998-01-01' and '1998-12-31';



/*

in
- where 절에서 사용(조건으로 사용)
- 열거형 조건 비교(제시값 중에서 하나라도 만족하면 만족) 
- 컬럼명 in (열거형 값)

*/
select * from tabs;
select * from tbldiary;

-- 날씨가 '흐림' or '비' 내용..
select * from tbldiary where weather = '흐림' or weather = '비' or weather = '안개' or weather = '폭우';
select * from tbldiary where weather in ('흐림','비','안개','폭우');

-- tblinsa > '기획부', '영업부', '총무부'
-- + '부장', '과장' + '서울', '인천'
-- + 급여 250만원 ~ 300만원
select * from tblinsa 
        where buseo in ('기획부','영업부','총무부') 
                and jikwi in ('부장','과장') 
                and city in ('서울','인천')
                and basicpay between 2500000 and 3000000;


/*

like
- where 절에서 사용(조건으로 사용)
- 패턴 비교(특정한 패턴을 가지는 문자열 검색)
- 문자형을 대상으로 사용(숫자, 날짜 적용X)
- 정규 표현식과 유사
- 컬럼명 like '패턴 문자열'

패턴 문자열 구성 요소
1. _ : 임의의 문자 1개
2. % : 임의의 문자 0개 ~ 무한대

*/
select * from tblinsa;
select * from tblinsa where name like '박__';
select * from tblinsa where name like '_길_';
select * from tblinsa where name like '__동';

select * from employees where first_name like 'D____';
select * from employees where first_name like 'D_v__';

select * from employees where first_name like 'D%';
select * from employees where first_name like '%d';
select * from employees where first_name like '%d%'; --사용 빈도 높음.    


/*

null
- 자바의 null 유사한 표현
- 비어있는 컬럼의 상태
- SQL은 null은 연산의 대상이 될 수 없다.(피연산자 자격X)
- SQL은 null이 포함된 연산을 하면 항상 결과가 null 반환

null 조건
- where 절에서 사용
- 컬럼명 is null

*/
select * from tblcountry;

--인구수가 아직 기재되지 않은 나라는?
select * from tblcountry where population = null;
select * from tblcountry where population is null;

--인구수가 아직 기재된 나라는?
select * from tblcountry where not population is null;
select * from tblcountry where population is not null;

--tblinsa. 연락처가 안적힌 직원?
select name, tel from tblinsa where tel is null;

--도서관. 대여테이블(대출일, 반납일)
--아직 반납하지 않은 도서는?
select * from 대여테이블 where 반납일 is null;

-- 아직 하지 않은 일들?
select * from tbltodo where completedate is null;

--이미 완료한 일들?
select * from tbltodo where completedate is not null;




/*

distinct
- 컬럼 리스트에서 사용
- distinct 컬럼명
- 중복값 제거
- null도 데이터의 한 종류로 인식한다 -> null 가지는 레코드들도 중복값 제거가 된다.

*/
select distinct continent from tblcountry;

-- tblcountry에는 어떤 대륙들이 있습니까?
-- tblinsa에는 어떤 부서가 있습니까?
select distinct buseo from tblinsa;

-- 성별이 뭐가 있는지?
select distinct gender from tblname;

-- tblinsa 직위가 어떻게 됩니까?
select distinct jikwi from tblinsa;

-- tblname 성이 뭐뭐?
select distinct last from tblname;

select distinct first from tblname;

select distinct population from tblcountry where population is not null;


-- distinct는 컬럼리스트에 딱 1번만 적을 수 있다.
-- distinct 키위드 뒤의 모든 컬럼 리스트를 합쳐서 중복값 검사를 한다.
select distinct price, qty from tblhousekeeping;
select distinct price from tblhousekeeping;



/*

case
- 컬럼 리스트에서 사용
- 조건절에서 사용
- 사용 횟수 자유
- 자바 : if + switch 문

*/

select last || first as name, gender from tblname;

select last || first as name, case when gender = 'm' then '남자' when gender = 'f' then '여자' end from tblname;

select last || first as name, 
    case 
        when gender = 'm' then '남자' 
        when gender = 'f' then '여자' 
    end as gender
from tblname;

select  
    name,
    case
        when continent = 'AS' then '아시아'
        when continent = 'EU' then '유럽'
        when continent = 'AF' then '아프리카'
        --else '기타'
        else continent
    end as 대륙
from tblcountry;


select 
    last || first as name, 
    weight / (height * height) * 10000 as bmi,
    case
        when weight > 80 then '과체중'
        when weight > 60 then '정상체중'
        when weight > 0 then '저체중'
        else '미정'
    end as 체중상태
from tblname;

select * from tblmen;
select * from tblwomen;

-- 솔로인 남자만 가져오기
select * from tblmen where couple is null;

-- 솔로인지? 커플인지? 남자 명단 가져오기
select name, 
    case
        when couple is not null then '여자친구 있음'
        when couple is null then '여자친구 없음'
    end as 짝궁
from tblmen;


-- tblinsa. 급여 -> 부장(과장)은 sudang * 2 배 지급
select name, jikwi, basicpay, sudang,
    case
        when jikwi = '부장' then sudang * 2
        when jikwi = '과장' then sudang * 2
        else sudang
    end as "이번달 지급 수당"
from tblinsa;


-- 완료된 일 vs 진행중 일 : 구분
select 
    title,
    case
        when completedate is not null then '완료됨'
        when completedate is null then '진행중'
    end as "완료유무"
from tbltodo;


/*

실행 순서 : from > where > select > order by 

정렬, Sorting
- 결과셋의 레코드의 순서를 정렬(원본 테이블과는 무관하다.)
- 원본 테이블의 레코드 순서는 DBMS가 알아서 한다.(신경X)
- order by 절
- order by 컬럼명 [asc|desc]
- select문에서만 사용 가능(insert, update 등은.. 적용 불가)
- select 컬럼리스트 from 테이블명 where 절 order by 절
- asc : 오름차순(ascending)
    a. 숫자 : 10 -> 20 -> 30
    b. 문자 : '가' -> '나' -> '다'
    c. 날짜시간 : '2016' -> '2017' -> '2018'
    
- desc : 내림차순(descending)
*/
select * from tblname order by first asc;
select * from tblname order by weight desc;

select * from tblinsa order by ibsadate desc;

select * from tblinsa order by city, buseo asc, jikwi desc, name asc, basicpay desc;

-- 연산의 결과나 함수의 반환값이 정렬의 기준이 될 수 있다.
select name, basicpay, sudang from tblinsa order by (basicpay + sudang) desc;

select name, basicpay, sudang 
from tblinsa 
where buseo='영업부' 
order by (basicpay + sudang) desc;


select name --3.
from tblinsa --1. 
where buseo='영업부' --2. 
order by (basicpay + sudang) desc; --4










