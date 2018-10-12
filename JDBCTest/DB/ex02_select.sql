--ex02_select.sql

/*

SQL�� ��ҹ��ڸ� �������� �ʴ´�.
1. SQL Ű����� �빮�ڷ� ����
2. ��ü �ĺ��ڴ� �ҹ��ڷ� ����

*/
select * from tabs;
SELECT * FROM tabs;
SELECT * FROM TABS;

/*


����Ŭ �⺻ ���ڵ�
1. ~ 8i : EUC-KR
2. 9i ~ ���� : UTF-8


SQL �ڷ���
- DBMS�� ���� ���̰� ����(���� ȣȯ �ȵ�)
- ����Ŭ �ڷ���
- p239

1. ������
    - ���� + �Ǽ�
    a. NUMBER
        - (��ȿ�ڸ�) 38�ڸ� ������ ���ڸ� ǥ��
        - 20byte
        - number(precision, scale)
            1. precision : �Ҽ� ���ϸ� ������ ��ü �ڸ���(1 ~ 38�ڸ�)
            2. scale : �Ҽ��� ���� �ڸ���
        ex) number : 38�ڸ����� ǥ�� ������ ��� ����(����, �Ǽ� ����)
              number(3) : �ִ� 3�ڸ�����  ǥ���� ������ ����(-999 ~ 999)
              number(4,2) : �ִ� 4�ڸ����� ǥ���� ������ ���� + �Ҽ����� �ڸ����� ����(-99.99 ~ 99.99)
              number(10,3) : -9999999.999 ~ 9999999.999
        - ������ ���ͷ� ǥ��
            1. ���� : 10
            2. �Ǽ� : 3.14
        
        
        

2. ������
    - ������ + ���ڿ�
    - �ڹ��� String
    
    a. CHAR, NCHAR
        - ���� �ڸ���
        - char(n) : n(1 �̻��� ����), n�ڸ� ���ڿ�
        - �ִ� ũ�� : 2000����Ʈ
        - �ּ� ũ�� : 1����Ʈ
        ex) char(3) : 3����Ʈ���� ������ �� �ִ� ���ڿ�
        ex) char(10) : ������(1�� ~ 10��), �ѱ�(1�� ~ 3��)
    
    b. VARCHAR2, NVARCHAR2
        - ���� �ڸ���
        - varchar2(n) : n(1 �̻��� ����), n�ڸ� ���ڿ�
        - �ִ� ũ�� : 4000����Ʈ
        - �ּ� ũ�� : 1����Ʈ
        ex) varchar2(3) : 3����Ʈ���� ������ �� �ִ� ���ڿ�
        ex) varchar2(10) : ������(1�� ~ 10��), �ѱ�(1�� ~ 3��)
    
    c. N�� ����
        - National ���� > �����ڵ� ����
        - N�� ���� �ڷ����� ��� ���ڸ� 2����Ʈ�� �����Ѵ�.
        - N�� �Ⱥ��� �ڷ����� DBMS�� �⺻ ���ڵ����� �����Ѵ�.(UTF-8)
        - �������� ���ڰ� ���� ���� �� ���
        - nchar(n), nvarchar2(n) : n(���ڼ�)
        
        ex) char(10) > 'ȫ�浿' > 9����Ʈ ����
        ex) nchar(10) > 'ȫ�浿' > 6����Ʈ ����
    

3. ��¥ �ð���
    a. DATE
        - ��¥ + �ð� ����
        - Calendar�� ����
        - 7byte
        - �ּ� ���� : �ʱ���
    
    b. TIMESTAMP
        - DATE ������
        - ������(10-e9) ǥ��
    
    c. INTERVAL
        - �ð�
        - ƽ�� ����

4. ��뷮 �ڷ���
    a. lob(��), Large Object
        1. BLOB
        2. CLOB

*/


-- ���̺� �����ϱ�
-- ���̺� = �÷��� ����
drop table tblType;

create table tblType (
    --�÷� ����
    --�÷��� �ڷ��� �������
    --num1 number(4,2)
    --txt nchar(10)
    regdate date
);


-- insert��(�� ����)
insert into tblType (num1) values (100);
insert into tblType (num1) values (200);
insert into tblType (num1) values (300);
insert into tblType (num1) values (3.14);
insert into tblType (num1) values (-300);
insert into tblType (num1) values (123456789012345678901234566789012345678);

--123456789012345678901234566789012345679000000000000
insert into tblType (num1) values (123456789012345678901234566789012345678901234567890);




insert into tblType (num1) values (1);
insert into tblType (num1) values (10);
insert into tblType (num1) values (100);
insert into tblType (num1) values (1000); --ORA-01438: value larger than specified precision allowed for this column
insert into tblType (num1) values (3.5); --�ڵ����� ������ ��ȯ(�ݿø�)




-- num1 number
insert into tblType (num1) values (9999);
insert into tblType (num1) values (999);
insert into tblType (num1) values (99);
insert into tblType (num1) values (99.9);
insert into tblType (num1) values (99.99);
insert into tblType (num1) values (99.9999);
insert into tblType (num1) values (99.9899);



-- ����Ŭ�� ���� ��� ǥ��
insert into tblType (txt) values ('abc');
insert into tblType (txt) values ('abcdefghij');
insert into tblType (txt) values ('abcdefghijk'); --ORA-12899: value too large for column "HR"."TBLTYPE"."TXT" (actual: 11, maximum: 10)

insert into tblType (txt) values ('ȫ�浿'); --9����Ʈ
insert into tblType (txt) values ('ȫ�浿��'); --12����Ʈ 




insert into tblType (txt) values ('aaaaaaaaaa'); 
insert into tblType (txt) values ('aaaaaaaaaaa');

insert into tblType (txt) values ('ȫ�浿'); 
insert into tblType (txt) values ('ȫ�浿��'); 
insert into tblType (txt) values ('ȫ�浿�Ծȳ��ϼ���.'); 

insert into tblType (txt) values ('ȫ�浿�Ծȳ��ϼ���..'); 




insert into tblType (regdate) values ('2018-08-21');
insert into tblType (regdate) values (sysdate); 


-- select��
select * from tblType;


-- p240

                                                                                

















