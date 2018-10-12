-- ex18_transaction.sql
/*

트랜잭션, Transaction
- 오라클(DBMS)에서 발생하는 1개 이상의 명령어(SQL)들을 하나의 논리 집합으로 묶어 놓은 단위 -> 제어(통제)
- 트랜잭션에 의해서 관리되는 명령어 : DML만 포함된다.(insert, update, delete). 데이터에 조작을 가하는 명령어.

트랜잭션 관리
- DCL의 한 종류
1. commit
2. rollback
3. savepoint

트랜잭션의 제어
- 하나의 트랜잭션으로 묶여있는 모든 명령어 대상 > 모든 명령어가 성공하면 트랜잭션 성공, 일부 명령어가 실패하면 트랜잭션 실패



1. 새 트랜잭션이 시작하는 경우
    a. 클라이언트가 접속한 직 후
    b. commit 명령어를 실행한 직 후
    c. rollback 명령어를 실행한 직 후
    d. ddl, dcl 명령어를 실행한 직 후

2. 현재 트랜잭션이 종료하는 경우
    a. 클라이언트가 접속을 종료한 직 후
    b. commit 명령어를 실행한 직 후
    c. rollback 명령어를 실행한 직 후
    d. ddl, dcl 명령어를 실행한 직 후(Auto Commit)

c. 자동 커밋, Auto Commit
    - ddl, dcl 명령어에 의해서 현재 트랜잭션이 종료되는 현상
    - 조심!!!!!!!!!!!

d. Auto Commit
    - 툴의 자동 커밋 기능
    - 모든 insert, update, delete를 각각 실행할 때마다 commit 바로 이어서 실행
    - rollback 불가능
    


*/

drop table 서울시;

create table 서울시
as
select * from tblInsa where city = '서울';


select * from 서울시; --20명

delete from 서울시 where name = '홍길동';

commit;

delete from 서울시 where name = '유관순';
update 서울시 set jikwi = '대리' where name = '유관순';


rollback;


create table tblTest2
(
    seq number primary key
);


commit;

select * from 서울시;

delete from 서울시 where name = '김말자';

savepoint a;

delete from 서울시 where name = '우재옥';

savepoint b;

delete from 서울시 where name = '김영길';

select * from 서울시;

-- commit or rollback ?
rollback; --트랜잭션 취소
rollback to a;

-- 처음 : commit, rollback
-- 나중 : savepoint

























