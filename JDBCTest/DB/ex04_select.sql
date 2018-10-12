-- ex04_select.sql

/*

select �� : �Ϻ� �÷� ��ȯ
from �� : ��� ������ ��ȯ
where �� : �Ϻ� ���ڵ� ��ȯ

���� ���� : from > where > select

where ��
- select * from ���̺� where ��;
- ������ ������ �� ������ �����ϴ� ���ڵ常�� �������� ����(�Ϻ� ���ڵ� ��ȯ)
- �ַ� �÷����� ������� �� ���� or �� ������ ���� �ش� ���ڵ带 ������ �� �Ǵ�

*/

select * from tblname; --��� �÷� + ��� ���ڵ�
select first, last from tblname; --�Ϻ� �÷� + ��� ���ڵ�
select * from tblname where gender = 'f'; --��� �÷� + �Ϻ� ���ڵ�

select first, last from tblname where gender = 'f'; --�Ϻ� �÷� + �Ϻ� ���ڵ�

--��� ���̺�, Result Table, �����, ResultSet
select first, last --3. 2�����κ��� ���� ��� ���̺� ���ϴ� �÷��� ���� �� ���� ��� ���̺� ��ȯ�Ѵ�.
    from tblname -- 1. ���̺� ������ ���Ѵ�. 
        where gender = 'f'; --2. ������ �����ϴ� ���ڵ常 �����ϴ� ���̺��� ���Ѵ�.

select first, last, weight from tblname where weight > 70;
select first, last, weight from tblname where weight > 70 and weight < 100;
select first, last, weight from tblname where weight > 70 and weight < 100 and gender = 'm';


-- ��ȣ(=)
select * from tblinsa;
desc tblinsa;

select * from tblinsa where buseo = '�λ��';
select * from tblinsa where jikwi = '����';
select * from tblinsa where ibsadate = '1998-10-11'; --����
select * from tblinsa where ibsadate = '98/10/11'; --�����

-- RRRR-MM-DD HH24:MI:SS

--���ʽ�
-- : �ַ� where�� �÷����� ����� ������ ����Ѵ�.
select * from tblname where height > 170;
select * from tblname where 1 = 1; --�÷��� ���X

--�α��� > SQL Injection
--��ȣ : 1111
--��ȣ : 1111' or 1=1;--
select Ư����� from ȸ�����̺� where id='hong' and pw='1111' or 1=1;--';



/*

�� ���꿡 ���Ǵ� �ڷ���
1. ������
2. ������ -> str1.compareTo(str2) : ���� �ڵ尪 ��
3. ��¥ �ð��� -> tick��

*/
select * from tblname where height > 160;
select * from tblname where last > '��';
select * from tblname where first < '�缮';
select * from tblinsa where ibsadate >= '1999-08-01';


-- where ���� ����� ������..
/*

between
- where ������ ���(�������� ���)
- ���� ���� ����
- �÷��� between �ּڰ� and �ִ�
- ������ ���
- �ּڰ�(inclusive), �ִ�(inclusive)
- between ��� ���� > ��(����) ������ ��� �ӵ����� ������. > ������.

*/

--������ 60�̻� ~ 80����
select * from tblname where weight >= 60 and weight <= 80;
select * from tblname where weight between 64 and 66;

select * from tblname where first between '��' and '��';

select * from employees where first_name between 'D' and 'G';

select * from tblinsa where ibsadate between '1998-01-01' and '1998-12-31';

select * from tblinsa where not ibsadate between '1998-01-01' and '1998-12-31';



/*

in
- where ������ ���(�������� ���)
- ������ ���� ��(���ð� �߿��� �ϳ��� �����ϸ� ����) 
- �÷��� in (������ ��)

*/
select * from tabs;
select * from tbldiary;

-- ������ '�帲' or '��' ����..
select * from tbldiary where weather = '�帲' or weather = '��' or weather = '�Ȱ�' or weather = '����';
select * from tbldiary where weather in ('�帲','��','�Ȱ�','����');

-- tblinsa > '��ȹ��', '������', '�ѹ���'
-- + '����', '����' + '����', '��õ'
-- + �޿� 250���� ~ 300����
select * from tblinsa 
        where buseo in ('��ȹ��','������','�ѹ���') 
                and jikwi in ('����','����') 
                and city in ('����','��õ')
                and basicpay between 2500000 and 3000000;


/*

like
- where ������ ���(�������� ���)
- ���� ��(Ư���� ������ ������ ���ڿ� �˻�)
- �������� ������� ���(����, ��¥ ����X)
- ���� ǥ���İ� ����
- �÷��� like '���� ���ڿ�'

���� ���ڿ� ���� ���
1. _ : ������ ���� 1��
2. % : ������ ���� 0�� ~ ���Ѵ�

*/
select * from tblinsa;
select * from tblinsa where name like '��__';
select * from tblinsa where name like '_��_';
select * from tblinsa where name like '__��';

select * from employees where first_name like 'D____';
select * from employees where first_name like 'D_v__';

select * from employees where first_name like 'D%';
select * from employees where first_name like '%d';
select * from employees where first_name like '%d%'; --��� �� ����.    


/*

null
- �ڹ��� null ������ ǥ��
- ����ִ� �÷��� ����
- SQL�� null�� ������ ����� �� �� ����.(�ǿ����� �ڰ�X)
- SQL�� null�� ���Ե� ������ �ϸ� �׻� ����� null ��ȯ

null ����
- where ������ ���
- �÷��� is null

*/
select * from tblcountry;

--�α����� ���� ������� ���� �����?
select * from tblcountry where population = null;
select * from tblcountry where population is null;

--�α����� ���� ����� �����?
select * from tblcountry where not population is null;
select * from tblcountry where population is not null;

--tblinsa. ����ó�� ������ ����?
select name, tel from tblinsa where tel is null;

--������. �뿩���̺�(������, �ݳ���)
--���� �ݳ����� ���� ������?
select * from �뿩���̺� where �ݳ��� is null;

-- ���� ���� ���� �ϵ�?
select * from tbltodo where completedate is null;

--�̹� �Ϸ��� �ϵ�?
select * from tbltodo where completedate is not null;




/*

distinct
- �÷� ����Ʈ���� ���
- distinct �÷���
- �ߺ��� ����
- null�� �������� �� ������ �ν��Ѵ� -> null ������ ���ڵ�鵵 �ߺ��� ���Ű� �ȴ�.

*/
select distinct continent from tblcountry;

-- tblcountry���� � ������� �ֽ��ϱ�?
-- tblinsa���� � �μ��� �ֽ��ϱ�?
select distinct buseo from tblinsa;

-- ������ ���� �ִ���?
select distinct gender from tblname;

-- tblinsa ������ ��� �˴ϱ�?
select distinct jikwi from tblinsa;

-- tblname ���� ����?
select distinct last from tblname;

select distinct first from tblname;

select distinct population from tblcountry where population is not null;


-- distinct�� �÷�����Ʈ�� �� 1���� ���� �� �ִ�.
-- distinct Ű���� ���� ��� �÷� ����Ʈ�� ���ļ� �ߺ��� �˻縦 �Ѵ�.
select distinct price, qty from tblhousekeeping;
select distinct price from tblhousekeeping;



/*

case
- �÷� ����Ʈ���� ���
- ���������� ���
- ��� Ƚ�� ����
- �ڹ� : if + switch ��

*/

select last || first as name, gender from tblname;

select last || first as name, case when gender = 'm' then '����' when gender = 'f' then '����' end from tblname;

select last || first as name, 
    case 
        when gender = 'm' then '����' 
        when gender = 'f' then '����' 
    end as gender
from tblname;

select  
    name,
    case
        when continent = 'AS' then '�ƽþ�'
        when continent = 'EU' then '����'
        when continent = 'AF' then '������ī'
        --else '��Ÿ'
        else continent
    end as ���
from tblcountry;


select 
    last || first as name, 
    weight / (height * height) * 10000 as bmi,
    case
        when weight > 80 then '��ü��'
        when weight > 60 then '����ü��'
        when weight > 0 then '��ü��'
        else '����'
    end as ü�߻���
from tblname;

select * from tblmen;
select * from tblwomen;

-- �ַ��� ���ڸ� ��������
select * from tblmen where couple is null;

-- �ַ�����? Ŀ������? ���� ��� ��������
select name, 
    case
        when couple is not null then '����ģ�� ����'
        when couple is null then '����ģ�� ����'
    end as ¦��
from tblmen;


-- tblinsa. �޿� -> ����(����)�� sudang * 2 �� ����
select name, jikwi, basicpay, sudang,
    case
        when jikwi = '����' then sudang * 2
        when jikwi = '����' then sudang * 2
        else sudang
    end as "�̹��� ���� ����"
from tblinsa;


-- �Ϸ�� �� vs ������ �� : ����
select 
    title,
    case
        when completedate is not null then '�Ϸ��'
        when completedate is null then '������'
    end as "�Ϸ�����"
from tbltodo;


/*

���� ���� : from > where > select > order by 

����, Sorting
- ������� ���ڵ��� ������ ����(���� ���̺���� �����ϴ�.)
- ���� ���̺��� ���ڵ� ������ DBMS�� �˾Ƽ� �Ѵ�.(�Ű�X)
- order by ��
- order by �÷��� [asc|desc]
- select�������� ��� ����(insert, update ����.. ���� �Ұ�)
- select �÷�����Ʈ from ���̺�� where �� order by ��
- asc : ��������(ascending)
    a. ���� : 10 -> 20 -> 30
    b. ���� : '��' -> '��' -> '��'
    c. ��¥�ð� : '2016' -> '2017' -> '2018'
    
- desc : ��������(descending)
*/
select * from tblname order by first asc;
select * from tblname order by weight desc;

select * from tblinsa order by ibsadate desc;

select * from tblinsa order by city, buseo asc, jikwi desc, name asc, basicpay desc;

-- ������ ����� �Լ��� ��ȯ���� ������ ������ �� �� �ִ�.
select name, basicpay, sudang from tblinsa order by (basicpay + sudang) desc;

select name, basicpay, sudang 
from tblinsa 
where buseo='������' 
order by (basicpay + sudang) desc;


select name --3.
from tblinsa --1. 
where buseo='������' --2. 
order by (basicpay + sudang) desc; --4










