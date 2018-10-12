-- ex13_join.sql
/*
조인, Join
*/


-- 직원 테이블 + 담당 프로젝트 정보
create table tblStaff
(
    seq number primary key, --직원번호(PK)
    name varchar2(30) not null, --직원명
    salary number not null, --급여
    address varchar2(300) not null, --주소
    projectname varchar2(100) null --해당이 담당 중인 프로젝트명
);

insert into tblStaff (seq, name, salary, address, projectname)
    values (1, '홍길동', 250, '서울시', '홍콩 수출');

insert into tblStaff (seq, name, salary, address, projectname)
    values (2, '아무개', 230, '부산시', 'TV 광고');
    
insert into tblStaff (seq, name, salary, address, projectname)
    values (3, '하하하', 210, '서울시', '매출 분석');

select * from tblStaff;

-- 정책 : 직원 1명이 여러 개의 프로젝트를 담당하는게 가능하다.
insert into tblStaff (seq, name, salary, address, projectname)
    values (4, '홍길동', 250, '서울시', '인사 처리');

insert into tblStaff (seq, name, salary, address, projectname)
    values (5, '홍길동', 250, '서울시', '자재 납품');
    
drop table tblStaff;

-- 직원 테이블
create table tblStaff
(
    seq number primary key, --직원번호(PK)
    name varchar2(30) not null, --직원명
    salary number not null, --급여
    address varchar2(300) not null --주소
    --projectSeq number null --프로젝트번호
);

-- 프로젝트 테이블
create table tblProject
(
    seq number primary key, --프로젝트번호(PK)
    projectname varchar2(100) null, --해당이 담당 중인 프로젝트명
    staffSeq number null --직원번호
);


insert into tblStaff (seq, name, salary, address) values (1, '홍길동', 250, '서울시');
insert into tblStaff (seq, name, salary, address) values (2, '아무개', 230, '부산시');
insert into tblStaff (seq, name, salary, address) values (3, '하하하', 210, '서울시');

insert into tblProject (seq, projectname, staffSeq) values (1, '홍콩 수출', 1);
insert into tblProject (seq, projectname, staffSeq) values (2, 'TV 광고', 2);
insert into tblProject (seq, projectname, staffSeq) values (3, '매출 분석', 2);
insert into tblProject (seq, projectname, staffSeq) values (4, '노조 협상', 1);
insert into tblProject (seq, projectname, staffSeq) values (5, '대리점 분양', 3);

select * from tblStaff;
select * from tblProject;

-- tblStaff(기본 테이블, 부모 테이블) + tblProject(참조 테이블, 자식 테이블) : 두 테이블이 관계를(Relationship) 맺고 있다.
-- Oracle : RDBMS(Relational Databse Management System)

-- 관계를 맺고 있는 2개의 테이블의 데이터를 조작하면.. 생기는 일들..
-- 1. 부모 테이블의 조작
--      a. 추가
--      b. 수정
--      c. 삭제
-- 2. 자식 테이블의 조작
--      a. 추가
--      b. 수정
--      c. 삭제



-- 1. 신입 사원 입사 -> 신규 프로젝트 시작(담당자 배정)

-- 1.a. 신입 사원 추가(O)
insert into tblStaff (seq, name, salary, address) values (4, '호호호', 190, '부천시');

-- 1.b. 신규 프로젝트 추가(O)
insert into tblProject (seq, projectname, staffSeq) values (6, '자재 매입', 4);

-- 1.c. 신규 프로젝트 추가(O -> X)
--ORA-02291: integrity constraint (HR.TBLPROJECT_STAFFSEQ_FK) violated - parent key not found
insert into tblProject (seq, projectname, staffSeq) values (7, '고객 유치', 5);



-- 2. '홍길동' 퇴사

-- 2.a. '홍길동' 삭제(O -> X)
--ORA-02292: integrity constraint (HR.TBLPROJECT_STAFFSEQ_FK) violated - child record found
delete from tblStaff where name = '홍길동';
delete from tblStaff where seq = 1;


-- 2.b. 남아있는 직원들에게 '홍길동'의 업무를 위임.
update tblProject set
    staffSeq = 2
        where staffSeq = 1;

-- 2.c. 미련없이 '홍길동' 퇴사
delete from tblStaff where name = '홍길동';



select * from tblStaff;
select * from tblProject;



-- 부모 테이블 + 자식 테이블 : 논리적 관계(사람이 관리) > 약한 결합
-- 부모 테이블 + 자식 테이블 : 물리적 관계(DBMS가 관리) > 강한 결합 > 제약 사항 추가
-- 외래키, Foreign Key
-- : 참조 관계에 있는 두 테이블간에 연결 고리 역할을 하는 컬럼들이 있다. 그 연결 고리 역할의 컬럼값들을 항상 유효하게 
--  유지 시켜주는 제약 사항


-- 직원 테이블
create table tblStaff
(
    seq number primary key, --직원번호(PK)
    name varchar2(30) not null, --직원명
    salary number not null, --급여
    address varchar2(300) not null --주소
);

-- 프로젝트 테이블
create table tblProject
(
    seq number primary key, --프로젝트번호(PK)
    projectname varchar2(100) null, --해당이 담당 중인 프로젝트명
    staffSeq number constraint tblproject_staffseq_fk references tblStaff(seq) not null  --직원번호(FK)
);


drop table tblStaff;
drop table tblProject;



-- 고객 <-> 판매
-- 고객 테이블
create table tblCustomer
(
    seq number primary key, --고객번호(PK)
    name varchar2(30) not null, --고객명
    tel varchar2(15) not null, --연락처
    address varchar2(100) not null --주소
);

-- 판매 테이블
create table tblSales
(
    seq number primary key, --판매번호(PK)
    item varchar2(50) not null, --상품명
    qty number not null, --수량
    regdate date default sysdate not null, --판매날짜
    customer number references tblCustomer(seq) not null --고객번호(FK)
);


-- 비디오 대여점
-- 장르 테이블
create table tblGenre
(
    seq number primary key, --장르번호(PK)
    name varchar2(30) not null, --장르명
    price number not null, --대여 가격
    period number not null --대여 기간
);

-- 비디오 테이블
create table tblVideo
(
    seq number primary key, --비디오번호(PK)
    name varchar2(100) not null, --제목
    qty number not null, --보유 수량
    company varchar2(50) null, --제작사
    director varchar2(50) null, --감독
    major varchar2(50) null, --주연배우
    genre number references tblGenre(seq) not null --장르번호(FK)
);

-- 회원 테이블
create table tblMember
(
    seq number primary key, --회원번호(PK)
    name varchar2(20) not null, --회원명
    grade number(1) not null, --회원 등급(1,2,3)
    byear number(4) not null, --생년
    tel varchar2(15) not null, --연락처
    address varchar2(300) null, --주소
    money number not null --예치금
);

-- 대여 테이블
create table tblRent
(
    seq number primary key, --대여번호(PK)
    member number references tblMember(seq) not null, --대여한 회원번호(FK)
    video number references tblVideo(seq) not null, --대여한 비디오번호(FK)
    rentdate date default sysdate not null, --대여날짜
    retdate date null, --반납날짜
    remart varchar2(500) --비고
);

-- 시퀀스 객체
create sequence memberSeq;
create sequence genreSeq;
create sequence videoSeq;
create sequence rentSeq;

/*
조인, Join
- 2개(1개) 이상의 테이블의 내용을 한번에 가져와 1개의 결과셋을 만드는 작업
- 분리되어 있는 2개 이상의 테이블을 1개로 만드는 작업
- 2개 이상의 테이블이 서로 관계가 있어야 한다.(관계 테이블끼리 조인하는 경우 X)

조인의 종류(ANSI SQL)
1. 단순 조인, Cross Join
2. 내부 조인, Inner Join
3. 외부 조인, Outer Join
4. 셀프 조인, Self Join

*/

--1. 단순조인, 크로스 조인
select * from tblCustomer; --3명
select * from tblSales; --9건

-- 27건
select * from tblCustomer, tblSales; -- Oracle 표현
select * from tblCustomer cross join tblSales; -- ANSI 표현


/*
2. 내부 조인
: 단순 조인에서 유효한 레코드만을 취하는 조인
: 부모 테이블의 PK와 자식 테이블의 FK가 동일한 레코드만을 취하는 조인


select 컬럼리스트 from 테이블A 
                inner join 테이블B 
                                on 테이블A.컬럼명(PK) = 테이블B.컬럼명(FK);

*/

-- inner join의 결과 > 자식 테이블 레코드 수 > 9건
-- 구매내역과 해당 손님의 정보를 가져오시오.
select * from tblCustomer
        inner join tblSales
                on tblCustomer.seq = tblSales.customer; --부모 테이블 join 자식 테이블(권장)


select * from tblSales
        inner join tblCustomer
                on tblSales.customer = tblCustomer.seq; --자식 테이블 join 부모 테이블



-- ORA-00918: column ambiguously defined
-- > 테이블명.컬럼명
select tblSales.seq, tblCustomer.seq from tblCustomer
        inner join tblSales
                on tblCustomer.seq = tblSales.customer;


-- 표준 SQL
select * from tblCustomer
        inner join tblSales
                on tblCustomer.seq = tblSales.customer;


-- 오라클
select * from tblCustomer, tblSales
        where tblCustomer.seq = tblSales.customer;


-- 조인 사용 시 절대(되도록) 하면 안되는 행동
-- : PK - FK 연결된 관계있는 테이블끼리만 하자
select * from tblStaff;
select * from tblZoo;

select * from tblStaff
        inner join tblZoo
                on tblStaff.seq = tblZoo.leg;


-- 노트(tblSales)를 사간 회원의 연락처(tblCustomer)?

--1. 서브쿼리
select customer from tblSales
    where item = '노트';
    
select tel from tblCustomer
    where seq = 2;

select name, tel from tblCustomer
    where seq = (select customer from tblSales
                                where item = '노트');

-- 2. 조인
select tblCustomer.name, tblCustomer.tel from tblCustomer
    inner join tblSales
        on tblCustomer.seq = tblSales.customer
            where tblSales.item = '노트';


--서브쿼리를 from 절에 적용하기
select name, tel from (select * from tblCustomer
    inner join tblSales
        on tblCustomer.seq = tblSales.customer)
            where item = '노트';


-- 일일히 컬럼명앞에 테이블명을 붙이기가 귀찮다. >  간략하게 기재  > Table Alias(별칭)
select c.name, c.tel --4. 
    from tblCustomer c inner join tblSales s -- 1.
        on c.seq = s.customer --2.
            where s.item = '노트'; --3.


select name, tel  
    from tblCustomer c inner join tblSales s 
        on c.seq = customer 
            where item = '노트'; 



select * from tblCustomer; --3명
select * from tblSales; --9건

-- 고객 1명 가입
insert into tblCustomer values (4, '호호호', '010-9876-5432', '서울시');

-- ****
-- 내부 조인은 부모 테이블의 레코드가 자식 테이블에 참조되지 않으면 그 부모 레코드는 결과셋에서 제외가 된다
-- 쇼핑몰에서 적어도 1회 이상(*****) 구매이력이 있는 고객의 정보와 구매 이력을 가져오시오.
-- 부모 테이블과 자식 테이블 모두 동시에 존재하는 레코드만 가져온다.
select * from tblCustomer c
    inner join tblSales s
        on c.seq = s.customer;



-- 쇼핑몰에서 구매이력과 상관없이 모든 구매 이력과 고객 정보를 가져오되, 
-- 구매 이력 없는 고객의 구매 이력 정보는 비어둔 채로 가져오시오.

/*
3. 외부 조인
- select 컬럼리스트 from 테이블A left[right] outer join 테이블B on c.PK = s.FK;]
- 일반적으로 방향은 부모테이블을 가리킨다.
*/

-- 방향이 자식 테이블 가리키게 되면 내부 조인의 결과와 동일하다.
select * from tblCustomer c
    right outer join tblSales s
        on c.seq = s.customer;

-- 내부 조인
-- 대여 기록과 함께 고객 정보를 가져오시오.(한번도 대여를 하지 않는 고객은 제외)
select * from tblMember m
    inner join tblRent r
        on m.seq = r.member;

-- 외부 조인
-- 대여의 유무와 상관없이 모든 고객 정보 + 대여 기록을 가져오시오.
select * from tblMember m
    left outer join tblRent r
        on m.seq = r.member;


/*
4. 셀프 조인
- 1개의 테이블을 가지고 조인
- 자신이 자신을 참조하는 키를 소유함(PK + FK)
*/

-- 직원 정보 테이블
create table tblSelf
(
    seq number primary key, --직원번호(PK)
    name varchar2(30) not null, --직원명
    department varchar2(30) null, --부서
    super number references tblSelf(seq) null --직속상사번호(FK)
);

insert into tblSelf values (1, '홍사장', null, null);
insert into tblSelf values (2, '김부장', '영업부', 1);
insert into tblSelf values (3, '이과장', '영업부', 2);
insert into tblSelf values (4, '정대리', '영업부', 3);
insert into tblSelf values (5, '최사원', '영업부', 4);
insert into tblSelf values (6, '박부장', '홍보부', 1);
insert into tblSelf values (7, '김과장', '홍보부', 6);

select * from tblSelf;

-- 직원 정보 + 직속상사 정보
select s2.name as 직원명, s1.name as 상사명 from tblSelf s1 --부모테이블(상사) 
    inner join tblSelf s2 --자식테이블(부하)
        on s1.seq = s2.super;

select s2.name as 직원명, nvl(s1.name, '미정') as 상사명 from tblSelf s1 --부모테이블(상사) 
    right outer join tblSelf s2 --자식테이블(부하)
        on s1.seq = s2.super;


-- 내부 조인

-- 테이블 1개
-- 비디오가 뭐뭐?
select * from tblVideo;

-- 테이블 2개
-- 모든 비디오 정보와 대여 가격, 기간?
select * from tblVideo v
    inner join tblGenre g
        on g.seq = v.genre;

-- 테이블 3개
select * from tblVideo v
    inner join tblGenre g
        on g.seq = v.genre
            inner join tblRent r
                on v.seq = r.video;

-- 테이블 4개
select * from tblVideo v
    inner join tblGenre g
        on g.seq = v.genre
            inner join tblRent r
                on v.seq = r.video
                    inner join tblMember m
                        on m.seq = r.member;

select * from tblGenre;

-- 대여 기록 출력 : 회원명, 비디오제목, 언제, 반납 유무('반납완료' or '미반납')
select 
    m.name as 회원명,
    v.name as 비디오제목,
    to_char(r.rentdate, 'yyyy-mm-dd') as 대여날짜,
    case
        when r.retdate is null then '미반납'
        when r.retdate is not null then '반납완료'
    end as 반납유무,
    --g.name,
    --g.period,
    --sysdate - (대여날짜 + 대여기간)
     
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


-- 상관 서브쿼리, Correlated Sub Query
-- : 서브 쿼리 <-> (연관) <-> 바깥쪽 쿼리

-- *와 일반컬럼은 같이 사용 불가
select *, last || first as name from tblname;
select first, last, weight, height, gender, nick, last || first as name from tblname;
select n.*, last || first as name from tblname n;


-- 바깥쪽의 나머지 컬럼의 값과 서브쿼리의 값들 그다지 연관이 없다.(서로 독립적인 값이다.)
select v.*, (select count(*) from tblVideo) from tblVideo v;

select * from tblGenre;


-- 바깥쪽의 나머지 컬럼의 값과 서브쿼리의 값들 그다지 연관이 없다.(서로 독립적인 값이다.)
select v.*, (select max(price) from tblGenre) from tblVideo v;

-- 바깥쪽의 나머지 컬럼의 값과 서브쿼리의 값을 연관시킨다. > 상관 서브쿼리
select v.*, (select price from tblGenre where seq = v.genre) from tblVideo v;




select * from tblCountry where area <= 100;

select * from employees;




















