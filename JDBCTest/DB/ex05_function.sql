
-- ex05_function.sql
/*

����Ŭ(SQL) �Լ�
- �����Լ�, ���ڿ��Լ�, �����Լ�, ��¥�ð��Լ� ��..

�����Լ�
- ����Լ�, �����Լ�, �����Լ�
- ���� ����� ����� ����
- ������ ���� �Է¹޾� ���� ���� ��ȯ�Ѵ�.(***)

1. count() : ����
2. sum() : ����(����)
3. avg() : ���
4. max() : �ִ�
5. min() : �ּڰ�

*/

/*
1. count()
- ���� ������ ��ȯ�Ѵ�.
- number count(�÷���) **
- number count(�����)
- number count(���)
- Ư�� �÷��� �������� �� �� �÷����� null�� ������, null�� ������ ���ڵ�� ī��Ʈ���� ����
- *�� �������� �� null�� ������� �׻� ��� ���ڵ��� ī��Ʈ�� ��ȯ
*/

select * from tblname;
select count(*) from tblname;
select * from tblname where gender = 'f';
select count(*) from tblname where gender = 'f';
select count(*) from tblname where gender = 'm';

select * from tblcountry; --14��
select count(name) from tblcountry; --Ư�� �÷����� ī��Ʈ
select count(*), count(name), count(capital), count(population), count(continent), count(area) from tblcountry;

-- tblinsa. ����ó�� ���� ���� ����? ���?
select count(*) from tblinsa where tel is null;
select count(*) - count(tel) from tblinsa;

-- tblinsa. ����ó�� �ִ� ����? ���?
select count(*) from tblinsa where tel is not null;
select count(tel) from tblinsa;

-- tbltodo
select * from tbltodo;
-- ���� �ؾ��� ���� � ���Ҵ���?
select count(*) from tbltodo where completedate is null;
select count(*) - count(completedate) as cnt from tbltodo;


-- tblinsa
-- ���￡ �ִ� ���� ���?
select count(*) from tblinsa where city = '����'; --20��

-- 1000000000 -> ��� ���� ���ʽ� ���� -> 1/N -> ���� �� �� �޴���?
select count(*) from tblinsa; -- 60��
select 1000000000 / count(*) from tblinsa; 

-- �μ��� 7�� -> 7 ��ȯ : tblinsa���� �μ��� �� � �ֽ��ϱ�? + distinct
select buseo from tblinsa;
select count(buseo) from tblinsa;
select count(distinct buseo) from tblinsa;


--���� �Լ� ��� �� ������ ��!!!!!!!!!!!!!!
--1. �����Լ��� ����� �Ϲ� �÷��� �Բ� �÷� ����Ʈ�� ������ �� ����.
-- ORA-00937: not a single-group group function
--2. �����Լ��� ����� where������ ����� �� ����.
-- where�� : ���ڵ��� ���� ������(���ο� ���� ����)
-- ORA-00934: group function is not allowed here
select count(*), name from tblinsa;

--��� �޿�
select avg(basicpay) from tblinsa; --155����

--������ �� ��� �޿����� ���� ���� ��������???
select * from tblinsa where basicpay >= avg(basicpay);



/*
2. sum()
- number sum(�÷���)
- �ش� �÷����� ������ ��ȯ
- ���� �÷����� �������..
*/
select sum(weight) from tblname; --843kg
select sum(height) from tblname; --1723cm
select sum(basicpay) from tblinsa; --

select sum(name) from tblinsa; --ORA-01722: invalid number
select sum(ibsadate) from tblinsa; --ORA-00932: inconsistent datatypes: expected NUMBER got DATE

select sum(weight), sum(weight * 10), sum(weight) * 10 from tblname;

--�ѱ޿�, �Ѽ���
select sum(basicpay), sum(sudang), sum(basicpay + sudang) from tblinsa;


/*
3. avg()
- number avg(�÷���)
- ���� �÷��� �������
*/
select 10, height from tblname;
select sum(height), sum(10), count(*), count(10) from tblname;


select avg(height) from tblname;
select avg(weight) from tblname;

--** ����
select population from tblcountry;

--��� ������ ��� �α���?
select count(*) from tblcountry; --14
select sum(population) from tblcountry; --202652

select 202652 / 14 from tblcountry;
select 202652 / 14 from dual; --14475
select * from dual;

select 202652 / 14;


-- avg()�� null�� �����ϰ� ����� ����.
-- ���α��� / 14 (X)
-- ���α��� / 13 (O)
select avg(population) from tblcountry; --15588
select 202652 / 13 from dual;
select population from tblcountry; 

select sum(population) / count(population) from dual;  --avg()
select sum(population) / count(*) from dual; 

-- 10�� / 20�� -> avg()
-- 10�� / 30�� -> sum(����) / count(*)
select avg(ibsadate) from tblinsa; --X

/*
4. max()
5. min()
- object max(�÷���)
- object min(�÷���)
- �ش� �÷����� �� ���� ū�� or ���� ������ ��ȯ
- ����, ����, ��¥ ��..
*/
select basicpay from tblinsa;
select max(basicpay), min(basicpay) from tblinsa;

select max(height), min(weight) from tblname;

select min(ibsadate) from tblinsa where buseo='�ѹ���';

select max(nick) from tblname;


-- ����Ŭ(DBMS)�� ��� �ĺ���(���̺��,�÷���,������,DB Object ��)�� ���̰� �ִ� 30���̳�
select
    count(*) as "�� ������",
    sum(basicpay) as "�� �޿� ��",
    avg(basicpay) as "��� ���� ��� �޿�",
    max(basicpay) as "�ִ� �޿�",
    min(basicpay) as "�ּ� �޿�",
    max(basicpay) - avg(basicpay) as "�ִ� �޿���",
    avg(basicpay) - min(basicpay) as "�ּ� �޿���"
from tblinsa;


/*
���� ���� �Լ�(���� �Լ�)

1. round()
- �ݿø�
- number round(�÷���)
- number round(�÷���,�Ҽ������ڸ���)
*/
select 3.14, round(3.14) from dual;
select 3.64, round(3.64) from dual;

select round(avg(basicpay)) from tblinsa;
select round(avg(basicpay), 2) from tblinsa;
select round(avg(basicpay), 0) from tblinsa;

select round(name) from tblinsa; --ORA-01722: invalid number
select round(ibsadate), ibsadate from tblinsa;
select round(sysdate), sysdate from dual; --��¥ �ð� ����(����,����)


/*
2. floor(), trunc()
- ������ ����
- ���� �Լ�
- number floor(�÷���)
- number trunc(�÷���)
- number trunc(�÷���, �Ҽ������ڸ���)
*/
select 123.654, round(123.654), floor(123.654), trunc(123.654), trunc(123.654, 1) from dual;

/*
3. ceil()
- ������ �ø�
- number ceil(�÷���)
*/
select 123.456, round(123.456), floor(123.456), ceil(123.156) from dual;
select ceil(123.00000000000000000000000000000000001) from dual;
select ceil(123.000000000000000000000000000000000001) from dual;
select ceil(123) from dual;

/*
4. mod()
- ������ �Լ�
- number mod(������, ����)
*/
select mod(10, 3) from dual;

-- 100�� -> ��ð� ���?
select floor(100 / 60) as "��", mod(100, 60) as "��" from dual;


/*
���ڿ� �Լ�

1. upper(), lower(), initcap()
- varchar2 upper(�÷���)
*/

select 'studentName', upper('studentName'), lower('studentName'), initcap('studentName') from dual;

select * from employees;
select upper(first_name), lower(last_name) from employees;

--�˻�
--�˻��� ����� �Է� : an
select * from employees
    --where first_name like 'D%';
    --where first_name like '%an%';
    where upper(first_name) like '%' || upper('an') || '%';



-- ����Ŭ Ű����� ��ҹ��� ���о��Ѵ�.
-- ����Ŭ �����ʹ� ��ҹ��� �����Ѵ�.
-- ����Ŭ�� ������ �Ľ�(�ؼ�)�ϴ� �������� ���� �빮�ڷ� ��ȯ��Ų��.
select * from employees;


/*
2. substr
- ���ڿ� ����
- �ڹ� : substring
- varchar2 substr(�÷���, ������ġ, ����)
- varchar2 substr(�÷���, ������ġ) : ������
- SQL�� ������ 1���� ����(****)
*/
select '�����ٶ󸶹ٻ������īŸ����' from dual;
select substr('�����ٶ󸶹ٻ������īŸ����', 3, 5) from dual;
select substr('�����ٶ󸶹ٻ������īŸ����', 3) from dual;


select name, substr(name, 1, 1) as ��, substr(name, 2) as �̸� from tblinsa;

select name, ssn,
    '19' || substr(ssn, 1, 2) as "�¾ �⵵",
    substr(ssn, 3, 2) as "�¾ ��",
    substr(ssn, 8, 1) as "����",
    case
        when substr(ssn, 8, 1) = '1' then '����'
        when substr(ssn, 8, 1) = '2' then '����'
    end as "����",
    case
        when substr(ssn, 3, 2) >= 3 and substr(ssn, 3, 2) <= 5 then '��' 
        when substr(ssn, 3, 2) >= 6 and substr(ssn, 3, 2) <= 9 then '����'
        when substr(ssn, 3, 2) >= 10 and substr(ssn, 3, 2) <= 11 then '����'
        else '�ܿ�'
    end as "����"
from tblinsa;


-- ���� ������ ��������
select * from tblinsa
    --where ssn like '______-1______';
    --where ssn like '%-1%';
    --where substr(ssn, 8, 1) = '1';
    --where substr(ssn, 8, 1) = '1' or substr(ssn, 8, 1) = '3' or substr(ssn, 8, 1) = '5';
    --where substr(ssn, 8, 1) in ('1','3','5','7','9');
    where mod(substr(ssn, 8, 1), 2) = 1;


--���� �Լ�
-- : �÷�����Ʈ(O), where��(X), order by��(X)

--�����Լ�,���ڿ��Լ�
-- : �÷�����Ʈ(O), where��(O), order by��(O)

--�������� �¾ �� ������� ����
select * from tblinsa order by substr(ssn, 3, 2), substr(ssn, 5, 2);
select * from tblinsa order by basicpay + sudang;


/*
3. length()
- ���ڿ� ����
- number length(�÷���)
*/
select email, length(email) from employees;
select round(avg(length(email))) from employees;


select email, length(email) from employees where length(email) >= 5 order by length(email) asc;

/*
4. instr()
- �ڹ� : indexOf()
- �˻����� ��ġ�� ��ȯ
- number instr(�÷���, �˻���)
- number instr(�÷���, �˻���, ������ġ)
- ��ã���� 0�� ��ȯ
*/
select '�ȳ��ϼ���. ȫ�浿��' from dual;
select instr('�ȳ��ϼ���. ȫ�浿��', 'ȫ�浿') from dual;
select instr('�ȳ��ϼ���. ȫ�浿��. �߰�����. ȫ�浿��', 'ȫ�浿', 11) from dual;
select instr('�ȳ��ϼ���. ȫ�浿��', '�ƹ���') from dual;

select count(*) from tblinsa
    --where name like '%��%';
    where instr(name, '��') > 0;


/*
5. lpad(), rpad()
- left padding, right padding
- varchar2 lpad(�÷�, ����, ����)
*/

select first_name, lpad(first_name, 20, '��'), rpad(first_name, 20, '��') from employees;
select lpad('-', 20, '-') from dual;

select name, basicpay, lpad(' ', ceil(basicpay / 1000000) + 1, '��') as ��� from tblinsa;


/*
6. trim(), ltrim(), rtrim()
- varchar2 trim(�÷���)
*/

select '    ȫ�浿    ', trim('    ȫ�浿    '), ltrim('    ȫ�浿    '), rtrim('    ȫ�浿    ') from dual;

-- char vs varchar2
create table tblString
(
    name1 char(50) not null,
    name2 varchar2(50) not null
);

insert into tblString (name1, name2) values ('ȫ�浿', 'ȫ�浿');

commit;

select * from tblString;
select * from tblString where name1 = 'ȫ�浿'; --char -> char���� �������� ����ϸ� �ڵ����� trim() ����
select * from tblString where name2 = 'ȫ�浿'; --varchar2
select * from tblString where name1 = name2;
select length(name1), length(name2) from tblString;


select * from tblString where rtrim(name1) = name2;


/*
7.replace()
- ���ڿ� ġȯ �Լ�
- varchar2 replace(�÷���, ã�����ڿ�, �ٲܹ��ڿ�)
*/
select 'ȫ�浿', replace('ȫ�浿', 'ȫ', '��') from dual;

select
    last || first as name,
    gender,
    case
        when gender = 'm' then '����'
        when gender = 'f' then '����'
    end as gender2,
    replace(replace(gender, 'm', '����'), 'f', '����') as gender3
    -- gender.replace("m","����").replace("f","����")
from tblname;


select name, 
    replace(replace(replace(replace(replace(continent, 'AS', '�ƽþ�'), 'SA', '�Ƹ޸�ī'), 'EU', '����'), 'AF', '������ī'), 'AU', 'ȣ��')
from tblcountry;

/*
8. decode() ************
- ���ڿ� ġȯ
- replace() ����
- varchar2 decode(�÷���, ã�����ڿ�, �ٲܹ��ڿ� [, ã�����ڿ�, �ٲܹ��ڿ�] [, ã�����ڿ�, �ٲܹ��ڿ�]...)
- ��ã���� null ��ȯ(******)
*/
select name, decode(continent, 'AS', '�ƽþ�', 'EU', '����', 'AF', '������ī', 'SA', '�Ƹ޸�ī', 'AU', 'ȣ��') from tblcountry;

--�ѹ��� ������ ���?
select count(*) from tblinsa where buseo = '�ѹ���'; --7��

--������ ������ ���?
select count(*) from tblinsa where buseo = '������'; --16��

--ȫ���� ������ ���?
select count(*) from tblinsa where buseo = 'ȫ����'; --6��

--���� 3���� ������ ������ ���� + ����� 1���� ���̺� �ް� �ʹ�.
/*
[�ѹ���]       [������]       [ȫ����]
         7               16                 6
*/
select
    --count(buseo) as "��ü",
    count(decode(buseo, '�ѹ���', 1)) as "�ѹ���",
    count(decode(buseo, '������', 1)) as "������",
    count(decode(buseo, 'ȫ����', 1)) as "ȫ����"
from tblinsa;

select
    --count(buseo) as "��ü",
    decode(buseo, '�ѹ���', 1) as "�ѹ���",
    decode(buseo, '������', 1) as "������",
    decode(buseo, 'ȫ����', 1) as "ȫ����"
from tblinsa;

-- ���� ���� ���? ���� ���?
select
    count(*) as "��ü ������",
    count(decode(substr(ssn, 8, 1), '1', '1')) as "���� ������",
    count(decode(substr(ssn, 8, 1), '2', '1')) as "���� ������"
from tblinsa;

-- tblinsa. '��' ���? '��', '��', '��', '��'
select
    count(decode(substr(name, 1, 1), '��', 1)) as "�达",
    count(decode(substr(name, 1, 1), '��', 1)) as "�̾�",
    count(decode(substr(name, 1, 1), '��', 1)) as "�ھ�",
    count(decode(substr(name, 1, 1), '��', 1)) as "����",
    count(decode(substr(name, 1, 1), '��', 1)) as "�־�"
from tblinsa;


/*
nvl, nvl2
- null �Լ�, null value
- object nvl(�÷���, ��ü��)
- �ش� �÷��� null�̸� ��ü���� ��ȯ�ϰ�, not null�̸� ���� �÷����� ��ȯ�Ѵ�.
*/

select name, nvl(population, 0) from tblcountry;
select name, nvl(population, 100) + 10 from tblcountry;
select name, nvl(population, '�α��� �̱���') from tblcountry;

desc tblinsa;

select name, nvl(tel, '010-1234-5678') from tblinsa;
select name, nvl(tel, '����ó ����') from tblinsa;



/*
��¥ �ð� �Լ�

1. sysdate
- ���� �ð� ��ȯ(����Ŭ ���� �ð� - ���� ����)
- date sysdate

date + number(��) = date
date - number(��) = date
date - date = number(��)


*/
select sysdate from dual;

-- ��¥ ����
-- date + ����(��) : �ϴ��� ���� ����
select sysdate, sysdate + 1 as ����, sysdate - 1 as ���� from dual;

select name, ibsadate + 10000 from tblinsa where name = 'ȫ�浿';

-- ������(�뿩�Ⱓ : 14��)
select ����, �뿩��, �뿩�� + 14 as �ݳ��� from ��������;


-- �ð� - �ð� = �ð�(��)
select name, ibsadate, ceil(sysdate - ibsadate) from tblinsa;
select name, ibsadate, ceil((sysdate - ibsadate) / 365)  from tblinsa;


--
select title, ceil(completedate - adddate) from tbltodo;

select title, ceil(nvl(completedate, sysdate) - adddate) from tbltodo
    where ceil(nvl(completedate, sysdate) - adddate) > 7
        order by ceil(nvl(completedate, sysdate) - adddate) desc;



/*
2. last_day
- �ش� �ð��� ���Ե� ���� ������ ��¥
- date last_day(�÷���)
*/
select last_day(sysdate) from dual;


/*
3. months_between
- number months_between(date, date)
- �ð� ���� ���(���� : ��, ��)
- �ð� ���� ���(���� : ��, ��, ��, ��) -> date - date
*/
select
    name,
    ibsadate,
    ceil(sysdate - ibsadate) as "�ٹ��ϼ�",
    ceil((sysdate - ibsadate) / 365) as "�ٹ����", --��� X
    ceil(months_between(sysdate, ibsadate)) as "�ٹ�������", --��� O
    ceil(months_between(sysdate, ibsadate) / 12) as "�ٹ����" --��� O
from tblinsa;


/*
4. add_months
- date add_months(date, number)
- ������ ���� ����
*/

select sysdate as "����", sysdate + 1 as "����(��)", add_months(sysdate, 1) as "������(��)" 
    , add_months(sysdate, 12) as "���� ���ó�¥"
    , add_months(sysdate, -12) as "�۳� ���ó�¥"
from dual;

/*
�ð�, �ð� ����
1. date + ����(��), date - ����(��)
2. date - date = �ð���(��)
3. months_between(date, date) = �ð���(��) : 3��
4. add_months(date, ����(��)) : 1��
*/

--p248 ~ p250
































--z