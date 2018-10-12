-- ex20_account.sql
/*
����� ���� SQL
- DCL�� �� �κ�
- ���� ���� + ����
- ���ҽ� ���� ���� ����

����� ���� �����ϱ�
- �ý��� ������ ������ �ִ� ������ �����ϴ�.

*/


-- �� ���� �����ϱ�
-- create user ������ identified by ��ȣ; //���� ���� + ��ȣ ����
-- alter user ������ identified by ��ȣ; //��ȣ ����
-- drop user ������; //���� ����


-- ������Ʈ �뵵 > ����(��Ű��) ���� > �۾� ���� ������ ����

-- hr
create user team identified by java1234;




-- system
show user;
create user team identified by java1234;

-- ���� ���� �����ϱ�
-- ����(privileges) �ο��ϱ�(�Ҵ��ϱ�)
-- grant ���� to ������;
grant create session to team; --team �������� ������ ������ �� �ִ� ���� �ο� > ���� ����
grant create table to team; --���̺� ���� ����(���� + ����)
grant create view to team;
grant create sequence to team;

-- ��(Role) �����ϱ�
-- ���� ����
-- 1. connect
-- : ����� DB ���� ����
-- 2. resource
-- : ����ڰ� ��ü�� ������ �� �ִ� ���� ����
-- 3. dba
-- : �����ڱ� ���� ���� ����
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





-- ���� �߰��ϱ�(�Ϲ� ����)
-- 1. ���� ����
create user user1 identified by java1234;

-- 2. ���� �ο� > Role ���
grant connect to user1;
grant resource to user1;
grant create view to user1;


-- ���� Role ���
SELECT * FROM DBA_ROLES;

-- Ư�� Role�� � ������ �ִ���?
SELECT grantee, privilege
    FROM DBA_SYS_PRIVS
        WHERE grantee = 'CONNECT';

SELECT grantee, privilege
    FROM DBA_SYS_PRIVS
        WHERE grantee = 'RESOURCE';

SELECT grantee, privilege
    FROM DBA_SYS_PRIVS
        WHERE grantee = 'DBA';



-- ��ü ���� �����ϱ�
-- : ���̺�, ��, ������ � ���ؼ� ��ü���� DML�� ����� �� �ִ� ���� ����
-- : grant ���� on ��� to ����;

-- system or hr
grant select
    on hr.tblInsa
        to team;

grant delete on hr.tblInsa to team;


-- team
select * from tabs;
select * from team.tblInsa;
select * from hr.tblInsa; --�ٸ� ������ �ڿ��� �ݵ�� �Ҽ�(������,��Ű����)�� ����ؾ� �Ѵ�.
select * from hr.tblname;
delete from hr.tblInsa where num = 1001;
rollback;

-- ���� ����
-- : revoke ���� on ��� from ����;
revoke delete
    on hr.tblInsa
        from team;
        
revoke create session from team;


-- DB ������Ʈ > �� ���� > ���� �ο�(connect, resource, create view)

drop user team cascade;


-- tblGenre ���� : tblRent > tblVideo > tblGenre
drop table tblGenre;
drop table tblGenre cascade constraints;

select * from tblGenre;
select * from tblVideo;





select 
    decode(completedate, null, '�̿Ϸ�', '�Ϸ�'),
    decode(completedate, nvl2(completedate, null,'asdf'), '�Ϸ�')
        from tblTodo;


















