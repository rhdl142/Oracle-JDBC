-- ex14_view.sql
/*

뷰, View
- DB Object 중 하나(테이블, 시퀀스, 뷰)
- 가상 테이블
- 진짜 테이블의 복사본 -> 복사 테이블, 뷰 테이블, 가상 테이블..
- 테이블처럼 취급하는 객체(***)

뷰 관리
1. create
2. drop

*/

-- 뷰생성
create view vwInsa --머리
as --목
select * from tblInsa; --몸통(*****)

--복사 테이블 생성
create table copyInsa
as
select * from tblInsa;

-- 뷰사용
select * from vwInsa; --구조 생성?, 데이터 insert?
select * from copyInsa; --복사된 테이블

select * from vwInsa where buseo = '기획부'; --구조 생성?, 데이터 insert?
select * from copyInsa where buseo = '기획부'; --복사된 테이블


--직원 정보 : (영업부 & 기획부) + 남자직원 x 1년 내내 + 하루 수십번
select * from tblInsa 
    where buseo in ('영업부', '기획') and substr(ssn, 8, 1) = '1';


-- 뷰의 특징
-- 1. 자주 반복하는 쿼리를 간단하게 줄일 수 있다.
-- 2. 
--  a. 복사 테이블 : 원본 테이블의 깊은 복사. 완전 복사본 만들어서 분리시킨다. 원본 테이블 수정 > 복사 테이블 반영 X
--  b. 뷰 : 원본 테이블의 얕은 복사. 뷰는 데이터 저장 객체가 아닌 SQL 저장 객체. 원본 테이블 수정 > 뷰 반영 O
-- 3. 뷰는 주로 원본 테이블과는 독립적으로 업무에 필요한 임시 테이블이 필요할 때 만들어서 사용한다.
-- 4. 사용 형태
--  a. 자주 반복되는 질의를 저장
--  b. 반복과 상관없이 해당 질의에 의미를 부여해서 가독성을 높이고 싶을 때
--  c. 보안 : 권한 중 하나 > 자원(테이블,뷰)에 대한 접근 권한

select * from tblInsa;
select * from tblInsa where buseo = '기획부';

create view 기획부
as
select * from tblInsa where buseo = '기획부';

create view 평사원
as
select * from tblInsa where jikwi = '사원';

create view vwSub
as
select * from tblInsa 
    where buseo in ('영업부', '기획') and substr(ssn, 8, 1) = '1';


select * from vwSub;

select * from tblInsa where buseo = '기획부';
delete from tblInsa where num in (1024, 1031, 1034);

commit;




create view vwRet
as
select 
    m.name as 회원명,
    v.name as 비디오제목,
    to_char(r.rentdate, 'yyyy-mm-dd') as 대여날짜,
    case
        when r.retdate is null then '미반납'
        when r.retdate is not null then '반납완료'
    end as 반납유무,
    case
        when r.retdate is null then round(sysdate - (r.rentdate + g.period))
        when r.retdate is not null then null
    end as 연체기간,
    
    case
        when r.retdate is null 
            then round(sysdate - (r.rentdate + g.period)) * (g.price * 0.05)
        when r.retdate is not null then null
    end as 연체료
    
from tblVideo v
    inner join tblGenre g
        on g.seq = v.genre
            inner join tblRent r
                on v.seq = r.video
                    inner join tblMember m
                        on m.seq = r.member;



-- 출근 : 평상 업무
select * from vwRet;







--전체 직원 목록
select * from tblInsa;

--부장 목록
select * from tblInsa where jikwi = '부장';

create view vw부장
as
select * from tblInsa where jikwi = '부장';

select * from vw부장;


drop view vw부장;







-- 조인, 뷰
-- 내부 조인

--고객(부모,번호(PK)) <-> 판매(자식,고객(FK))
select * from tblCustomer; --고객
select * from tblSales; --판매

--tblCustomer + tblSales
select c.name, s.item, s.qty from tblCustomer c inner join tblSales s on c.seq = s.customer;

--어떤 회원(tblMember.name)? 어떤 비디오(tblVideo.name)? 언제(tblRent.rentDate)?

select m.name as mname, v.name as vname, to_char(r.rentdate, 'yyyy-mm-dd') as rentdate from tblMember m
        inner join tblRent r
                on m.seq = r.member
                        inner join tblVideo v
                                on v.seq = r.video;

-- 테이프 목록과 반납여부를 가져오시오.
-- inner join : 두 테이블에 모두 존재하는 레코드만 반환. 테이프들 중에서 대여기록이 있는 테이프만 가져온다.

select 
        v.name,  
        case
            when r.retdate is null then '미반납'
            when r.retdate is not null then '반납완료'
        end
        from tblVideo v
                inner join tblRent r
                        on v.seq = r.video;

-- 테이프 목록과 반납여부를 가져오시오.(+ 한번도 대여기록이 없는 테이프들도 가져오시오.)
-- outer join : inner join + 참조되지 않았던 부모 테이블의 나머지 레코드도 함께 가져오기. 대여기록이 없는 테이프
select 
        v.name,  
        case
            when r.retdate is null and r.rentdate is not null then '미반납'
            when r.retdate is not null then '반납완료'
            when r.retdate is null and r.rentdate is null then '악성재고'
        end
        from tblVideo v
                left outer join tblRent r
                        on v.seq = r.video;


select * from tblStaff;
select * from tblProject;

insert into tblStaff values (1, '홍길동', 250, '서울시');

-- 사장. 현재 진행중인(***) 모든 프로젝트와 담당자 정보를 가져와라
select * from tblStaff s
        inner join tblProject p
                on s.seq = p.staffseq;


-- 사장. 모든 직원들을(***) 가져오는데 프로젝트를 담당하고 있으면 그 프로젝트 정보도 같이 가져와라.
select * from tblStaff s
        left outer join tblProject p
                on s.seq = p.staffseq;



-- 셀프 조인
 select * from tblSelf;

-- 직원명(부서) + 상사명(부서)
select 
        s1.name as "상사명", 
        s1.department as "상사부서",
        s2.name as "부하명", 
        s2.department as "부하부서" 
            from tblSelf s1
                inner join tblSelf s2
                    on s1.seq = s2.super;


-- 상관 서브쿼리 vs 조인
-- : 조인으로 할 수 있는 일 = 서브쿼리로 할 수 있는 일
select 
    name, 
    department as "부하부서",
    (select name from tblSelf where seq=s1.super) as "상사명",
    (select department from tblSelf where seq=s1.super) as "상사부서" 
        from tblSelf s1; --직원 명단


-- 뷰 : select문을(SQL 자체를) 저장하는 객체. 자바(메소드)
-- 프로시저 : select, insert, update, delete.. 등 모든 SQL를 저장하는 객체. 자바(== 메소드)

create view vwStudent
as
select * from tblAddressBook where job = '학생';


-- 뷰사용 : 테이블처럼 사용된다.

--select문에 식별자가 생겼다. > 나중에 다시 호출할 수 있다. > 재사용을 하겠다는 의도.
select * from vwStudent; 

--인라인 뷰 > select문에 식별자가 없음 > 나중에 다시 호출할 수 없다. > 재사용을 하지 않겠다는 의도. 1회용
select * from (select * from tblAddressBook where job = '학생'); 


--ORA-00957: duplicate column name
create view 비디오장부
as
select m.name as mname, v.name as aname, r.rentdate, g.price from tblMember m
        left outer join tblRent r
                on m.seq = r.member
                        inner join tblVideo v
                                on v.seq = r.video
                                        inner join tblGenre g
                                                on g.seq = v.genre;


select * from 비디오장부;
insert into 비디오장부 (mname, vname, rentdate, price) values ('유관순', '어쭈구리', sysdate, 2000);



-- 뷰 수정하는 방법
-- : DB Object 수정하는 명령어 > alter
-- : 뷰는 다른 방법을 사용
--  1. drop > create
--  2. 수정
create or replace view tblComplete
as
select title, completedate from tblTodo where completedate is not null;

drop view tblComplete;

select * from tblComplete;



-- **** 뷰는 읽기 전용이다. 뷰는 읽기 전용으로만 사용해야 한다.

select * from tblTodo;

--새로운 할일 추가하기
insert into tblTodo (seq, title, adddate, completedate) values (21, '오라클 공부하기', sysdate, null);

-- 뷰생성
create or replace view vwTodo
as
--select * from tblTodo;
select title, completedate from tblTodo;

-- 읽기
select * from vwTodo;

-- 쓰기
insert into vwTodo (seq, title, adddate, completedate) values (22, '뷰 공부하기', sysdate, null);

--ORA-00904: "ADDDATE": invalid identifier
--ORA-01400: cannot insert NULL into ("HR"."TBLTODO"."SEQ")
insert into vwTodo (title, completedate) values ('뷰 공부하기', null);

-- 수정하기
update vwTodo set title = 'Oralce 공부하기' where seq = 21;

-- 삭제하기
delete from vwTodo where seq = 22;


-- 뷰 사용시 DML 적용할일이 생긴다면? > 테이블을 사용한다.
-- 뷰는 읽는 용도로만 사용한다.


























