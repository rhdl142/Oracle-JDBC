-- ex17_union.sql
/*
union, ���Ͽ�
- ���̺��� ��ġ�� ���
- ��

join, ����
- ���̺��� ��ġ�� ���
- Ⱦ

*/

create table ����
as
select * from tblInsa where jikwi = '����';

create table ����
as
select * from tblInsa where jikwi = '����';

select * from ����; --8��
select * from ����; --7��

-- union ������ ���� 2�� �̻� ���̺� �ϳ��� ��ģ��.
select * from ���� 
union 
select * from ����;

-- ORA-01790: expression must have same datatype as corresponding expression
select name, ssn from ����
union
select name, basicpay from ����;

-- ������ �����ϴٰ� union�� �ϸ� �ȵȴ�.(***) > ������ �ǹ̰� ��� ���ƾ� ����!!!!!
select name, sudang from ����
union
select name, basicpay from ����;

-- �� ���� �÷����� �����ؾ� �Ѵ�.
select name, sudang, ssn from ����
union
select name, basicpay, null from ����;


-- ���� ���̺��� 1���� ���̺� ����(***)�ϴ� �뵵
select name from tblCustomer
union
select name from tblMember
union
select last || first from tblname
union
select name from tblStaff;


--���ݼ� ���̺�
--����� ���̺�
select * from ���ݼ�
union
select * from �����;

--ȸ��(**�μ��� �Խ���)
--1. �Խ��� ���̺� 1���� ����
-- : �Խù��� �μ��� �����ϴ� �÷� ���� & ���
-- : ���� �� ��� �Խù��� �����ϴ� ������ ����� ��

--2. �Խ��� ���̺� �μ��� ����
-- : �μ����� ������ ���̺� ����
-- : �ɰ��� �� ������ ����, ���ļ� �� ������ ���� ��

--������, �ѹ���, ��ȹ�� �Խ���
create table tblBoard1 --������
(
    seq number primary key,
    subject varchar2(1000) not null
);

create table tblBoard2 --�ѹ���
(
    seq number primary key,
    subject varchar2(1000) not null
);

create table tblBoard3 --��ȹ��
(
    seq number primary key,
    subject varchar2(1000) not null
);

delete from tblBoard1;
truncate table tblBoard2;
truncate table tblBoard3;

--�Խù�
insert into tblBoard1 values (1, '������ �Խ����Դϴ�.');
insert into tblBoard1 values (2, '������ ȸ���ֽ��ϴ�.');
insert into tblBoard1 values (3, '������ �����Դϴ�.');

insert into tblBoard2 values (1, '�ѹ��� �Խ����Դϴ�.');
insert into tblBoard2 values (2, '�ѹ��� ȸ���ֽ��ϴ�.');

insert into tblBoard3 values (1, '��ȹ�� �Խ����Դϴ�.');
insert into tblBoard3 values (2, '��ȹ�� ȸ���ֽ��ϴ�.');
insert into tblBoard3 values (3, '��ȹ�� �����Դϴ�.');
insert into tblBoard3 values (4, '��ȹ�� �׽�Ʈ�Դϴ�.');



--�Ϸù�ȣ + ��ġ�� �ʴ� ���� > sequence ��ü
create sequence boardSeq;

insert into tblBoard1 values (boardSeq.nextval, '������ �Խ����Դϴ�.');
insert into tblBoard1 values (boardSeq.nextval, '������ ȸ���ֽ��ϴ�.');
insert into tblBoard1 values (boardSeq.nextval, '������ �����Դϴ�.');

insert into tblBoard2 values (boardSeq.nextval, '�ѹ��� �Խ����Դϴ�.');
insert into tblBoard2 values (boardSeq.nextval, '�ѹ��� ȸ���ֽ��ϴ�.');

insert into tblBoard3 values (boardSeq.nextval, '��ȹ�� �Խ����Դϴ�.');
insert into tblBoard3 values (boardSeq.nextval, '��ȹ�� ȸ���ֽ��ϴ�.');
insert into tblBoard3 values (boardSeq.nextval, '��ȹ�� �����Դϴ�.');
insert into tblBoard3 values (boardSeq.nextval, '��ȹ�� �׽�Ʈ�Դϴ�.');




--������ ����
select * from tblBoard1;
--�ѹ��� ����
select * from tblBoard2;
--��ȹ�� ����
select * from tblBoard3;

--����� -> ��� �Խù��� �ѹ��� ���� �ش޶�..
select * from
    (select * from tblBoard1
    union
    select * from tblBoard2
    union
    select * from tblBoard3)
        order by seq desc;


--���̿��� 
--���� : �Խù� 5��ġ > ���� 6����
--1. 1�� ���̺� ���
--  : �ϰ� �˻�, ���� ���� ����.
--  : �����Ͱ� ������ ���� �˻��� �ð��� ���� �ɸ�
--2. ������ ���̺� ���
--  : ���̺� ���� ���ڵ带 �ٿ��� �˻� �ӵ��� ������
--  : ���� ���� > union ���� ����� ����ؼ� ����(��� �߻�)


create table tblUnionA
(
    name varchar2(50) not null
);

create table tblUnionB
(
    name varchar2(50) not null
);

insert into tblUnionA values ('���');
insert into tblUnionA values ('��');
insert into tblUnionA values ('���ξ���');
insert into tblUnionA values ('�ٳ���');
insert into tblUnionA values ('����');

insert into tblUnionB values ('Ű��');
insert into tblUnionB values ('�ٳ���');
insert into tblUnionB values ('������');
insert into tblUnionB values ('����');
insert into tblUnionB values ('������');

select * from tblUnionA;
select * from tblUnionB;

select * from tblUnionA
union --�ߺ����� ����
select * from tblUnionB;

select name, count(*) from
(select * from tblUnionA
union all
select * from tblUnionB) group by name having count(*) > 1;

select * from tblUnionA
union all --�ߺ����� ǥ��
select * from tblUnionB;

select * from tblInsa where buseo = '��ȹ��'
union all
select * from tblInsa where jikwi = '����';


select * from tblUnionA
intersect --������
select * from tblUnionB;

select * from tblInsa where buseo = '��ȹ��'
intersect
select * from tblInsa where jikwi = '����';

select * from tblUnionA
minus -- A - B
select * from tblUnionB;

select * from tblUnionB
minus -- B - A
select * from tblUnionA;



















