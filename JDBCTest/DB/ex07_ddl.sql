-- ex07_ddl.sql
/*
DML
- ������ ���۾�(select, insert, update, delete)
- select(DQL : Data Query Language)

DDL
- ������ ���Ǿ�
- ��ü(DB Object)�� �����Ѵ�.
- DB Object : ���̺�, ��, �ε���, Ʈ����, ���ν���, ������� ��..
- create, alter, drop


���̺� �����ϱ�(= �ؽ�Ʈ ���� ���� �����)

create table ���̺��
(
    �÷� ����,
    �÷� ����,
    �÷� ����,
    �÷��� �ڷ���(����) NULLǥ�� �������
);

*/

create table tblTest
(
    num number(3),
    txt varchar2(10),
    regdate date
);

select * from tblTest;

insert into tblTest (num, txt, regdate) values (100, 'ȫ�浿', '2018-08-20');
insert into tblTest (num, txt, regdate) values (200, '�ƹ���', sysdate);


/*

�÷��� �ڷ���(����) NULLǥ�� �������

���� ����, Constraint
- �ش� �÷����� ���� ����(����) > ������ �������� ���ϸ� �����͸� �� �ִ´�. > ��ȿ�� �˻�
- �����ͺ��̽� ���Ἲ ����(Integrity Constraint Rule - ���Ἲ ���� ����)

1. not null
- �ݵ�� ���� ������ �Ѵ�.(�ʼ���)
*/

--�޸� ���̺�
create table tblMemo
(
    seq number not null,    -- �޸��ȣ + �ʼ��Է°�(Required)
    name varchar2(20) null,     --�ۼ��� + �����Է°�(Optional)
    memo varchar2(1000) not null,   --�޸𳻿� + �ʼ�
    regdate date null   --�ۼ��ð� + ����
);

insert into tblMemo (seq, name, memo, regdate) values (1, 'ȫ�浿', '�޸��Դϴ�.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (2, null, '�޸��Դϴ�.', null);

--ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."MEMO")
insert into tblMemo (seq, name, memo, regdate) values (3, 'ȫ�浿', null, sysdate);


select * from tblMemo;


/*
1. not null

2. primary key(PK)
- �⺻Ű
- Ű(key) : �÷�
- ���̺� ������ ��� �÷��� �߿� ��ǥ�� �Ǵ� �÷� > ��� ���� �����ϴ� �������� ���
- ���̺� ������ ���� �����ϱ� ���� ���� �ĺ���
- 1���� ���̺����� �ݵ�� PK�� �����ؾ� �Ѵ�.
- PK�� ���� 1���� �÷����� ���� + ������ 2���� �÷����� PK�� �����ϴ� ��쵵 ����(����Ű, Composite Key)
- PK�� ���� ������� �ʾƵ� �ڵ����� not null�� ����ȴ�.
- PK�� ���� ������� �ʾƵ� Duplicate�� ����ȴ� > unique�� ����ȴ�. = �ߺ����� ���� �� ����.
- PK = NOT NULL + UNIQUE
*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key, --���̺��� �� ���� ���� �ĺ��� + not null + �ߺ��Ұ� 
    name varchar2(20) null,
    memo varchar2(1000) not null,
    regdate date null
);

insert into tblMemo (seq, name, memo, regdate) values (1, 'ȫ�浿', '�޸��Դϴ�.', sysdate);

-- ORA-00001: unique constraint (HR.SYS_C007186) violated
insert into tblMemo (seq, name, memo, regdate) values (1, '�ƹ���', '�׽�Ʈ���Դϴ�.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (2, '�ƹ���', '�׽�Ʈ���Դϴ�.', sysdate);

-- ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."SEQ")
insert into tblMemo (seq, name, memo, regdate) values (null, 'ȣȣȣ', '�׽�Ʈ���Դϴ�.', sysdate);


select * from tblMemo;


/*
3. unique
- �ش� �÷����� ���̺����� ���ϰ��̾�� �Ѵ�.(�ߺ����� �����ؼ��� �ȵȴ�.)
- PK�� ����
- null�� ���� �� �ִ�.
- ����� unique �ĺ��ڷ� ����ϸ� �ȵȴ�.(null�� �־)
*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    name varchar2(20) unique,
    memo varchar2(1000) not null,
    regdate date null
);

insert into tblMemo (seq, name, memo, regdate) values (1, 'ȫ�浿', '�׽�Ʈ���Դϴ�.', sysdate);

--ORA-00001: unique constraint (HR.SYS_C007189) violated
insert into tblMemo (seq, name, memo, regdate) values (2, 'ȫ�浿', '�׽�Ʈ2222���Դϴ�.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (2, null, '�׽�Ʈ2222���Դϴ�.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (3, null, '�׽�Ʈ2222���Դϴ�.', sysdate);

select * from tblMemo;


/*
4. check
- ������, ���� �� ���� ����(����� ������)
- where�� ���ǰ� ����
*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    name varchar2(20) not null,
    memo varchar2(1000) not null,
    --regdate date not null,
    --color varchar2(30) not null, --red, yellow, blue
    --page number not null --1 ~ 9
    --color varchar2(30) check(color = 'red' or color = 'yellow' or color = 'blue') not null,
    color varchar2(30) check(color in ('red', 'yellow', 'blue')) not null,
    --page number check(page >=1 and page <=9) not null
    page number check(page between 1 and 9) not null,
    --regdate date check(regdate between to_date('2018-01-01', 'yyyy-mm-dd') 
    --                                                            and to_date('2018-12-31', 'yyyy-mm-dd')) not null    
    --regdate date check(to_char(regdate, 'hh24') between 0 and 11) not null --�������� �޸� �ۼ� ����
    regdate date check(to_char(regdate, 'd') between 2 and 6) not null --���Ͽ��� �ۼ� ����
);

insert into tblMemo (seq, name, memo, regdate, color, page) 
        values (1, 'ȫ�浿', '�׽�Ʈ���Դϴ�.', sysdate, 'red', 3);

--ORA-02290: check constraint (HR.SYS_C007201) violated
--ORA-02290: check constraint (HR.SYS_C007202) violated
insert into tblMemo (seq, name, memo, regdate, color, page) 
        values (2, 'ȫ�浿', '�׽�Ʈ���Դϴ�.2222', sysdate, 'red', 1);

select * from tblMemo;


/*
5. default
- �÷� �⺻��
- �ش� �÷����� ���� ���� ������ null�� �Է��ϴ� ��� �ڵ����� �̸� �غ�� �⺻���� �ִ´�. 
*/
drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    name varchar2(20) default '�͸�' null,
    memo varchar2(1000) not null,
    regdate date not null
);

insert into tblMemo (seq, name, memo, regdate)  values (1, 'ȫ�浿', '�׽�Ʈ���Դϴ�', sysdate);
insert into tblMemo (seq, memo, regdate)  values (2, '�׽�Ʈ���Դϴ�', sysdate);

select * from tblMemo;



drop table tblMemo;

create table tblMemo
(
    seq number primary key, --�޸��ȣ(PK)
    name varchar2(30) not null, --�ʼ���
    memo varchar2(1000) check(length(memo) > 10) not null, --üũ����
    regdate date default sysdate not null, --�⺻��
    color varchar2(10) unique null --�ߺ��� ��� ����(null�� ����)
);

insert into tblMemo (seq, name, memo, regdate, color)
    values (1, 'ȫ�浿', '�ȳ��ϼ���. ȫ�浿�Դϴ�.', sysdate, 'red');

insert into tblMemo (seq, name, memo, regdate, color)
    values (2, 'ȫ�浿', '�׽�Ʈ', sysdate, 'yellow'); --ORA-02290: check constraint (HR.SYS_C007219) violated
insert into tblMemo (seq, name, memo, regdate, color)
    values (2, 'ȫ�浿', '�׽�Ʈ�׽�Ʈ�׽�Ʈ�׽�', sysdate, 'yellow');

insert into tblMemo (seq, name, memo, regdate, color)
    values (3, 'ȫ�浿', '�׽�Ʈ�׽�Ʈ�׽�Ʈ�׽�', sysdate, 'yellow');--ORA-00001: unique constraint (HR.SYS_C007221) violated

insert into tblMemo (seq, name, memo, regdate, color)
    values (3, 'ȫ�浿', '�׽�Ʈ�׽�Ʈ�׽�Ʈ�׽�', sysdate, null);
    
insert into tblMemo (seq, name, memo, regdate, color)
    values (4, 'ȫ�浿', '�׽�Ʈ�׽�Ʈ�׽�Ʈ�׽�', null, null);

select * from tblMemo;


/*
���� ������ ����� ���

1. �÷� ���ؿ��� ����� ���(���� �����ߴ� ���)
    - �÷��� ������ �� ���� ������ �߰��ϴ� ���
    - 1 : 1 ����(�÷� 1�� : ���� 1��)
    - �÷��� �ڷ��� �������
    - �÷��� �ڷ��� [constraint �����] �������

2. ���̺� ���ؿ��� ����� ���
    - pk, fk, check, uq : ����
    - nn, default : �Ұ���
    a. create
    b. alter //X

*/
drop table tblMemo;

create table tblMemo
(
    --seq number primary key
    --seq number constraint aaa primary key
    seq number constraint tblmemo_seq_pk primary key, --���̺��_�÷���_�����������
    memo varchar2(1000) 
        constraint tblmemo_memo_ck  --30����Ʈ �ȳѾ�� ����(****)
            check(length(memo) > 10) 
        not null
);

--ORA-00001: unique constraint (HR.AAA) violated
--ORA-00001: unique constraint (HR.TBLMEMO_SEQ_PK) violated
--ORA-00001: unique constraint (HR.SYS_C007224) violated
insert into tblMemo (seq) values (1); 

--ORA-02290: check constraint (HR.TBLMEMO_MEMO_CK) violated
insert into tblMemo (seq, memo) values (1, '������'); 


drop table tblMemo;

-- ���̺� ���ؿ��� ������� �߰��ϱ�
create table tblMemo
(
    seq number,
    memo varchar2(1000) not null,
    color varchar2(30),
    page number(1),
    
    -------------------- ������ �÷� ����
    -------------------- ������׸��� ���� ����(���̺� ����)
    -- ������(���õ� �ڵ峢�� ����)
    -- not null�� �÷����ؿ����ۿ� ���Ǹ� ���Ѵ�.(���̺� ���ؿ����� �Ұ���)
    constraint tblmemo_seq_pk primary key(seq),
    constraint tblmemo_color_ck check(color in ('white', 'black')),
    constraint tblmemo_page_ck check(page between 1 and 9)
    
    --constraint tblmemo_regdate_default default(regdate) sysdate --X
    --constraint tblmemo_seq_uq unique(color),
);



drop table tblMemo;

create table tblMemo
(
    seq number constraint tblmemo_seq_pk primary key, 
    memo varchar2(1000) 
        constraint tblmemo_memo_ck  
            check(seq between 1 and 10) 
        not null --attempted to define a column check constraint that references another column.
);





















