-- ex08_sequence.sql
/*

������, Sequence
- ������ ��ü
- DB Object �� �ϳ�
- DB �����ڿ��� �ĺ��ڵ��� �����ϱ� ���ϵ��� ��� ����
- �������� ������ �ߺ����� ���� ������ ���ڸ� ��ȯ�ϴµ� �ִ�. �߰��� �ǳʶٴ� ���ڿ� ������ ���� ����(*****). 
- ����� �߰��� ����ִ� ���ڰ� ���� �ʾƾ� �Ѵٸ� ������ ��ü�� ������� ���� -> ���� �����ڰ� ������ ��

������ ��ü ����ϱ�
1. create : ����
2. alter : ����
3. drop : ����

������ ��ü �����ϱ�
- create sequence ��������;
- create sequence ���̺��(�÷���)�ĺ���;

������ ��ü ����ϱ�
1. testSeq.nextval : 1 ������ ���� �Ϸ� ��ȣ ��ȯ(Queue.poll())
2. testSeq.currval : ���� ��Ű�� ���� ���� �Ϸ� ��ȣ ��ȯ(Queue.peek())

*/
create sequence testSeq; --������ ��ü�� Ư�� ���̺� ���������� �ʴ�.(�ַ� ���̺�� �������� ����� �Ѵ�.)

select testSeq.nextval from dual;
select testSeq.currval from dual;

drop sequence testSeq;

--�޸���
drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    name varchar2(20) not null,
    memo varchar2(1000) not null
);

create sequence memoSeq;

insert into tblMemo (seq, name, memo) values (1, 'ȫ�浿', '�޸��Դϴ�.');
insert into tblMemo (seq, name, memo) values (memoSeq.nextval, 'ȫ�浿', '�޸��Դϴ�.');
insert into tblMemo (seq, name, memo) values (memoSeq.nextval, 'ȫ�浿', null);

select * from tblMemo;

select memoSeq.currval from tblMemo;
select memoSeq.currval from dual;
select memoSeq.nextval from dual;


-- ���̺��� �ĺ���
-- 1. ����
-- 2. ���ڿ�

-- ��ǰ ���̺�
-- : ��ǰ�ڵ�, ��ǰ��, ����, ����
-- : ��ǰ�ڵ�(PK) -> 1, 2, 3, 4, 5..
-- : ��ǰ�ڵ�(PK) -> 'AAA01', 'AAB02', 'ABC05'...
create table tblProduct
(
    code varchar2(5) primary key,   --��ǰ�ڵ�
    name varchar2(100) not null,    --��ǰ��
    price number not null, --����
    qty number not null --����
);

create sequence productSeq;

select 'AA' || ltrim(to_char(productSeq.nextval, '000')) from dual;

insert into tblProduct (code, name, price, qty)
    values ('AA' || ltrim(to_char(productSeq.nextval, '000')), '��ǰ��', 1000, 10);

select * from tblProduct;


-- ������ ��ü �ʱ�ȭ(1���� �ٽ� �����ϵ���)
drop sequence productSeq;
create sequence productSeq;

select productSeq.nextval from dual;


-- ������ ��ü�� �Ϸ� ��ȣ�� �ʱ�ȭ�� �� �ִ� ������ ����.
-- > ��� ������ ��ü�� ���� ������ �� �������� �ʱⰪ���� ����

drop sequence productSeq;

-- ���ϴ� ����� �������� ����� ���
create sequence productSeq; --�⺻��(���� ���� ���)
create sequence productSeq �ɼ� �ɼ� �ɼ� �ɼ� �ɼ�; --����� ������

drop sequence productSeq;
create sequence productSeq
        --increment by 1 --����ġ(���/���� ��� ��� ����) ****
        --start with 10 --���۰�(seed) ****
        --maxvalue 20 --�ִ�(������ ���� �߻�)
        --minvalue 10
        --cycle
        cache 20 --���� ���̴� ����(X)
        ;

select productSeq.nextval from dual;


show user;















