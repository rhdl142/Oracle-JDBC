-- ex07_ddl.sql
/*
DML
- 데이터 조작어(select, insert, update, delete)
- select(DQL : Data Query Language)

DDL
- 데이터 정의어
- 객체(DB Object)를 생성한다.
- DB Object : 테이블, 뷰, 인덱스, 트리거, 프로시저, 제약사항 등..
- create, alter, drop


테이블 생성하기(= 텍스트 파일 구조 만들기)

create table 테이블명
(
    컬럼 정의,
    컬럼 정의,
    컬럼 정의,
    컬럼명 자료형(길이) NULL표기 제약사항
);

*/

create table tblTest
(
    num number(3),
    txt varchar2(10),
    regdate date
);

select * from tblTest;

insert into tblTest (num, txt, regdate) values (100, '홍길동', '2018-08-20');
insert into tblTest (num, txt, regdate) values (200, '아무개', sysdate);


/*

컬럼명 자료형(길이) NULL표기 제약사항

제약 사항, Constraint
- 해당 컬럼값에 대한 조건(규제) > 조건을 만족하지 못하면 데이터를 못 넣는다. > 유효성 검사
- 데이터베이스 무결성 보장(Integrity Constraint Rule - 무결성 제약 조건)

1. not null
- 반드시 값을 가져야 한다.(필수값)
*/

--메모 테이블
create table tblMemo
(
    seq number not null,    -- 메모번호 + 필수입력값(Required)
    name varchar2(20) null,     --작성자 + 선택입력값(Optional)
    memo varchar2(1000) not null,   --메모내용 + 필수
    regdate date null   --작성시간 + 선택
);

insert into tblMemo (seq, name, memo, regdate) values (1, '홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (2, null, '메모입니다.', null);

--ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."MEMO")
insert into tblMemo (seq, name, memo, regdate) values (3, '홍길동', null, sysdate);


select * from tblMemo;


/*
1. not null

2. primary key(PK)
- 기본키
- 키(key) : 컬럼
- 테이블 내에서 모든 컬럼들 중에 대표가 되는 컬럼 > 행과 행을 구분하는 수단으로 사용
- 테이블 내에서 행을 구분하기 위한 고유 식별자
- 1개의 테이블내에는 반드시 PK가 존재해야 한다.
- PK는 보통 1개의 컬럼으로 구성 + 가끔씩 2개의 컬럼으로 PK를 구성하는 경우도 있음(복합키, Composite Key)
- PK는 따로 명시하지 않아도 자동으로 not null이 적용된다.
- PK는 따로 명시하지 않아도 Duplicate가 적용된다 > unique가 적용된다. = 중복값을 가질 수 없다.
- PK = NOT NULL + UNIQUE
*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key, --테이블의 행 구분 고유 식별자 + not null + 중복불가 
    name varchar2(20) null,
    memo varchar2(1000) not null,
    regdate date null
);

insert into tblMemo (seq, name, memo, regdate) values (1, '홍길동', '메모입니다.', sysdate);

-- ORA-00001: unique constraint (HR.SYS_C007186) violated
insert into tblMemo (seq, name, memo, regdate) values (1, '아무개', '테스트중입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (2, '아무개', '테스트중입니다.', sysdate);

-- ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."SEQ")
insert into tblMemo (seq, name, memo, regdate) values (null, '호호호', '테스트중입니다.', sysdate);


select * from tblMemo;


/*
3. unique
- 해당 컬럼값이 테이블내에서 유일값이어야 한다.(중복값이 존재해서는 안된다.)
- PK와 유사
- null을 가질 수 있다.
- 절대로 unique 식별자로 사용하면 안된다.(null이 있어서)
*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    name varchar2(20) unique,
    memo varchar2(1000) not null,
    regdate date null
);

insert into tblMemo (seq, name, memo, regdate) values (1, '홍길동', '테스트중입니다.', sysdate);

--ORA-00001: unique constraint (HR.SYS_C007189) violated
insert into tblMemo (seq, name, memo, regdate) values (2, '홍길동', '테스트2222중입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (2, null, '테스트2222중입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (3, null, '테스트2222중입니다.', sysdate);

select * from tblMemo;


/*
4. check
- 열거형, 범위 비교 등의 제약(사용자 정의형)
- where절 조건과 유사
*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    name varchar2(20) not null,
    memo varchar2(1000) not null,
    --regdate date not null,
    --color varchar2(30) not null, --red, yellow, blue
    --page number not null --1 ~ 9
    --color varchar2(30) check(color = 'red' or color = 'yellow' or color = 'blue') not null,
    color varchar2(30) check(color in ('red', 'yellow', 'blue')) not null,
    --page number check(page >=1 and page <=9) not null
    page number check(page between 1 and 9) not null,
    --regdate date check(regdate between to_date('2018-01-01', 'yyyy-mm-dd') 
    --                                                            and to_date('2018-12-31', 'yyyy-mm-dd')) not null    
    --regdate date check(to_char(regdate, 'hh24') between 0 and 11) not null --오전에만 메모 작성 가능
    regdate date check(to_char(regdate, 'd') between 2 and 6) not null --평일에만 작성 가능
);

insert into tblMemo (seq, name, memo, regdate, color, page) 
        values (1, '홍길동', '테스트중입니다.', sysdate, 'red', 3);

--ORA-02290: check constraint (HR.SYS_C007201) violated
--ORA-02290: check constraint (HR.SYS_C007202) violated
insert into tblMemo (seq, name, memo, regdate, color, page) 
        values (2, '홍길동', '테스트중입니다.2222', sysdate, 'red', 1);

select * from tblMemo;


/*
5. default
- 컬럼 기본값
- 해당 컬럼값에 값을 넣지 않으면 null을 입력하는 대신 자동으로 미리 준비된 기본값을 넣는다. 
*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    name varchar2(20) default '익명' null,
    memo varchar2(1000) not null,
    regdate date not null
);

insert into tblMemo (seq, name, memo, regdate)  values (1, '홍길동', '테스트중입니다', sysdate);
insert into tblMemo (seq, memo, regdate)  values (2, '테스트중입니다', sysdate);

select * from tblMemo;



drop table tblMemo;

create table tblMemo
(
    seq number primary key, --메모번호(PK)
    name varchar2(30) not null, --필수값
    memo varchar2(1000) check(length(memo) > 10) not null, --체크제약
    regdate date default sysdate not null, --기본값
    color varchar2(10) unique null --중복값 허용 안함(null은 제외)
);

insert into tblMemo (seq, name, memo, regdate, color)
    values (1, '홍길동', '안녕하세요. 홍길동입니다.', sysdate, 'red');

insert into tblMemo (seq, name, memo, regdate, color)
    values (2, '홍길동', '테스트', sysdate, 'yellow'); --ORA-02290: check constraint (HR.SYS_C007219) violated
insert into tblMemo (seq, name, memo, regdate, color)
    values (2, '홍길동', '테스트테스트테스트테스', sysdate, 'yellow');

insert into tblMemo (seq, name, memo, regdate, color)
    values (3, '홍길동', '테스트테스트테스트테스', sysdate, 'yellow');--ORA-00001: unique constraint (HR.SYS_C007221) violated

insert into tblMemo (seq, name, memo, regdate, color)
    values (3, '홍길동', '테스트테스트테스트테스', sysdate, null);
    
insert into tblMemo (seq, name, memo, regdate, color)
    values (4, '홍길동', '테스트테스트테스트테스', null, null);

select * from tblMemo;


/*
제약 사항을 만드는 방법

1. 컬럼 수준에서 만드는 방법(여태 수업했던 방법)
    - 컬럼을 정의할 때 같이 제약을 추가하는 방법
    - 1 : 1 제약(컬럼 1개 : 제약 1개)
    - 컬럼명 자료형 제약사항
    - 컬럼명 자료형 [constraint 제약명] 제약사항

2. 테이블 수준에서 만드는 방법
    - pk, fk, check, uq : 가능
    - nn, default : 불가능
    a. create
    b. alter //X

*/
drop table tblMemo;

create table tblMemo
(
    --seq number primary key
    --seq number constraint aaa primary key
    seq number constraint tblmemo_seq_pk primary key, --테이블명_컬럼명_제약사항종류
    memo varchar2(1000) 
        constraint tblmemo_memo_ck  --30바이트 안넘어가게 주의(****)
            check(length(memo) > 10) 
        not null
);

--ORA-00001: unique constraint (HR.AAA) violated
--ORA-00001: unique constraint (HR.TBLMEMO_SEQ_PK) violated
--ORA-00001: unique constraint (HR.SYS_C007224) violated
insert into tblMemo (seq) values (1); 

--ORA-02290: check constraint (HR.TBLMEMO_MEMO_CK) violated
insert into tblMemo (seq, memo) values (1, '세글자'); 


drop table tblMemo;

-- 테이블 수준에서 제약사항 추가하기
create table tblMemo
(
    seq number,
    memo varchar2(1000) not null,
    color varchar2(30),
    page number(1),
    
    -------------------- 순수한 컬럼 정의
    -------------------- 제약사항만을 따로 정의(테이블 수준)
    -- 가독성(관련된 코드끼리 구분)
    -- not null은 컬럼수준에서밖에 정의를 못한다.(테이블 수준에서는 불가능)
    constraint tblmemo_seq_pk primary key(seq),
    constraint tblmemo_color_ck check(color in ('white', 'black')),
    constraint tblmemo_page_ck check(page between 1 and 9)
    
    --constraint tblmemo_regdate_default default(regdate) sysdate --X
    --constraint tblmemo_seq_uq unique(color),
);



drop table tblMemo;

create table tblMemo
(
    seq number constraint tblmemo_seq_pk primary key, 
    memo varchar2(1000) 
        constraint tblmemo_memo_ck  
            check(seq between 1 and 10) 
        not null --attempted to define a column check constraint that references another column.
);





















