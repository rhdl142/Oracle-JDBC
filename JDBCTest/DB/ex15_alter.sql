-- ex15_alter.sql
/*

객체 생성 : create
객체 수정 : alter
객체 삭제 : drop

데이터 생성 : insert
데이터 수정 : update
데이터 삭제 : delete

테이블 수정하기
- 테이블의 구조를 수정하기 > 컬럼의 정의를 수정하기
- 최대한 테이블을 수정할 상황을 만들면 안된다.(**************************************)
1. 테이블 삭제 > 테이블 DDL 수정 > 수정된 DDL 새롭게 테이블 생성
    + 기존에 데이터가 있으면 데이터 백업 > 테이블삭제 > 테이블생성 > 데이터 복구
    : 개발(공부) 중에만 사용 O, 운영 중에는 사용 X
2. alert 명령어 > 테이블의 구조만 변경 + 데이터 그대로 유지
    : 개발(공부) 중에만 사용 O, 운영 중에는 사용 O(쉽지가 않다.)
    

테이블 수정 > 컬럼 수정
1. 새로운 컬럼을 추가하기 : 가장 쉬움
2. 기존 컬럼의 정의를 수정하기(제약, 자료형, 컬럼명(x)) : 어려움
3. 기존 컬럼을 삭제하기 : 어려움

*/
desc tblname;

create table tblEdit
(
    seq number primary key,
    data varchar2(20) not null
);

insert into tblEdit values (1, '마우스');
insert into tblEdit values (2, '키보드');
insert into tblEdit values (3, '모니터');
insert into tblEdit values (4, '모니터', 0, ''); --ORA-00001: unique constraint (HR.TBLEDIT_DATA_UQ) violated

desc tblEdit;

select * from tblEdit;

--1. 새로운 컬럼 추가하기
alter table tblEdit 
        --add (추가될 컬럼의 정의);
        add (price number(5) null); --제약 null

--ORA-01758: table must be empty to add mandatory (NOT NULL) column
alter table tblEdit
        add (description varchar2(1000) not null); --제약 not null

alter table tblEdit
        add (description varchar2(1000) default '임시' not null);

--a. null 추가 > 추가된 컬럼을 수정(값 대입) > not null추가
--b. not null + default 추가 > 원하는 값으로 컬럼 수정(값 수정)






-- 2. 기존 컬럼을 수정하기
select * from tblEdit;
desc tblEdit;

-- 2.a 자료형의 크기를 늘리기
alter table tblEdit
    modify (description varchar2(2000));

-- 2.b 자료형의 크기를 줄이기(기존 데이터 확인 후******)
alter table tblEdit
    modify (data varchar2(10));

--ORA-01441: cannot decrease column length because some value is too big
alter table tblEdit
    modify (data varchar2(5));


alter table tblEdit
    add (etc varchar2(100));


-- 2.c not null -> null
alter table tblEdit
    modify (description varchar2(2000) null);

--2.d null -> not null
--ORA-02296: cannot enable (HR.) - null values found
update tblEdit set etc = '임시데이터' where etc is null;

alter table tblEdit
    modify (etc varchar2(100) not null);


--2.e 컬럼 타입 변경하기(이 상황을 만들지 말것!!! > 만약 꼭 해야 한다면.. 적어도 기존에 들어있는 데이터의 모습을 확인)
alter table tblEdit
    modify (price varchar2(5));

alter table tblEdit
    modify (description number);

--3. 컬럼 삭제하기
-- : FK에 참조되는 PK 삭제하면 안된다.
-- : 복구 불가능
alter table tblEdit
    drop column etc;



--제약사항 추가하기/수정하기/삭제하기
-- : not null 제외(컬럼 수정을 통해서)

alter table tblEdit
    --add (data varchar2(30) unique null)
    add constraint tblEdit_data_uq unique(data);

alter table tblEdit
    add constraint tblEdit_seq_pk primary key(seq);
    
alter table tblEdit
    add constraint tblEdit_price_ck check (price between 0 and 1000000);

alter table tblEdit
    add constraint tblParent_tblEdit_seq foreign key tblParent(seq);


select * from tblEdit;
desc tblEdit;


create table tblParent
(
    seq number,
    data varchar2(100) not null,
    constraint tblParent_seq_pk primary key(seq)
);

create table tblChild
(
    seq number,
    data varchar2(100) not null
);

alter table tblChild
    add constraint tblChild_seq_pk primary key(seq)
    add (pseq number)
    add constraint tblChild_tblParent_pseq_fk foreign key (pseq) references tblParent(seq);


alter table tblChild
    add constraint tblChild_seq_pk primary key(seq);
    
alter table tblChild
    add (pseq number);
    
alter table tblChild
    add constraint tblChild_tblParent_pseq_fk foreign key (pseq) references tblParent(seq);

drop table tblChild;



/*

테이블의 모든 행 삭제하기
- 테이블 초기화(구조는 그대로 두고 데이터만 리셋)
- 개발 -> 테스트 -> 완료 -> 초기화

1. drop -> create
- 은근 사용 빈도 있음
- 관계에 있는 테이블들 주의!!!
- 되돌리기 불가능(복구 불가능)
- 편법

2. delete
- 업무상 특정 레코드 삭제
- 정석
- 모든 행 or 일부 행
- 되돌리기 가능(복구 가능)

3. truncate
- 테이블 초기화 목적
- 정석
- 테이블의 모든 행을 삭제하는 명령어(delete + 조건절없이 실행하는 것과 동일)
- 되돌리기 불가능(복구 불가능)
- 자바 : 컬렉션.clear();

*/

create table 영업부
as
select * from tblInsa where buseo = '영업부';

select * from 영업부;
desc 영업부;

--영업부 테이블 초기화
commit;
rollback;

--2.
delete from 영업부;

--3.
--select trunc(2.5)
truncate table 영업부;


















