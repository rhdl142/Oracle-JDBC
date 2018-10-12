-- ex06_casting.sql
/*

����ȯ �Լ�

1. to_char() : ���� -> ����
2. to_char() : ��¥ -> ���� (***)
3. to_number() : ���� -> ����
4. to_date() : ���� -> ��¥ (***)


1. to_char() : ���� -> ����
- char to_char(�÷���, ���Ĺ��ڿ�)

���� ���ڿ� ���� ���
a. 9 : ���� 1�ڸ��� ���� 1���� �ٲٴ� ����(���ڶ� �ڸ��� �������� ä���.)
b. 0 : ���� 1�ڸ��� ���� 1���� �ٲٴ� ����(���ڶ� �ڸ��� '0'���� ä���.)
c. $ : �޷� ǥ��
d. L : ������ ��ȭ ǥ��(Locale)
e. . : �Ҽ��� ǥ��
f. , : õ���� ǥ��

*/
select 100 as "aaaaaaaaaaaaaaaaaaa.", '100' as "bbbbbbbbbbbbbbbbbbb." from dual;

select to_char(100, '999') from dual; -- 100 -> '100'
select to_char(100, '000') from dual; -- 100 -> '100'

select to_char(10, '999') from dual; -- 10 -> '10'
select to_char(10, '000') from dual; -- 10 -> '10'

select to_char(1, '999') from dual; -- 1 -> '1'
select to_char(1, '000') from dual; -- 1 -> '1'

select to_char(1, '0000000000') from dual;

-- �������� ���ں��� �����ڿ��� �ڸ����� �� ũ�� ����ȯ �Ұ�(####)
select to_char(1000, '999') from dual; -- 1000 -> '1000'
select to_char(1000, '000') from dual; -- 1000 -> '1000'

select 
    weight, 
    weight || 'kg', 
    to_char(weight, '999') || 'kg', 
    to_char(weight, '000') || 'kg',
    lpad(weight, 3, '0') || 'kg'
from tblname;

-- ������ : trim() ó���� �ؼ� ������� ������ ���� �� ����ϴ� ���� ����
select 
    '@' || to_char(-100, '999'),
    '@' || to_char(100, '999')
from dual;

select length(to_char(1, '999')), '@' || ltrim(to_char(1, '999')) from dual;


select to_char(100, '$999') from dual;
select to_char(100, '999��') from dual;
select to_char(100, 'L999') from dual;
select to_char(100, '999') || '��' from dual;


select to_char(123.456, '999.999') from dual;
select to_char(123.456, '9999.99') from dual; --�ݿø� + ���ڿ� ��ȯ
select to_char(123.456, '9999') from dual; 

--String.format("%,d", 10000000);
select to_char(1000000, '9,999,999') from dual;
select to_char(1000000, '9,9,9,9,9,9,9') from dual;



/*
2. to_char() : ��¥ -> ���� (**********)
- cahr to_char(�÷���, '���� ���ڿ�')

���� ���ڿ� ���� ���
- yyyy
- yy
- month
- mon
- mm
- day
- dy
- ddd, dd, d
- hh(hh12), hh24
- mi
- ss
- am(pm)
*/


--���� �ȵǴ� �ൿ(���� ������ ���� ����� �ٸ��� ���´�.) > date���� ���ڿ��� ����� �ϸ� �ȵȴ�.
select substr(sysdate, 1, 10) from dual;
select substr(sysdate, 9, 2) from dual;
select substr(sysdate, 11) from dual;


select sysdate from dual;
select to_char(sysdate, 'yyyy') from dual; -- 2018��(4�ڸ�)(********************)
select to_char(sysdate, 'yy') from dual; -- 18��(2�ڸ�) X
select to_char(sysdate, 'month') from dual; --8��, ������(Ǯ����)
select to_char(sysdate, 'mon') from dual; --8��, ������(���)
select to_char(sysdate, 'mm') from dual; --08, 2�ڸ� ����(********************)
select to_char(sysdate, 'day') from dual; --����, ������(Ǯ����)
select to_char(sysdate, 'dy') from dual; --����, ������(���)
select to_char(sysdate, 'ddd') from dual; --236. ���� ��� ��ĥ°����?
select to_char(sysdate, 'dd') from dual; --24. �̹��� ��� ��ĥ°����?
select to_char(sysdate, 'd') from dual; --6. �̹��� ��� ��ĥ°����? > ����(1~7)
select to_char(sysdate, 'hh') from dual; --11. �ð�(12�ð�)
select to_char(sysdate, 'hh24') from dual; --11. �ð�(24�ð�) (**********)
select to_char(sysdate, 'mi') from dual; --02. ��
select to_char(sysdate, 'ss') from dual; --44. ��
select to_char(sysdate, 'am') from dual; --����/����
select to_char(sysdate, 'pm') from dual; --����/����

select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'hh24:mi:ss') from dual;
select to_char(sysdate, 'am hh:mi:ss') from dual;


--�������� ���
-- 12���� �Ի��� ������?
select * from tblinsa where to_char(ibsadate, 'mm') = '12';

-- ����Ͽ� ����� ������?
select title, to_char(adddate, 'day') from tbltodo where to_char(adddate, 'd') = '7';

--����(�Ի� ��)
select * from tblinsa order by to_char(ibsadate, 'mm') asc;


-- ����!!!!!
-- 1997�� ~ 1999�� ���̿� �Ի��� ����?
select * from tblinsa
        --where ibsadate between '1997-01-01' and '1999-12-31'; --�սǺ� �߻� 
        --where ibsadate between '1997-01-01' and '2000-01-01'; --���׺� �߻�
        --where ibsadate between '1997-01-01 00:00:00' and '1999-12-31 23:59:59'; --��� �Ұ���
        where to_char(ibsadate, 'yyyy') between 1997 and 1999;



/*
3. to_number() : ���� -> ����
- number to_number(���ڿ�)
- �ڹ� : Integer.parseInt(���ڿ�)
*/

select to_number('123') * 2 from dual;
select '123' * 2 from dual; -- "123" * 2


/*
4. to_date() : ���� -> ��¥ (***)
- date to_date(�÷���, '���� ���ڿ�')
- ���� ���ڿ��� 2���� ����
*/

--SQL�� ��¥�ð� �������� ���ͷ��� ���ƿ� ���� ���ڿ� or ��¥�ð� �� ����
select '2018-08-24', sysdate from dual; --���ڿ�
select * from tblinsa where ibsadate > '2018-08-24'; --��¥�ð�

select to_date('2018-08-24', 'yyyy-mm-dd'), sysdate from dual; --******* 
select to_date('2018-08-24 11:37:40', 'yyyy-mm-dd hh24:mi:ss'), sysdate from dual; --*******






























