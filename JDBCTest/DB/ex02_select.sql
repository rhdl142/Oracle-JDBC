--ex02_select.sql

/*

SQL은 대소문자를 구분하지 않는다.
1. SQL 키워드는 대문자로 기재
2. 객체 식별자는 소문자로 기재

*/
select * from tabs;
SELECT * FROM tabs;
SELECT * FROM TABS;

/*


오라클 기본 인코딩
1. ~ 8i : EUC-KR
2. 9i ~ 현재 : UTF-8


SQL 자료형
- DBMS에 따라 차이가 심함(서로 호환 안됨)
- 오라클 자료형
- p239

1. 숫자형
    - 정수 + 실수
    a. NUMBER
        - (유효자리) 38자리 이하의 숫자를 표현
        - 20byte
        - number(precision, scale)
            1. precision : 소수 이하를 포함한 전체 자릿수(1 ~ 38자리)
            2. scale : 소수점 이하 자릿수
        ex) number : 38자리까지 표현 가능한 모든 숫자(정수, 실수 포함)
              number(3) : 최대 3자리까지  표현이 가능한 숫자(-999 ~ 999)
              number(4,2) : 최대 4자리까지 표현이 가능한 숫자 + 소수이하 자리까지 포함(-99.99 ~ 99.99)
              number(10,3) : -9999999.999 ~ 9999999.999
        - 숫자형 리터럴 표현
            1. 정수 : 10
            2. 실수 : 3.14
        
        
        

2. 문자형
    - 문자형 + 문자열
    - 자바의 String
    
    a. CHAR, NCHAR
        - 고정 자릿수
        - char(n) : n(1 이상의 정수), n자리 문자열
        - 최대 크기 : 2000바이트
        - 최소 크기 : 1바이트
        ex) char(3) : 3바이트까지 저장할 수 있는 문자열
        ex) char(10) : 영문자(1자 ~ 10자), 한글(1자 ~ 3자)
    
    b. VARCHAR2, NVARCHAR2
        - 가변 자릿수
        - varchar2(n) : n(1 이상의 정수), n자리 문자열
        - 최대 크기 : 4000바이트
        - 최소 크기 : 1바이트
        ex) varchar2(3) : 3바이트까지 저장할 수 있는 문자열
        ex) varchar2(10) : 영문자(1자 ~ 10자), 한글(1자 ~ 3자)
    
    c. N의 유무
        - National 약자 > 유니코드 지원
        - N이 붙은 자료형은 모든 문자를 2바이트로 저장한다.
        - N이 안붙은 자료형은 DBMS의 기본 인코딩으로 저장한다.(UTF-8)
        - 여러가지 문자가 섞여 있을 때 사용
        - nchar(n), nvarchar2(n) : n(문자수)
        
        ex) char(10) > '홍길동' > 9바이트 저장
        ex) nchar(10) > '홍길동' > 6바이트 저장
    

3. 날짜 시간형
    a. DATE
        - 날짜 + 시간 포함
        - Calendar와 유사
        - 7byte
        - 최소 단위 : 초까지
    
    b. TIMESTAMP
        - DATE 버전업
        - 나노초(10-e9) 표현
    
    c. INTERVAL
        - 시간
        - 틱값 저장

4. 대용량 자료형
    a. lob(롭), Large Object
        1. BLOB
        2. CLOB

*/


-- 테이블 생성하기
-- 테이블 = 컬럼의 집합
drop table tblType;

create table tblType (
    --컬럼 정의
    --컬럼명 자료형 제약사항
    --num1 number(4,2)
    --txt nchar(10)
    regdate date
);


-- insert문(행 삽입)
insert into tblType (num1) values (100);
insert into tblType (num1) values (200);
insert into tblType (num1) values (300);
insert into tblType (num1) values (3.14);
insert into tblType (num1) values (-300);
insert into tblType (num1) values (123456789012345678901234566789012345678);

--123456789012345678901234566789012345679000000000000
insert into tblType (num1) values (123456789012345678901234566789012345678901234567890);




insert into tblType (num1) values (1);
insert into tblType (num1) values (10);
insert into tblType (num1) values (100);
insert into tblType (num1) values (1000); --ORA-01438: value larger than specified precision allowed for this column
insert into tblType (num1) values (3.5); --자동으로 정수형 변환(반올림)




-- num1 number
insert into tblType (num1) values (9999);
insert into tblType (num1) values (999);
insert into tblType (num1) values (99);
insert into tblType (num1) values (99.9);
insert into tblType (num1) values (99.99);
insert into tblType (num1) values (99.9999);
insert into tblType (num1) values (99.9899);



-- 오라클의 문자 상수 표현
insert into tblType (txt) values ('abc');
insert into tblType (txt) values ('abcdefghij');
insert into tblType (txt) values ('abcdefghijk'); --ORA-12899: value too large for column "HR"."TBLTYPE"."TXT" (actual: 11, maximum: 10)

insert into tblType (txt) values ('홍길동'); --9바이트
insert into tblType (txt) values ('홍길동님'); --12바이트 




insert into tblType (txt) values ('aaaaaaaaaa'); 
insert into tblType (txt) values ('aaaaaaaaaaa');

insert into tblType (txt) values ('홍길동'); 
insert into tblType (txt) values ('홍길동님'); 
insert into tblType (txt) values ('홍길동님안녕하세요.'); 

insert into tblType (txt) values ('홍길동님안녕하세요..'); 




insert into tblType (regdate) values ('2018-08-21');
insert into tblType (regdate) values (sysdate); 


-- select문
select * from tblType;


-- p240

                                                                                

















