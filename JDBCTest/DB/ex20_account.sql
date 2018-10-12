-- ex20_account.sql
/*
사용자 관련 SQL
- DCL의 한 부분
- 계정 생성 + 삭제
- 리소스 접근 권한 제어

사용자 계정 생성하기
- 시스템 권한을 가지고 있는 계정만 가능하다.

*/


-- 새 계정 관리하기
-- create user 계정명 identified by 암호; //계정 생성 + 암호 지정
-- alter user 계정명 identified by 암호; //암호 수정
-- drop user 계정명; //계정 삭제


-- 프로젝트 용도 > 계정(스키마) 생성 > 작업 공간 별도로 생성

-- hr
create user team identified by java1234;




-- system
show user;
create user team identified by java1234;

-- 각종 권한 관리하기
-- 권한(privileges) 부여하기(할당하기)
-- grant 권한 to 유저명;
grant create session to team; --team 계정에게 세션을 생성할 수 있는 권한 부여 > 접속 권한
grant create table to team; --테이블 생성 권한(수정 + 삭제)
grant create view to team;
grant create sequence to team;

-- 롤(Role) 관리하기
-- 권한 집합
-- 1. connect
-- : 사용자 DB 접속 권한
-- 2. resource
-- : 사용자가 객체를 조작할 수 있는 권한 모음
-- 3. dba
-- : 관리자급 계정 권한 모음
grant resource to team;






-- team
show user;
select * from tabs;


--ORA-01031: insufficient privileges
create table tblTeam
(
    seq number primary key,
    data varchar2(100) not null
);





-- 계정 추가하기(일반 계정)
-- 1. 계정 생성
create user user1 identified by java1234;

-- 2. 권한 부여 > Role 사용
grant connect to user1;
grant resource to user1;
grant create view to user1;


-- 각종 Role 목록
SELECT * FROM DBA_ROLES;

-- 특정 Role이 어떤 권한이 있는지?
SELECT grantee, privilege
    FROM DBA_SYS_PRIVS
        WHERE grantee = 'CONNECT';

SELECT grantee, privilege
    FROM DBA_SYS_PRIVS
        WHERE grantee = 'RESOURCE';

SELECT grantee, privilege
    FROM DBA_SYS_PRIVS
        WHERE grantee = 'DBA';



-- 객체 권한 관리하기
-- : 테이블, 뷰, 시퀀스 등에 대해서 객체별로 DML을 사용할 수 있는 권한 제어
-- : grant 권한 on 대상 to 유저;

-- system or hr
grant select
    on hr.tblInsa
        to team;

grant delete on hr.tblInsa to team;


-- team
select * from tabs;
select * from team.tblInsa;
select * from hr.tblInsa; --다른 계정의 자원은 반드시 소속(계정명,스키마명)을 명시해야 한다.
select * from hr.tblname;
delete from hr.tblInsa where num = 1001;
rollback;

-- 권한 뺏기
-- : revoke 권한 on 대상 from 유저;
revoke delete
    on hr.tblInsa
        from team;
        
revoke create session from team;


-- DB 프로젝트 > 팀 계정 > 권한 부여(connect, resource, create view)

drop user team cascade;


-- tblGenre 삭제 : tblRent > tblVideo > tblGenre
drop table tblGenre;
drop table tblGenre cascade constraints;

select * from tblGenre;
select * from tblVideo;





select 
    decode(completedate, null, '미완료', '완료'),
    decode(completedate, nvl2(completedate, null,'asdf'), '완료')
        from tblTodo;


















