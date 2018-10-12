-- ex08_sequence.sql
/*

시퀀스, Sequence
- 시퀀스 객체
- DB Object 중 하나
- DB 개발자에게 식별자들을 관리하기 편하도록 기능 제공
- 시퀀스의 역할은 중복되지 않은 유일한 숫자를 반환하는데 있다. 중간에 건너뛰는 숫자에 연연해 하지 말것(*****). 
- 절대로 중간에 비어있는 숫자가 존재 않아야 한다면 시퀀스 객체를 사용하지 말것 -> 직접 개발자가 관리할 것

시퀀스 객체 사용하기
1. create : 생성
2. alter : 수정
3. drop : 삭제

시퀀스 객체 생성하기
- create sequence 시퀀스명;
- create sequence 테이블명(컬럼명)식별자;

시퀀스 객체 사용하기
1. testSeq.nextval : 1 증가된 다음 일련 번호 반환(Queue.poll())
2. testSeq.currval : 증가 시키지 않은 현재 일련 번호 반환(Queue.peek())

*/
create sequence testSeq; --시퀀스 객체는 특정 테이블에 종속적이지 않다.(주로 테이블과 연관지어 사용은 한다.)

select testSeq.nextval from dual;
select testSeq.currval from dual;

drop sequence testSeq;

--메모장
drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    name varchar2(20) not null,
    memo varchar2(1000) not null
);

create sequence memoSeq;

insert into tblMemo (seq, name, memo) values (1, '홍길동', '메모입니다.');
insert into tblMemo (seq, name, memo) values (memoSeq.nextval, '홍길동', '메모입니다.');
insert into tblMemo (seq, name, memo) values (memoSeq.nextval, '홍길동', null);

select * from tblMemo;

select memoSeq.currval from tblMemo;
select memoSeq.currval from dual;
select memoSeq.nextval from dual;


-- 테이블의 식별자
-- 1. 숫자
-- 2. 문자열

-- 상품 테이블
-- : 상품코드, 상품명, 가격, 수량
-- : 상품코드(PK) -> 1, 2, 3, 4, 5..
-- : 상품코드(PK) -> 'AAA01', 'AAB02', 'ABC05'...
create table tblProduct
(
    code varchar2(5) primary key,   --상품코드
    name varchar2(100) not null,    --상품명
    price number not null, --가격
    qty number not null --수량
);

create sequence productSeq;

select 'AA' || ltrim(to_char(productSeq.nextval, '000')) from dual;

insert into tblProduct (code, name, price, qty)
    values ('AA' || ltrim(to_char(productSeq.nextval, '000')), '상품명', 1000, 10);

select * from tblProduct;


-- 시퀀스 객체 초기화(1부터 다시 시작하도록)
drop sequence productSeq;
create sequence productSeq;

select productSeq.nextval from dual;


-- 시퀀스 객체는 일련 번호를 초기화할 수 있는 도구가 없음.
-- > 대신 시퀀스 객체를 새로 생성할 때 여러가지 초기값들을 대입

drop sequence productSeq;

-- 원하는 방식의 시퀀스를 만드는 방법
create sequence productSeq; --기본형(가장 많이 사용)
create sequence productSeq 옵션 옵션 옵션 옵션 옵션; --사용자 정의형

drop sequence productSeq;
create sequence productSeq
        --increment by 1 --증감치(양수/음수 모두 사용 가능) ****
        --start with 10 --시작값(seed) ****
        --maxvalue 20 --최댓값(넘으면 에러 발생)
        --minvalue 10
        --cycle
        cache 20 --눈에 보이는 제어(X)
        ;

select productSeq.nextval from dual;


show user;















