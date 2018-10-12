-- ex11_gropuby.sql
/*

group by ��
- ���ڵ���� Ư�� �÷���(1�� �̻�)�� ���缭 �׷��� ������ �۾�
- ������
- �׷��� �� ������?
    1. �׷��� ������ �����ؼ� �����Ϸ���? ���� ������ �ϱ� ���ؼ�? : X
    2. ���� ���� �׷��� ���� �и� > ������ ���̺�� ���� : X
    3. ������ �������� �׷캰�� �����Լ��� �����ϱ� ���ؼ� : O(group by ���� ����)

- group by �÷���
    : �׷��� �����µ� ������ �Ǵ� �÷���(1�� or �� �̻�)

- group by ����
- select �÷�����Ʈ from ���̺�� [where ��] [group by ��] [order by��]

- group by ��� �� �÷�����Ʈ�� �� �� �ִ� ���
    a. ���� �Լ�(�ָ���*****)
    b. group by�� ��� �÷�
    c. a�� b�� �����ϰ�� ��� �Ұ���

*/
-- tblinsa. �μ���(�׷�) ���(����) �޿�?
select round(avg(basicpay)) from tblinsa; --155���� + ��ü ���� ��� �޿�

-- �μ� ����?
select distinct buseo from tblinsa;

select round(avg(basicpay)) from tblinsa where buseo = '�ѹ���'; -- 171����
select round(avg(basicpay)) from tblinsa where buseo = '���ߺ�'; -- 138����
select round(avg(basicpay)) from tblinsa where buseo = '������'; -- 160����
select round(avg(basicpay)) from tblinsa where buseo = '��ȹ��'; -- 185����
select round(avg(basicpay)) from tblinsa where buseo = '�λ��'; -- 153����
select round(avg(basicpay)) from tblinsa where buseo = '�����'; -- 141����
select round(avg(basicpay)) from tblinsa where buseo = 'ȫ����'; -- 145����


-- tblinsa. �μ���(�׷�) ���(����) �޿�?
-- �����Լ�, group by ��� �÷� : ���� ��
-- ������ �÷� : ���� ��
select buseo, round(avg(basicpay))  from tblinsa group by buseo;


select name, ssn from tblinsa;

-- �������� ���? �������� ���? > ������ �׷��� ���� �� count() �Լ� ����
select count(*), ssn from tblinsa group by substr(ssn, 8, 1);
select count(*), substr(ssn, 8, 1) from tblinsa group by substr(ssn, 8, 1);

select
    count(decode(substr(ssn, 8, 1), '1', 1)) as ����������, 
    count(decode(substr(ssn, 8, 1), '2', 1)) as ���������� 
from tblinsa;


-- �Ի��� �� ���� : �� ���� ��� �Ի�?
select to_char(ibsadate, 'mm'), count(*) from tblinsa
    group by to_char(ibsadate, 'mm')
        --order by to_char(ibsadate, 'mm') asc;
        order by count(*) desc;


select substr(name, 1, 1), count(*) from tblinsa
    group by substr(name, 1, 1)
        order by count(*) desc, substr(name, 1, 1) asc;


-- �鸸�� ������ �׷� > ������ �׷� ���?
select floor(basicpay / 1000000) * 100 || '������', count(*) from tblinsa
    group by floor(basicpay / 1000000);


-- ���� ���� : from > where > group by > select > order by

-- ����?
-- tblinsa. 60�� �������� ������ buseo���� ��� �޿��� �������ÿ�.
-- �߰�����. �� ������ ������ 2�鸸�� �̻��� ����鸸 ������ buseo���� �׷� ���� > ��� �޿�
select buseo, round(avg(basicpay)), count(*) --3.
    from tblinsa --1.
        group by buseo; --2.

select buseo, round(avg(basicpay)), count(*) --4.
    from tblinsa --1.
        where basicpay >= 2000000 --2.
            group by buseo; --3.

-- p205
-- cte, with, merge �н�

--
--
--create table testPivot
--(
--    name varchar2(10),
--    season varchar2(10),
--    amount number(3)
--);
--
--insert into testPivot (name, season, amount) values ('�����', '�ܿ�', 10);
--insert into testPivot (name, season, amount) values ('�����', '�ܿ�', 5);
--insert into testPivot (name, season, amount) values ('�����', '��', 10);
--insert into testPivot (name, season, amount) values ('�����', '����', 10);
--insert into testPivot (name, season, amount) values ('������', '����', 10);
--insert into testPivot (name, season, amount) values ('������', '��', 10);
--insert into testPivot (name, season, amount) values ('����', '��', 10);
--insert into testPivot (name, season, amount) values ('����', '��', 5);
--insert into testPivot (name, season, amount) values ('����', '����', 10);
--insert into testPivot (name, season, amount) values ('����', '����', 10);
--insert into testPivot (name, season, amount) values ('����', '�ܿ�', 10);
--
--
--select name, season, sum(amount) from testPivot
--    group by name, season;
--
--select * from testPivot
--    pivot (sum(amount) for season in ('��', '����', '����', '�ܿ�'));



select * from tblZoo where family = '�����';

--���� ������? �� ������?
select born, count(*) from tblZoo group by born;

select family, round(avg(leg)), sum(leg), count(*), min(leg), max(leg) 
    from tblZoo 
        group by family;


select sizeof, born, wing, count(*) from tblZoo
    group by sizeof, born, wing;


-- select(3) + group by(2) + where(1)
select * from tblZoo;


select thermo, count(*) from tblZoo
    group by thermo;

select thermo, count(*) from tblZoo
    where born = 'young'
        group by thermo;

select thermo from tblZoo
    where born = 'young';



/*
having ��
- group by ���� �ݵ�� �Բ� ���
- ������(where ���� ���� ����)
- from ��(��� ���ڵ� ��ȯ, ������ ��ȯ) -> ���� -> where ��(�� ���ο� ���� ���� & ����) -> ��� -> �����ϴ� ���ڵ� ��ȯ
- group by ��(���ڵ� �׷� ����) -> ��� �Լ� ���� -> ��� �Լ� ���� �� ���� -> having(��� �Լ��� ���� ����) -> ��� -> �����ϴ� �׷� ��ȯ
*/

select buseo, round(avg(basicpay)) --3.
    from tblinsa --1.
        group by buseo; --2.

select buseo, round(avg(basicpay)) --4.
    from tblinsa --1.
        where basicpay >= 1500000 --***2.
            group by buseo; --3.

select buseo, round(avg(basicpay)) --4.
    from tblinsa --1.
        group by buseo --2.
            having avg(basicpay) >= 1500000; --*** 3.

-- ������� : from -> where -> group by -> having -> select -> order by
select buseo, round(avg(basicpay)) --5.
    from tblinsa --1.
        where basicpay >= 1500000 --2.
            group by buseo --3.
                having avg(basicpay) >= 1500000 --4.
                    order by round(avg(basicpay)) asc; --6


select * from tblZoo;

select born, count(*), avg(leg) from tblZoo
    where fly = 'n'
        group by born
            having avg(leg) <= 2;
















