-- ex15_alter.sql
/*

��ü ���� : create
��ü ���� : alter
��ü ���� : drop

������ ���� : insert
������ ���� : update
������ ���� : delete

���̺� �����ϱ�
- ���̺��� ������ �����ϱ� > �÷��� ���Ǹ� �����ϱ�
- �ִ��� ���̺��� ������ ��Ȳ�� ����� �ȵȴ�.(**************************************)
1. ���̺� ���� > ���̺� DDL ���� > ������ DDL ���Ӱ� ���̺� ����
    + ������ �����Ͱ� ������ ������ ��� > ���̺���� > ���̺���� > ������ ����
    : ����(����) �߿��� ��� O, � �߿��� ��� X
2. alert ��ɾ� > ���̺��� ������ ���� + ������ �״�� ����
    : ����(����) �߿��� ��� O, � �߿��� ��� O(������ �ʴ�.)
    

���̺� ���� > �÷� ����
1. ���ο� �÷��� �߰��ϱ� : ���� ����
2. ���� �÷��� ���Ǹ� �����ϱ�(����, �ڷ���, �÷���(x)) : �����
3. ���� �÷��� �����ϱ� : �����

*/
desc tblname;

create table tblEdit
(
    seq number primary key,
    data varchar2(20) not null
);

insert into tblEdit values (1, '���콺');
insert into tblEdit values (2, 'Ű����');
insert into tblEdit values (3, '�����');
insert into tblEdit values (4, '�����', 0, ''); --ORA-00001: unique constraint (HR.TBLEDIT_DATA_UQ) violated

desc tblEdit;

select * from tblEdit;

--1. ���ο� �÷� �߰��ϱ�
alter table tblEdit 
        --add (�߰��� �÷��� ����);
        add (price number(5) null); --���� null

--ORA-01758: table must be empty to add mandatory (NOT NULL) column
alter table tblEdit
        add (description varchar2(1000) not null); --���� not null

alter table tblEdit
        add (description varchar2(1000) default '�ӽ�' not null);

--a. null �߰� > �߰��� �÷��� ����(�� ����) > not null�߰�
--b. not null + default �߰� > ���ϴ� ������ �÷� ����(�� ����)






-- 2. ���� �÷��� �����ϱ�
select * from tblEdit;
desc tblEdit;

-- 2.a �ڷ����� ũ�⸦ �ø���
alter table tblEdit
    modify (description varchar2(2000));

-- 2.b �ڷ����� ũ�⸦ ���̱�(���� ������ Ȯ�� ��******)
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
update tblEdit set etc = '�ӽõ�����' where etc is null;

alter table tblEdit
    modify (etc varchar2(100) not null);


--2.e �÷� Ÿ�� �����ϱ�(�� ��Ȳ�� ������ ����!!! > ���� �� �ؾ� �Ѵٸ�.. ��� ������ ����ִ� �������� ����� Ȯ��)
alter table tblEdit
    modify (price varchar2(5));

alter table tblEdit
    modify (description number);

--3. �÷� �����ϱ�
-- : FK�� �����Ǵ� PK �����ϸ� �ȵȴ�.
-- : ���� �Ұ���
alter table tblEdit
    drop column etc;



--������� �߰��ϱ�/�����ϱ�/�����ϱ�
-- : not null ����(�÷� ������ ���ؼ�)

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

���̺��� ��� �� �����ϱ�
- ���̺� �ʱ�ȭ(������ �״�� �ΰ� �����͸� ����)
- ���� -> �׽�Ʈ -> �Ϸ� -> �ʱ�ȭ

1. drop -> create
- ���� ��� �� ����
- ���迡 �ִ� ���̺�� ����!!!
- �ǵ����� �Ұ���(���� �Ұ���)
- ���

2. delete
- ������ Ư�� ���ڵ� ����
- ����
- ��� �� or �Ϻ� ��
- �ǵ����� ����(���� ����)

3. truncate
- ���̺� �ʱ�ȭ ����
- ����
- ���̺��� ��� ���� �����ϴ� ��ɾ�(delete + ���������� �����ϴ� �Ͱ� ����)
- �ǵ����� �Ұ���(���� �Ұ���)
- �ڹ� : �÷���.clear();

*/

create table ������
as
select * from tblInsa where buseo = '������';

select * from ������;
desc ������;

--������ ���̺� �ʱ�ȭ
commit;
rollback;

--2.
delete from ������;

--3.
--select trunc(2.5)
truncate table ������;


















