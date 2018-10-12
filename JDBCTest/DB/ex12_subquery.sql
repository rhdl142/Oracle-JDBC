-- ex12_subquery.sql
/*

��������, Sub Query
- ���� ����, �κ� ����
- SQL �ȿ� �� �ٸ� SQL�� ����ִ� ����
- ���������� ����� �ִ� ��ġ(������ �����Ͱ� �ʿ��� ���̸� �� ����� �����ϴ�.)
    a. where �� : ���������� ������� ���ǰ����� ����Ѵ�.
    b. �÷�����Ʈ : ���������� ������� �ϳ��� �÷������� ����Ѵ�.
    c. from �� : ���������� ������� �ϳ��� ���̺�� ��� > �ζ��� ��(Inline View)
    d. order by ��
    e. group by ��
*/

select * from tblhousekeeping order by price desc;

-- �ܰ��� ���� ���� ������ �̸�?
-- 1. ���� ���� �ܰ�? ��?
select max(price) from tblhousekeeping;

-- 2. ��� �׸� �� �ܰ��� 15000���� ����?
select item from tblhousekeeping where price = 15000;


-- �����Լ��� where ������ ����� �Ұ����ϴ�.(***)
select item from tblhousekeeping where price = max(price);


-- ���� ����
-- ���� ������ ���� ������ �Ŀ� ��ȯ�Ǵ� ������� ���� ������ ����ϰ��� �Ҷ�..
select item from tblhousekeeping where price = (select max(price) from tblhousekeeping);
select item from tblhousekeeping where price = (select min(price) from tblhousekeeping);
select item from tblhousekeeping where price < (select avg(price) from tblhousekeeping);


-- select buseo, count(*) from tblinsa group by buseo;
select avg(basicpay) from tblinsa; --155����

select count(*) from tblinsa where basicpay >= (select avg(basicpay) from tblinsa);

select count(*) from tblinsa 
    where basicpay >= (select avg(basicpay) from tblinsa where substr(ssn, 8, 1) = '1') and substr(ssn, 8, 1) = '1';
    

-- '������' ���� �� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ������ ��ü ���� �� ����Դϱ�?
select count(*) from tblinsa
    where basicpay >= (select min(basicpay) from tblinsa where buseo = '������');

-- '������' ���� �� ���� ������ �޿����� �� ���� �޴� ������ �� ���?
select name, buseo, jikwi from tblinsa
    where basicpay >= (select basicpay from tblinsa 
                                            where ibsadate = (select min(ibsadate) from tblinsa 
                                                                                    where buseo = '������'));
-- test(aaa(bbb()))


-- hr
select * from employees;
select * from departments;
select * from locations;

-- ���� �� 'Steven King'��(employees) �Ҽӵ� �μ���(departments) ��� ������ �ִ��� �ּҸ�(locations) �˷��ּ���.


select department_id from employees
    where first_name = 'Steven' and last_name = 'King';

select location_id from departments
    where department_id = 90;

select * from locations
    where location_id = 1700;

select * from locations
    where location_id = (select location_id from departments
                                                         where department_id = (select department_id from employees
                                                                                    where first_name = 'David' and last_name = 'Austin'));





-- �÷�����Ʈ���� �������� ����ϱ�

-- ��� �������� 'ȫ�浿'���� �󸶸� �� �ްų� �� �޴��� �ñ�?
select basicpay from tblinsa where name = 'ȫ�浿'; --2610000

select name, basicpay, basicpay - 2610000 as "����" from tblinsa where name <> 'ȫ�浿';


select name, basicpay, basicpay - (select basicpay from tblinsa where name = '������') as "����"
    , (select basicpay from tblinsa where name = '������') as "������ �޿�"
        from tblinsa 
                where name <> '������';


-- ���� �Լ�
-- 1. where ������ ��� �Ұ� > where ������ ���������� ����ϸ� �����ϴ�.
-- 2. �÷�����Ʈ�� �Ϲ� �÷��� ���� �Լ��� ���� ��� �Ұ� > �÷�����Ʈ�� ���������� ����ϸ� �����ϴ�.

select round(avg(basicpay)) as "��� �޿�" from tblinsa;
select name, basicpay from tblinsa;

select name, basicpay
    , (select round(avg(basicpay)) from tblinsa) as "��� �޿�" 
    , (select round(max(basicpay)) from tblinsa) as "�ִ� �޿�"
    , (select round(min(basicpay)) from tblinsa) as "�ִ� �޿�" 
        from tblinsa;


select name, basicpay
    , basicpay - (select round(avg(basicpay)) from tblinsa) as "��� �޿�" 
    , basicpay - (select round(max(basicpay)) from tblinsa) as "�ִ� �޿�"
    , basicpay - (select round(min(basicpay)) from tblinsa) as "�ִ� �޿�" 
        from tblinsa;




-- from ������ ���������� ����ϱ�
-- �ζ��� ��
-- �ӽ� ���̺� ����(�͸� ���̺� - ���� �Ұ�)
select * from tblname where gender = 'f';

select * from (select * from tblname where gender = 'f');

select name, jikwi, city from (select name, jikwi as "����", city from tblinsa where buseo = '������'); --�ӽ� ������ ���̺�

select name, ����, city, firstname from (select name, substr(name, 2, 2) as firstname, jikwi as "����", city from tblinsa where buseo = '������'); --�ӽ� ������ ���̺�
    



-- where �������� ��������������..

-- 1. ���������� ����� �������� ���
-- : �� �����ڸ� ����Ѵ�.(���ϰ�)

-- 2. ���������� ����� �������� ���
-- : in�� ����Ѵ�.(���߰� & ���Ű�)

-- 3. ���������� ����� ���� �÷��� ���
-- : ������ ���

-- 4. ���������� ����� ���� �÷��� ���
-- : = �����ڿ� () �� ����ؼ� �ٴ�� �񱳸� ���� ����Ѵ�.(������ ������ �ٸ��� �ȵȴ�.***)


-- 'ȫ�浿'�� '�̼���'�� ���� �μ��� ���� ����� �������ÿ�.
--ORA-01427: single-row subquery returns more than one row
select * from tblinsa
    where buseo = (select buseo from tblinsa where name = 'ȫ�浿' or name = '�̼���');

select * from tblinsa
    where buseo = '��ȹ��' or buseo = '���ߺ�';

select * from tblinsa
    where buseo in ('��ȹ��', '���ߺ�');

select * from tblinsa
    where buseo in (select buseo from tblinsa where name = 'ȫ�浿' or name = '�̼���');


select * from tblinsa
    where buseo in (select buseo, city from tblinsa where name = 'ȫ�浿');


-- '�����'�� ���� �μ��� �Ҽ� + ���� ������ ���� ����??
select * from tblinsa where name = '�����';

select * from tblinsa where buseo = '���ߺ�' and jikwi = '���';--���� ����


select * from tblinsa 
    where buseo = (select buseo from tblinsa where name = '�����') 
                and jikwi = (select jikwi from tblinsa where name = '�����');


select * from tblinsa 
    where (buseo, jikwi, city, to_char(ibsadate, 'yyyy')) = (select buseo, jikwi, city, to_char(ibsadate, 'yyyy') from tblinsa where name = '�����');



-- �÷� ����Ʈ�� ���������� ����ϴ� ��쿡��..
-- : ���������� ������ ���ϰ� ��ȯ�ؾ� �Ѵ�.(1���� ����) �������� ��� �Ұ����ϴ�.

-- 1. ���� �÷� + ���� ��
select first, last, (select avg(weight) from tblname) as "��� ������" from tblname;

-- 2. ���� �÷� + ���� �� : 100% �Ұ���
select first, last, (select height from tblname where height > 170) from tblname;

-- 3. ���� �÷� + ���� ��
select first, last, (select height, weight from tblname where first='�缮') from tblname;



-- from ������ ����ϴ� ��쿡��..
-- : 1 ~ 4������ ��� �� ��� ����
-- : where ��(���� ����), select ��(���� �÷����� ����), from ��(���̺��� ����)

-- 1. ���� �÷� + ���� ��
-- 2. ���� �÷� + ���� ��
-- 3. ���� �÷� + ���� ��
-- 4. ���� �÷� + ���� ��














--\z