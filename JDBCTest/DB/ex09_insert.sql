-- ex09_insert.sql
/*

insert ��
- DML(insert, update, delete)
- insert into ���̺�� (�÷�����Ʈ) values (������Ʈ);

*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key, --�޸��ȣ(PK)
    name varchar2(30) not null, --�ۼ���
    memo varchar2(1000) not null, --�޸𳻿�
    regdate date default sysdate not null, --��¥
    etc varchar2(500) default '������' null, --���
    page number null --��������
);

--ORA-08002: sequence MEMOSEQ.CURRVAL is not yet defined in this session
--select memoSeq.currval from dual; -> select max(seq) from tblMemo;
--select memoSeq.nextval from dual;


-- insert �� ����� �� �������� ����

-- 1. ǥ�� : ���� ���̺��� ���ǵ� �÷� ������� �÷�����Ʈ�� ������Ʈ�� ǥ���ϴ� ���
insert into tblMemo (seq, name, memo, regdate, etc, page)
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', sysdate, '���', 1);


-- ORA-01841: (full) year must be between -4713 and +9999, and not be 0
-- �ݵ�� �÷�����Ʈ�� ������ ������Ʈ�� ������ �����ؾ� �Ѵ�.
insert into tblMemo (name, memo, regdate, etc, page, seq)
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', sysdate, '���', 1);


-- insert ���� �ۼ��� �� ���� ���̺��� �÷�����Ʈ �����ʹ� �������.
insert into tblMemo (name, memo, regdate, etc, page, seq)
        values ('ȫ�浿', '�޸��Դϴ�.', sysdate, '���', 1, memoSeq.nextval);


--00947. 00000 -  "not enough values"
insert into tblMemo (seq, name, memo, regdate, etc, page) --�÷� ����Ʈ 6��
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', sysdate, '���'); --�� ����Ʈ 5��
        
        
--00913. 00000 -  "too many values"
insert into tblMemo (seq, name, memo, regdate, etc) --�÷� ����Ʈ 5��
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', sysdate, '���', 1); --�� ����Ʈ 6��


-- null ������ ���� �÷��� �Է��ϱ�(= Ư�� �÷��� null�� �����ϱ�)
insert into tblMemo (seq, name, memo, regdate, etc)
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', sysdate, '���'); --null�� �ְ� ���� �÷��� �ƿ� ����
        
insert into tblMemo (seq, name, memo, regdate, etc, page)
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', sysdate, '���', null); --null ��� �����ϱ� 


-- default ���� ����ϱ�
-- default ������ �ɸ� �÷��� null�� �־����� default���� ��� ���Եȴ�.
insert into tblMemo (seq, name, memo, regdate, page) 
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', sysdate, 1); --������ ����ؼ� null ����

-- null ����� ���� �ִ� ��쿡�� default ������ �������� �ʴ´�.
insert into tblMemo (seq, name, memo, regdate, etc, page) 
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', sysdate, null, 1); --null ����� ����ؼ� null ����


-- default ���� + not null ������ ���ÿ� �ɸ� �÷��� ������ ǥ���� ����� �� �ִ�.
insert into tblMemo (seq, name, memo, etc, page) 
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', '���', 1);

insert into tblMemo (seq, name, memo, regdate, etc, page) 
        values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', null, '���', 1); --not null ����


-- �÷� ����Ʈ ����
insert into tblMemo values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', sysdate, '���', 1);


-- �÷� ����Ʈ ������ ���̺��� ������ ����� �÷� ������ �����Ѵ�. -> �ݵ�� �� ����Ʈ�� ���� ���̺��� �÷� ������ ����
insert into tblMemo values ('ȫ�浿', '�޸��Դϴ�.', sysdate, '���', 1, memoSeq.nextval);

-- 00947. 00000 -  "not enough values"
insert into tblMemo values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', '���', 1);
insert into tblMemo values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', default, '���', 1);


insert into tblMemo values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', default, default, 1);

insert into tblMemo values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.', default, default, null);

select * from tblMemo;

-------------------------------------------- �Ϲ����� insert

-------------------------------------------- �Ϲ������� ���� insert


drop table tblMemoCopy;

create table tblMemoCopy
(
    seq number primary key, --�޸��ȣ(PK)
    name varchar2(30) not null, --�ۼ���
    memo varchar2(1000) not null, --�޸𳻿�
    regdate date default sysdate not null, --��¥
    etc varchar2(500) default '������' null, --���
    page number null --��������
);

-- tblMemo -> (����) -> tblMemoCopy
insert into tblMemoCopy 
    select * from tblMemo; -- insert + ��������


insert into tblMemoCopy 
    select * from tblMemo where mod(seq, 2) = 0;

select * from tblMemoCopy;


-- ������ ���� ���̺�

insert into ������
    select * from tblinsa where buseo = '������';

create table ������
as
select * from tblinsa where buseo = '������';

select * from ������;

-- insert + select
-- : ���̺� ���� ����(���� ���� �߰�)
-- : ������ �����͸� ����
-- : ������ O + ������ �׽�Ʈ�� O

-- create table + select
-- : ���̺� �ڵ� ���� + ������ ����
-- : ���� ���̺��� ���� ������ ���簡 �ȵȴ�.(�÷��� + �ڷ���)
-- : ������ X + ������ �׽�Ʈ�� O











