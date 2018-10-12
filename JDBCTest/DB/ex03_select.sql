-- ex03_select.sql

/*

select ��
- DML, DQL
- ���� �߿��� ����(************************************************************************************)

1. ���̺�κ��� ����Ǿ� �ִ� ������ �� ���ϴ� �����͸� �������� ��ɾ�

2. ���̺��� �ƴѰ����κ��� �����͸� �������� ��ɾ�

*** SQL�� ���� 1��(2��) �̻��� ��(��)�� ���յǾ� ������ �����. 
*** �� ���� �켱����(�������)�� ���!!!
*** ; : ���� ������


select ���� ����

select �÷�����Ʈ from ���̺��;
select �÷�����Ʈ from ���̺�� where��;
select �÷�����Ʈ from ���̺�� where�� order by��;
select �÷�����Ʈ from ���̺�� where�� group by�� order by��;
select �÷�����Ʈ from ���̺�� where�� group by�� having�� order by��;
select �÷�����Ʈ from ���̺�� [where��] [group by��] [having��] [order by��];


*/

select hr.tblcountry.name from hr.tblcountry;

select name from tblcountry;

/*

���� ���� : from > select

1. select �÷�����Ʈ
    - ������ �÷��� �����Ѵ�.

2. from ���̺�
    - ������ ���̺��� �����Ѵ�.

*/

select * from tblcountry;

select * 
from tblcountry;

select * 
    from tblcountry;
    
select *
from tblcountry;

select continent
from tblcountry;


-- ���� �����ϴ� ���̺���?
-- 1. Ŭ���̾�Ʈ �� ���� ���
-- 2. select ��ɾ� + �ý��� ���̺�
select * from tabs;

-- tblcountry ���̺� > � ����?
-- 1. Ŭ���̾�Ʈ �� ���� ���
-- 2. desc ��ɾ�
desc tblcountry;


-- tblcountry�κ��� ��� �÷��� ��� ���� �������ÿ�.
select name, capital, population, continent, area
from tblcountry;

-- * : wildcard > ��� �÷�
select * 
from tblcountry;

select area, name, capital, population, continent
from tblcountry;



-- �Ϻ� �÷� ��������
select name, capital from tblcountry;


desc tblname;
select * from tblname;

select first, last from tblname;
select last, first from tblname;

-- ORA-00942: table or view does not exist
select last, first from tblnama;

-- ORA-00904: "FIRS": invalid identifier
select last, firs from tblname;

-- ������ �÷��� ������ �������°� �����ϴ�.
select nick from tblname;
select nick, nick from tblname;
select nick, length(nick) from tblname;


-- �÷����� ����
select last, first, weight - 10, weight from tblname;

-- BMI
select last, first, weight / (height * height) * 10000 from tblname;

-- ���ڿ� ����(+)
select last, first, last || first from tblname;

select * from zipcode;

select zipcode, sido || ' ' || gugun || ' ' || dong || ' ' || bunji from zipcode;


-- ����Ŭ�� �÷��� �����ϴ� ���� ��� ���̺��� �÷����� �ش� �÷��� ���� ǥ������ �ȴ�.

-- �÷��� ��Ī(Alias) ���̱�
-- : ����(�̸��� ������ �ٲ۴�)
-- : ���� ���� ��� ���� > �ǵ��� ��ū(Token, ������� ���ڿ�)�� ���
select last, first, last || first as fullname, length(last || first) as length from tblname;

select last, first, weight as ������ ������ from tblname;
select last, first, weight as "������ ������" from tblname;
select last, first, weight as "select" from tblname; -- ���� ���� ����!!!!!!!!!

select last, first, "select" from A;

/*

������

1. ��� ������
    - +, -, *, /
    - %(����) -> �Լ��� ����(mod())

2. �� ������
    - >, >=, <, <=
    - =(==), <>(!=)

3. �� ������
    - and(&&), or(||), not(!)

4. ���ڿ� ������
    - ||(concat)

5. ���� ������
    - ���� X

6. 3�� ������
    - ���� X

7. ���� ������
    - ���� X

8. SQL ������
    - in, between, like, is, any, all ��...

*/











































