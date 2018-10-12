-- ex09_insert.sql
/*

insert 문
- DML(insert, update, delete)
- insert into 테이블명 (컬럼리스트) values (값리스트);

*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key, --메모번호(PK)
    name varchar2(30) not null, --작성자
    memo varchar2(1000) not null, --메모내용
    regdate date default sysdate not null, --날짜
    etc varchar2(500) default '비고없음' null, --비고
    page number null --페이지수
);

--ORA-08002: sequence MEMOSEQ.CURRVAL is not yet defined in this session
--select memoSeq.currval from dual; -> select max(seq) from tblMemo;
--select memoSeq.nextval from dual;


-- insert 문 사용할 때 여러가지 패턴

-- 1. 표준 : 원본 테이블의 정의된 컬럼 순서대로 컬럼리스트와 값리스트를 표기하는 방법
insert into tblMemo (seq, name, memo, regdate, etc, page)
        values (memoSeq.nextval, '홍길동', '메모입니다.', sysdate, '비고', 1);


-- ORA-01841: (full) year must be between -4713 and +9999, and not be 0
-- 반드시 컬럼리스트의 순서와 값리스트의 순서는 동일해야 한다.
insert into tblMemo (name, memo, regdate, etc, page, seq)
        values (memoSeq.nextval, '홍길동', '메모입니다.', sysdate, '비고', 1);


-- insert 문을 작성할 때 원본 테이블의 컬럼리스트 순서와는 상관없다.
insert into tblMemo (name, memo, regdate, etc, page, seq)
        values ('홍길동', '메모입니다.', sysdate, '비고', 1, memoSeq.nextval);


--00947. 00000 -  "not enough values"
insert into tblMemo (seq, name, memo, regdate, etc, page) --컬럼 리스트 6개
        values (memoSeq.nextval, '홍길동', '메모입니다.', sysdate, '비고'); --값 리스트 5개
        
        
--00913. 00000 -  "too many values"
insert into tblMemo (seq, name, memo, regdate, etc) --컬럼 리스트 5개
        values (memoSeq.nextval, '홍길동', '메모입니다.', sysdate, '비고', 1); --값 리스트 6개


-- null 제약을 가진 컬럼값 입력하기(= 특정 컬럼에 null을 대입하기)
insert into tblMemo (seq, name, memo, regdate, etc)
        values (memoSeq.nextval, '홍길동', '메모입니다.', sysdate, '비고'); --null을 넣고 싶은 컬럼을 아예 제거
        
insert into tblMemo (seq, name, memo, regdate, etc, page)
        values (memoSeq.nextval, '홍길동', '메모입니다.', sysdate, '비고', null); --null 상수 대입하기 


-- default 제약 사용하기
-- default 제약이 걸린 컬럼에 null을 넣었더니 default값이 대신 대입된다.
insert into tblMemo (seq, name, memo, regdate, page) 
        values (memoSeq.nextval, '홍길동', '메모입니다.', sysdate, 1); --생략을 사용해서 null 대입

-- null 상수를 직접 넣는 경우에는 default 제약이 동작하지 않는다.
insert into tblMemo (seq, name, memo, regdate, etc, page) 
        values (memoSeq.nextval, '홍길동', '메모입니다.', sysdate, null, 1); --null 상수를 사용해서 null 대입


-- default 제약 + not null 제약이 동시에 걸린 컬럼은 생략한 표현을 사용할 수 있다.
insert into tblMemo (seq, name, memo, etc, page) 
        values (memoSeq.nextval, '홍길동', '메모입니다.', '비고', 1);

insert into tblMemo (seq, name, memo, regdate, etc, page) 
        values (memoSeq.nextval, '홍길동', '메모입니다.', null, '비고', 1); --not null 위반


-- 컬럼 리스트 생략
insert into tblMemo values (memoSeq.nextval, '홍길동', '메모입니다.', sysdate, '비고', 1);


-- 컬럼 리스트 생략은 테이블을 선언할 당시의 컬럼 순서를 참조한다. -> 반드시 값 리스트가 원본 테이블의 컬럼 순서와 동일
insert into tblMemo values ('홍길동', '메모입니다.', sysdate, '비고', 1, memoSeq.nextval);

-- 00947. 00000 -  "not enough values"
insert into tblMemo values (memoSeq.nextval, '홍길동', '메모입니다.', '비고', 1);
insert into tblMemo values (memoSeq.nextval, '홍길동', '메모입니다.', default, '비고', 1);


insert into tblMemo values (memoSeq.nextval, '홍길동', '메모입니다.', default, default, 1);

insert into tblMemo values (memoSeq.nextval, '홍길동', '메모입니다.', default, default, null);

select * from tblMemo;

-------------------------------------------- 일반적인 insert

-------------------------------------------- 일반적이지 않은 insert


drop table tblMemoCopy;

create table tblMemoCopy
(
    seq number primary key, --메모번호(PK)
    name varchar2(30) not null, --작성자
    memo varchar2(1000) not null, --메모내용
    regdate date default sysdate not null, --날짜
    etc varchar2(500) default '비고없음' null, --비고
    page number null --페이지수
);

-- tblMemo -> (복사) -> tblMemoCopy
insert into tblMemoCopy 
    select * from tblMemo; -- insert + 서브쿼리


insert into tblMemoCopy 
    select * from tblMemo where mod(seq, 2) = 0;

select * from tblMemoCopy;


-- 영업부 직원 테이블

insert into 영업부
    select * from tblinsa where buseo = '영업부';

create table 영업부
as
select * from tblinsa where buseo = '영업부';

select * from 영업부;

-- insert + select
-- : 테이블 별도 제작(제약 사항 추가)
-- : 순수한 데이터만 복사
-- : 업무용 O + 개발자 테스트용 O

-- create table + select
-- : 테이블 자동 생성 + 데이터 복사
-- : 원본 테이블의 제약 사항은 복사가 안된다.(컬럼명 + 자료형)
-- : 업무용 X + 개발자 테스트용 O











