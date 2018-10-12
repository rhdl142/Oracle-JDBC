-- ex21_plsql.sql
/*

PL/SQL
- Procedural Language Extensions to SQL(+ ����, ����)
- ǥ�� SQL : �� ������ ���(��ɾ�鰣�� ������ ����. ��ɾ�鳢�� ���������� �ʴ�.)
- ǥ�� SQL + ������ ��� �߰� -> ����Ŭ �߰� SQL -> PL/SQL
- �߰��� �κ� : �ڹ��� ���α׷��� ��� �߰�(����, ���, �޼ҵ� ��..)
- ����Ŭ ���� SQL

- ǥ�� SQL <> PL/SQL : ǥ�� SQL �ڷ����� ���� ���Ͻ��״�.
- ǥ�� SQL : ���� ������ �ʼ�X
- PL/SQL : ���� ������ �ʼ�O


SQL ó�� ���� & ����

1. ǥ�� SQL
    : Ŭ���̾�Ʈ ���� �ۼ�(select ��) > ����(Ctrl + Enter) > ��Ʈ��ũ�� ���� SQL(���ڿ�)�� DBMS ������ ����
        > DBMS ���� ���� > ���� �м�(�Ľ�) > ������(����������) > ����(��ɾ�) > ���� ����(CPU) > ��� ó�� > ��ȯ
    : ������ �ѹ� �����ߴ� ���Ǹ� �ٽ� ����(�Ȱ��� SQL�� �ٽ� ����) > ���� ������ ó������ ������ ������ �����ϰ� �ݺ�(***)

2. PL/SQL
    : Ŭ���̾�Ʈ ���� �ۼ�(select ��) > ����(Ctrl + Enter) > ��Ʈ��ũ�� ���� SQL(���ڿ�)�� DBMS ������ ����
        > DBMS ���� ���� > ���� �м�(�Ľ�) > ������(����������) + ������ ��� ����(DB) > ����(��ɾ�) > ���� ����(CPU) > ��� ó�� > ��ȯ
    : ������ �ѹ� �����ߴ� ���Ǹ� �ٽ� ����(�Ȱ��� SQL�� �ٽ� ����) > 
        Ŭ���̾�Ʈ ���� �ۼ�(select ��) > ����(Ctrl + Enter) > ��Ʈ��ũ�� ���� SQL(���ڿ�)�� DBMS ������ ����
        > DBMS ���� ���� > X > X > X > ���� ������ ��� �ε� > ���� ����(CPU) > ��� ó�� > ��ȯ


���ν���, Procedure
- �Լ�, �޼ҵ�, �����ƾ ��..
- Ư�� ������ ������ ���� ������� �����ϴ� ��ɾ��� ����
1. �͸� ���ν��� : �̸����� > ������ �������� ���� �ʴ� ���ν��� > ���� ���(ǥ�� SQL ����) > Ȯ�� ��ɶ����� ���
2. �Ǹ� ���ν��� : �̸����� > ������ �������� �ϴ� ���ν��� > ���� ���(Pl/SQL ����. ����) > ��� ���� + Ȯ�� ���
        
*/
select * from tblInsa;


 SET SERVEROUTPUT ON ; 
 
set serveroutput on;

-- ���ν��� ����(�ڵ� �� {})
begin -- {
    -- ���� ��ɾ� : ǥ�� SQL + PL/SQL
    dbms_output.put_line('Hello'); -- System.out.println()
end; -- }

begin   
    dbms_output.put_line('Hello');
end;


/*

PL/SQL �� ����

1. 4���� Ű����� ����
a. [declare]
b. begin
c. [exception]
d. end;

2. declare
- �����, declare section
- ���α׷����� ���Ǵ� ����, ��ü ���� �����ϴ� ����
- ���� ����

3. begin
- �����, ������, executable section
- begin ~ end
- ���α׷����� ���� ���� ������� �����ϴ� ����
- ǥ�� SQL + PL/SQL(����, ���� ��..)
- ���� �Ұ���

4. exception
- ���� ó����, exception section
- catch �� ����
- ���� ó�� �ڵ带 �����ϴ� ����
- ���� ����

5. end;
- ���� ����
- ���� �Ұ���

6. PL/SQL �� = ����� + ����� + ����ó����

�ڹ�
{  
    {
        
    }
}

����Ŭ
begin
    begin
    
    end;
end;


declare
    ����, �ڿ� ����
begin
    ������
exception
    ����ó����
end;




�ڷ��� & ����

�ڷ���
- ǥ�� SQL ����(���� ���� + Ȯ��)

���� �����ϱ�
- ������ �ڷ��� [not null] [default ��]
- ǥ�� SQL���� �÷� �����ϴ� ������ ����
- ������ ���� : ����(select ��)�� ����� ���ڰ��� �����ϴ� �뵵

������
- ǥ�� SQL ����

ǥ�� SQL ���� ������
    - �÷��� = ��; // update tblInsa set buseo = '������';
    - �뵵 : �÷��� ����

PL/SQL ���� ������
    - ���� := ��;
    - �뵵 : ������ ����

*/

declare
    num number; -- number : PL/SQL �ڷ���
    name varchar2(30); --varchar2 : PL/SQL �ڷ���
    today date; --date : PL/SQL �ڷ���
begin
    
    num := 10; --������ ���ͷ�(ǥ�� SQL ����)
    dbms_output.put_line(num);
    
    name := 'ȫ�浿';
    dbms_output.put_line(name);
    
    today := sysdate;
    dbms_output.put_line(today);
    dbms_output.put_line(to_char(today, 'yyyy-mm-dd'));
    
    today := '2018-09-04';
    dbms_output.put_line(today);
    
    
    --ORA-06502: PL/SQL: numeric or value error: character string buffer too small
    name := 'ȫ�浿�Դϴپȳ��ϼ���';
    dbms_output.put_line(name);
        
end;


select * from locations where ;


select * from employees order by hire_date asc;
select * from  departments;

select * from employees order by manager_id asc;

employees, jobs, job_history.
select * from job_history where employee_id = 101;
select * from employees where employee_id = 101;

select count(*) from employees where department_id is null;

select * from employees e inner join departments d on e.department_id = d.department_id;

select * from departments;

select count(*) from employees group by department_id; --12

declare
    num1 number;
    --num2 number not null; --��� ������ ������� end;������ �ݵ�� ���� ������ �Ѵ�.
    num3 number default 100;
    num4 number not null default 300;
    num5 number := 500; --�����(�ʱ�ȭ�� begin ������ �ַ� �Ѵ�.)
    today date := sysdate;
begin
    
    --���� �ʱ�ȭ X
    --�ٷ� ��� : �ʱ�ȭ�� ���� ���� ������ ����� �����ϴ�.(null ���� ä�� ��� ����)
    dbms_output.put_line(num1); --null ���
    
    --PLS-00218: a variable declared NOT NULL must have an initialization assignment
    --dbms_output.put_line(num2); --null ���
    
    --num3 := 200;
    dbms_output.put_line(num3);
    
    --num4 := 400;
    dbms_output.put_line(num4);
    
    
    dbms_output.put_line(num5);
    
end;

/*
���̺��� ��ȸ�� �����͸� ������ ���

*/
declare
    vbuseo varchar2(15);
begin
    --vbuseo := (select buseo from tblInsa where name = 'ȫ�浿');
    
    -- select�� ��� �÷����� ������ ���� > into
    select buseo into vbuseo from tblInsa where name = 'ȫ�浿';
    dbms_output.put_line(vbuseo);
    
end;


declare
    cnt number;
begin
    
    select count(*) into cnt from tblAddressBook where address like '����Ư����%';
    dbms_output.put_line('����Ư���� �ο��� : ' || to_char(cnt, '9,999') || '��');
    
end;

declare
    vbuseo number;
begin
    select buseo into vbuseo from tblInsa where name = 'ȫ�浿';
    dbms_output.put_line(vbuseo);    
end;


declare
    cnt varchar2(50); --����ȯ�� ������ ��Ȳ�̸� �Ͻ������� ���ش�.
begin
    select count(*) into cnt from tblAddressBook where address like '����Ư����%';
    dbms_output.put_line('����Ư���� �ο��� : ' || to_char(cnt, '9,999') || '��');
end;


declare
    vbuseo varchar2(100); --���̰� �� ū�� �������.(overflow X)
begin
    select buseo into vbuseo from tblInsa where name = 'ȫ�浿';
    dbms_output.put_line(vbuseo);    
end;


declare
    vbuseo varchar2(6);  --��������� ũ�Ⱑ ������ ���� �߻�
begin
    select buseo into vbuseo from tblInsa where name = 'ȫ�浿';
    dbms_output.put_line(vbuseo);    
end;


declare
    vpop number;
begin
    select population into vpop from tblCountry where name = '���ѹα�';
    dbms_output.put_line(vpop);    
end;


declare
    --vpop number;
    --vpop number not null;
    vpop number default 0;
begin
    -- vpop := null
    select 
        --population into vpop 
        nvl(population, 0) into vpop
    from tblCountry where name = '�ɳ�';
    dbms_output.put_line(vpop);    
end;

-- ���� ����
-- ������ ����� ���ϰ��̾� �Ѵ�.
-- : ���� �÷� + ���� ��
-- : PK ���� + ���� �÷� : select �����
-- : ���� �Լ��� �����

-- ��ȯ�Ǵ� �÷��� ������ ������
-- : N���� ��ȯ�� > N���� ����
declare
    vbuseo varchar2(15);
    vjikwi varchar2(15);
    vbasicpay number(10);
    vtotal number(11);
    vcnt number(2);
begin
    select 
        buseo, 
        jikwi, 
        basicpay, 
        basicpay + sudang,
        (select count(*) from tblInsa where buseo = i.buseo and jikwi <> '����')
        into 
        vbuseo, 
        vjikwi, 
        vbasicpay, 
        vtotal,
        vcnt
    from tblInsa i where name = 'ȫ�浿';
    dbms_output.put_line('�μ� : ' || vbuseo || ', ���� : ' || vjikwi || ', �޿� : ' || vbasicpay);    
    dbms_output.put_line('�ѱ޿� : ' || vtotal);
    dbms_output.put_line(vbuseo || '�� ���ο��� : ' || vcnt);
end;

desc tblInsa;


/*
������
- ����(�÷�)�� �ڷ����� �����ؼ� ������ �ڷ������� ����� �� �ִ�.
- ����(�÷�)�� �ڷ����� ���� �ȴ�.
- ���� ���� ����

1. %type
- ��� �÷��� �ڷ����� ���̸� �����ؼ� �ش� ������ �����ϰڽ��ϴ�.
- ����Ǵ� �׸�
    a. �ڷ���
    b. ����
    c. not null

2. %rowtype
- ���̺� ���ڵ� ������ �����ؼ� �ش� ������ �����ϰڽ��ϴ�.
- %type�� ����

*/

declare
    vname tblInsa.name%type;-- vname varchar2(20) not null
    --vname varchar2(20) not null;
    --vname char(40);
    vbuseo tblInsa.buseo%type;
    vbasicpay tblInsa.basicpay%type;
begin
    select name, buseo, basicpay into vname, vbuseo, vbasicpay from tblInsa 
        where (basicpay + sudang) = (select min(basicpay + sudang) from tblInsa);--�ɽ���
    dbms_output.put_line(vname || ' - ' || vbuseo || ' - ' || vbasicpay);
end;


declare
    vfirst tblname.first%type;
    vlast tblname.last%type;
    vheight tblname.height%type;
    vweight tblname.weight%type;
begin

    select first, last, height into vfirst, vlast, vheight from tblname
        where height = (select max(height) from tblname);
    dbms_output.put_line('���� Ű ū ��� : ' || vlast || vfirst || ' - ' || vheight);
    
    select first, last, height into vfirst, vlast, vheight from tblname
        where height = (select min(height) from tblname);
    dbms_output.put_line('���� Ű ���� ��� : ' || vlast || vfirst || ' - ' || vheight);
    
    select first, last, weight into vfirst, vlast, vweight from tblname
        where weight = (select max(weight) from tblname);
    dbms_output.put_line('���� �׶��� ��� : ' || vlast || vfirst || ' - ' || vweight);
    
    select first, last, weight into vfirst, vlast, vweight from tblname
        where weight = (select min(weight) from tblname);
    dbms_output.put_line('���� ���� ��� : ' || vlast || vfirst || ' - ' || vweight);
    
end;



declare
    oldMan tblMen.name%type; --������ģ��
    newMan tblMen.name%type; --���糲��ģ��
    newWoman tblWomen.name%type; --����ģ��
begin
    --ȫ�浿�� ����ģ�� > �ٶ� > ������
    --select * from tblMen;
    --select * from tblWomen;
    
    oldMan := 'ȫ�浿';
    newMan := '������';
    
    --1.
    select couple into newWoman from tblMen where name = oldMan;
    
    --2.
    update tblWomen set couple = newMan where name = newWoman;
    
    --3.
    update tblMen set couple = newWoman where name = newMan;
    
    --4.
    update tblMen set couple = null where name = oldMan;
    
    dbms_output.put_line('�Ϸ�');
    
end;


commit;
rollback;

select * from tblWomen;
select * from tblMen;



-- tblInsa. ���� �� �Ϻο��Ը� ���ʽ� ����. ���� ������ ������ ����
create table tblBonus
(
    seq number primary key, --�Ϸ� ��ȣ(PK)
    iseq number references tblInsa(num) not null, --���� ��ȣ(FK)
    --name varchar2(15) not null,
    bonus number not null
);
create sequence bonusSeq;


declare
    vnum tblInsa.num%type;
    vsudang tblInsa.sudang%type;
begin
    
    --1.
    select num, sudang into vnum, vsudang from tblInsa 
        where city = '����' and jikwi = '����' and to_char(ibsadate, 'yyyy') <= 1995;
    
    --dbms_output.put_line(vnum);
    --dbms_output.put_line(vsudang);
    
    --2.
    insert into tblBonus (seq, iseq, bonus) values (bonusSeq.nextval, vnum, vsudang * 3);
    
end;

select * from tblBonus;

select b.*,
    (select name from tblInsa where num = b.iseq), --���μ�
    (select city from tblInsa where num = b.iseq),
    (select jikwi from tblInsa where num = b.iseq),
    (select to_char(ibsadate, 'yyyy') from tblInsa where num = b.iseq),
    (select sudang from tblInsa where num = b.iseq)
from tblBonus b;


--tblTodo. ���� ���� ���� �Ϸ� ���� ���� ��Ͽ��� �����ϱ�
select * from tblTodo;

--��������
--rownum
select * from tblTodo where completedate is null;

select seq from tblTodo 
    where completedate is null 
        and adddate = (select min(adddate) from tblTodo where completedate is null);


select seq from
    (select seq from tblTodo where completedate is null order by adddate asc) a
        where rownum = 1;


declare
    vseq tblTodo.seq%type;
begin
    
    --1.
    select seq into vseq from tblTodo 
        where completedate is null 
            and adddate = (select min(adddate) from tblTodo where completedate is null);
    
    dbms_output.put_line(vseq);
    
    --2.
    delete from tblTodo where seq = vseq;
    
end;


select * from tblTodo;


-- PL/SQL �� ����
-- �ڷ��� + ���� ����
-- ������ �ڷ��� > ���̺�+�÷� ������
-- select ��� > ���ϰ� ��������
-- select ��� > ���Ϸ��ڵ� + ���� �÷��� ��������
-- �������� select, update, delete, insert � ����ϱ�



declare
    -- �ڷ����� ����(good) + �÷� ������ ����.(bad)
--    vfirst tblname.first%type;
--    vlast tblname.last%type;
--    vgender tblname.gender%type;
--    vheight tblname.height%type;
--    vweight tblname.weight%type;
--    vnick tblname.nick%type;
    vrow tblname%rowtype; --�÷��� ����
begin
    
    -- �÷� ������ ����.(bad)
    --select first, last, gender, height, weight, nick into vfirst, vlast, vgender, vheight, vweight, vnick
    --    from tblname where last = '��' and first = '�缮';
        
--    select * into vfirst, vlast, vgender, vheight, vweight, vnick
--        from tblname where last = '��' and first = '�缮';

    select first, last, gender, height, weight, nick into vrow
        from tblname where last = '��' and first = '�缮';
    
--    dbms_output.put_line(vfirst);
--    dbms_output.put_line(vlast);
--    dbms_output.put_line(vgender);
--    dbms_output.put_line(vheight);
--    dbms_output.put_line(vweight);
--    dbms_output.put_line(vnick);

    --dbms_output.put_line(vrow);
    dbms_output.put_line(vrow.first);
    dbms_output.put_line(vrow.last);
    dbms_output.put_line(vrow.gender);
    dbms_output.put_line(vrow.height);
    dbms_output.put_line(vrow.weight);
    dbms_output.put_line(vrow.nick);
    
    
end;


declare
    vrow tblInsa%rowtype; --10���� �÷��� ���� ���ڵ� ���� ����(�κ� �÷� ���� �Ұ���)
    vnum tblInsa.num%type; --�÷� ����
begin
    
    vnum := 1010;
    
    --select 10�� �÷� into 10�� ���� from tblInsa where num = vnum;
    --select * into vrow from tblInsa where num = vnum;
    select name, buseo, city into vrow from tblInsa where num = vnum;
    
    dbms_output.put_line(vrow.name);
    dbms_output.put_line(vrow.buseo);
    dbms_output.put_line(vrow.city);
    
end;

-- tblMen -> 1��(����) -> tblWomen : �ű��
select * from tblMen;
select * from tblWomen;

declare
    vrow tblMen%rowtype;
begin
    
    --1. '����'�� ��� ���� ��������(select)
    select * into vrow from tblMen where name = '����';
    --dbms_output.put_line(vrow.name);
    
    --2. 1���� ��� ������ tblWomen�� �߰��ϱ�(insert)
    --insert into tblWomen (name, age, height, weight, couple) values (vrow);
    insert into tblWomen (name, age, height, weight, couple) 
        values (vrow.name, vrow.age, vrow.height, vrow.weight, vrow.couple);
    
    --3. tblMen���� '����' ���� �����ϱ�(delete)
    delete from tblMen where name = '����';
    
    
end;


commit;
rollback;



/*
PL/SQL ���
- ���ͷ�
- �ڹ� : public static final double PI = 3.14;
- ������ �ڷ��� [not null] [default];
- ����� constant �ڷ��� [not null] [default];
*/

declare
    num1 number := 100;
    NUM2 constant number := 200; --***
    --NUM3 constant number; --PLS-00322: declaration of a constant 'NUM3' must contain an initialization assignment
    NUM4 constant number default 400; --default���� ����� �ʱⰪ���� ���
    NUM5 constant number not null; --?
begin
    
    --NUM3 := 300;

    dbms_output.put_line(num1);
    dbms_output.put_line(NUM2);
    --dbms_output.put_line(NUM3);
    dbms_output.put_line(NUM4);
    
    num1 := num1 * 2;
    --NUM2 := NUM2 * 2;--PLS-00363: expression 'NUM2' cannot be used as an assignment target
    
    dbms_output.put_line(num1);
    dbms_output.put_line(NUM2);
end;

commit;


-- ���
-- ���ǹ� : if��

set serveroutput on;

declare
    vnum number;
begin
    vnum := -10;
    
    if vnum > 0 then -- {
        dbms_output.put_line('���');
    end if; -- }
    
    if vnum > 0 then
        dbms_output.put_line('���');
    else
        dbms_output.put_line('����ƴ�');
    end if;
    
    if vnum > 0 then
        dbms_output.put_line('���');
    elsif vnum < 0 then
        dbms_output.put_line('����');
    else
        dbms_output.put_line('zero');
    
end;

-- Ŀ�� ���� -> ���� ���̰� ���� ���� Ŀ�� -> ���� ����? ���� ����?
select * from tblMen;
select * from tblWomen;

select 
    case
        when m.age - w.age > 0 then '���� ����'
        when m.age - w.age < 0 then '���� ����'
        else '����'
    end as result
from tblMen m
    inner join tblWomen w
        on m.name = w.couple
            where (m.age + w.age) = (select max(m.age + w.age) from tblMen m
                                                                                                inner join tblWomen w
                                                                                                    on m.name = w.couple);


declare
    mage number;
    wage tblWomen.age%type;
begin

    select m.age, w.age into mage, wage from tblMen m
        inner join tblWomen w
            on m.name = w.couple
                where (m.age + w.age) = (select min(m.age + w.age) from tblMen m
                                                                                                    inner join tblWomen w
                                                                                                        on m.name = w.couple);
    
    if mage > wage then
        dbms_output.put_line('���ڰ� �����Դϴ�.');
    elsif wage > mage then
        dbms_output.put_line('���ڰ� �����Դϴ�.');
    else
        dbms_output.put_line('���������Դϴ�.');
    end if;
    
end;


-- ���� �ð��� Ȧ�����̸� ���缮 ������ +1kg ����, ¦�����̸� ��� ������ +1kg ����
begin
    if mod(to_char(sysdate, 'ss'), 2) = 0 then
        dbms_output.put_line('¦��');
        update tblWomen set weight = weight + 1 where name = '�ڳ���';
    else
        dbms_output.put_line('Ȧ��');
        update tblMen set weight = weight + 1 where name = 'ȫ�浿';
    end if;
end;

select * from tblMen;
select * from tblWomen;


select * from tblBonus;

-- ���� ��ȣ -> ����,����(���� 3��), �븮,���(���� 2��)

declare
    vnum tblInsa.num%type;
    vjikwi tblInsa.jikwi%type;
    vsudang tblInsa.sudang%type;
begin

    vnum := 1055;
    
    --1.
    select jikwi, sudang into vjikwi, vsudang from tblInsa where num = vnum;
    dbms_output.put_line(vjikwi);
    
    --2.
    if vjikwi in ('����','����') then
        dbms_output.put_line('���� 3�� ����');
        --insert into tblBonus (seq, iseq, bonus) values (bonusSeq.nextval, vnum, vsudang * 3);
        vsudang := vsudang * 3;
    else
        dbms_output.put_line('���� 2�� ����');
        --insert into tblBonus (seq, iseq, bonus) values (bonusSeq.nextval, vnum, vsudang * 2);
        vsudang := vsudang * 2;
    end if;
    
    insert into tblBonus (seq, iseq, bonus) values (bonusSeq.nextval, vnum, vsudang);
    
end;

select * from tblBonus;





-- case ��
-- �ڹ� : switch case ��
-- ǥ�� SQL�� case�� ����
declare
    vcontinent tblCountry.continent%type;
    vresult varchar2(30);
begin
    
    -- ���ѹα��� ��� ����� ���ϴ���?
    select continent into vcontinent from tblCountry where name = '���ѹα�';
    
    if vcontinent = 'AS' then
        vresult := '�ƽþ�';
    elsif vcontinent = 'EU' then
        vresult := '����';
    elsif vcontinent = 'AF' then
        vresult := '������ī';
    end if;
    
    dbms_output.put_line(vresult);
    
    case
        when vcontinent = 'AS' then vresult := '�ƽþ�';
        when vcontinent = 'EU' then vresult := '����';
        when vcontinent = 'AF' then vresult := '������ī';
        else vresult := '��Ÿ';
    end case;
    
    dbms_output.put_line(vresult);
    
end;


/*
�ݺ���

1. loop
- ���� �ݺ�

2. for loop
- ���� Ƚ�� �ݺ�(�ڹ� for�� ����)

3. while loop
- ���� �ݺ�(�ڹ� while�� ����)

*/

-- loop

-- ���� ���� & �ٸ� ���� �⺻ ���
begin
    
    loop
        dbms_output.put_line('���� �ð� : ' || sysdate);
        --exit;
        --exit when ����;
        exit when to_char(sysdate, 'ss') > 30;
    end loop;
    
end;

--��� ��ȣ 1001 ~ 1060 : 10���� ����
select * from tblBonus;

declare
    vloop number;
begin
    
    vloop := 1001;

    loop
        
        insert into tblBonus (seq, iseq, bonus) values (bonusSeq.nextval, vloop, 100000);
        vloop := vloop + 1;
        
        exit when vloop > 1060;
        
    end loop;
end;

select * from tblBonus;



-- 2. for loop
-- : �������� ���� ������ �����Ѵ�.
begin
    -- ���������� ���� �������� �ʴ´�.
    -- i : ��������
    -- ���� in ����
    -- 1 : �ʱⰪ
    -- .. : ���� ����
    -- 10 : �ִ밪
    -- reverse : ����
    for i in reverse 1..10 loop
        dbms_output.put_line(i);
    end loop;
end;

--begin
--    for i in 5.1..5.9 loop
--        dbms_output.put_line(i);
--    end loop;
--end;


-- 3. while loop
declare
    vloop number;
begin
    
    vloop := 1;
    
    while vloop <= 10 loop
        
        dbms_output.put_line(vloop);
        vloop := vloop + 1;
        
    end loop;
    
end;


-- ������ ���̺�
create table tblGugudan
(
    --seq number primary key
    dan number not null,-- primary key,        -- 2, 2, 2
    num number not null,-- primary key,       -- 1, 2, 3
    result number not null,      --2, 4, 6
    
    --����Ű(Composite Key)
    -- : 2�� �̻��� �÷��� �𿩼� Ű��Ű(PK) ����
    -- : �÷� �������� ���� �Ұ���, ���̺� �������� ���� ����
    constraint tblgugudan_dan_num_pk primary key(dan,num)
);

insert into tblGugudan values (1, 1, 1);
insert into tblGugudan values (1, 2, 1);
insert into tblGugudan values (2, 1, 1);
insert into tblGugudan values (2, 1, 3);

rollback;

select * from tblGugudan;


-- for loop
-- while loop

begin
    for dan in 2..9 loop
        for num in 1..9 loop
            insert into tblGugudan values (dan, num, dan * num);
        end loop;
    end loop;
end;


truncate table tblGugudan; --commit ����

declare
    vdan number;
    vnum number;
begin    
    vdan := 2;    
    while vdan <= 19 loop     
        vnum := 1;        
        while vnum <=19 loop        
            insert into tblGugudan values (vdan, vnum, vdan * vnum);            
            vnum := vnum + 1;
        end loop;    
        vdan := vdan + 1;
    end loop;
end;

select * from tblGugudan;

/*
select �� ���ؼ� ������ �����͸� PL/SQL ������ �ִ� ���
1. select into ���
    - ������� ���ڵ� 1���϶��� �����ϴ�.
2. Ŀ��(cursor) ���
    - ������� ���ڵ尡 1�� �̻��� �� �����ϴ�.
    
Ŀ�� ����

declare
    ���� ����;
    Ŀ�� ����;
begin
    Ŀ�� ����;
    loop
        Ŀ���� ����ؼ� ������ ����;
    end loop;
    Ŀ�� �ݱ�;
end;

*/

--  select ������ ��������
-- 1. select into
--      a. �����÷� + ������
--      b. �����÷� + ������
-- 2. cursor
--      a. �����÷� + ������
--      b. �����÷� + ������

-- tblInsa. ������ x 60��
declare
    vname tblInsa.name%type; --�Ѹ��Ѹ��� �̸��� ������ ����
    cursor vcursor
    is
    select name from tblInsa order by name asc;--���� select�� ���� ��(���� O, ���� X)
begin
    
    open vcursor; --Ŀ�� ����(select�� ����)
    
        loop
            
            --���������� ���ڵ� �ϳ��ϳ��� Ŀ���� ����ؼ� ����
            fetch vcursor into vname;
            
            --Ŀ�� ���� �Ӽ�
            exit when vcursor%notfound; --���� ���ڵ尡 �����ϸ� false, ���� ���ڵ尡 ������ϸ� true ��ȯ
            
            dbms_output.put_line(vname);
            
        end loop;
    
    close vcursor; --Ŀ�� �ݱ�
    
end;


select * from tblBonus;
truncate table tblBonus;

delete from tblInsa where city = '����';

declare
    vnum tblInsa.num%type;
    cursor vcursor
    is
    select num from tblInsa;
begin
    open vcursor;
        loop
            fetch vcursor into vnum;
            exit when vcursor%notfound;
            insert into tblBonus values (bonusSeq.nextval, vnum, 200000);
        end loop;
    close vcursor;
end;

select * from tblBonus;

rollback;
select * from tblInsa;

-- ���� �÷� + ���� ���ڵ�
declare
    vname tblInsa.name%type;
    vbuseo tblInsa.buseo%type;
    vjikwi tblInsa.jikwi%type;
    cursor vcursor is
        select name, buseo, jikwi from tblInsa;
begin
    open vcursor;
    loop
        fetch vcursor into vname, vbuseo, vjikwi;
        exit when vcursor%notfound;
        
        --����
        dbms_output.put_line(vname || ', ' || vbuseo || ', ' || vjikwi);
        
    end loop;
    close vcursor;
end;



declare
    vrow tblInsa%rowtype;
    cursor vcursor is
        select * from tblInsa;
begin
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        
        --����
        dbms_output.put_line(vrow.name || ', ' || vrow.buseo || ', ' || vrow.city);
        
    end loop;
    close vcursor;
end;




/*
cursor ����(FM)
- Ŀ�� + loop
: Ŀ�� ��ü ����(select �� ����) > Ŀ�� ����(select ����) > ���� > ������ ����(fetch) + ���(����) > Ŀ�� �ݱ�

cursor ����(����)
- Ŀ�� + for loop
: Ŀ�� ó���� �ܼ�����

*/
declare
    --vrow : ���� ���� > ���� ������ �����
    cursor vcursor is
        select * from tblInsa;
begin
    --open vcursor; : ����    
    for vrow in vcursor loop -- loop + fetch into    
        dbms_output.put_line(vrow.name);    
    end loop;            
    --close vcursor; : ����
end;


-- Ŀ�� �� ��(�Ǹ��, �ζ��κ�)
begin
    for vrow in (select * from tblInsa) loop
        dbms_output.put_line(vrow.name || ' - ' || vrow.ssn);
    end loop;
end;

begin
    for vrow in vwInsa loop
        dbms_output.put_line(vrow.name || ' - ' || vrow.ssn);   
    end loop;
end;



/*
exception
- ���� ó����
*/
declare
    vname number;
begin
    dbms_output.put_line('����');
    select name into vname from tblInsa where num = 1001;
    dbms_output.put_line('��');
exception
    when others then -- catch(Exception e)
        dbms_output.put_line('���� ó��');
end;


--���� �߻� ���(�α� ���̺�)
create table tblLog
(
    seq number primary key, --PK
    code varchar2(20) check (code in ('AAA0001', 'BBB001', 'CCC001')) not null, --���� ���� �ĺ���
    message varchar2(1000) null, --���� �޽���
    regdate date default sysdate not null --�߻� �ð�
);

create sequence logSeq;

delete from tblName;
rollback;

declare
    vnum number;
    vname tblInsa.name%type;
begin
    
    --1.
    select 1000000 / count(*) into vnum  from tblName;--ORA-01476: divisor is equal to zero
    dbms_output.put_line(vnum);
    
    --2.
    select name into vname from tblInsa;-- where num = 1001;
    dbms_output.put_line(vname);

exception
    
    when zero_divide then
        dbms_output.put_line('tblName ���̺� �����Ͱ� �����ϴ�.');
        insert into tblLog values (logSeq.nextval, 'AAA0001', '��븮 ���', default);
    
    when too_many_rows then
        dbms_output.put_line('������ ������ �ʹ� �����ϴ�.');
        insert into tblLog values (logSeq.nextval, 'BBB001', null, default);
    
    when others then
        dbms_output.put_line('���� �߻�.');
        insert into tblLog values (logSeq.nextval, 'CCC001', null, default);
    
end;


select * from tblLog;




-- PL/SQL���� Ʈ����� ó��
-- : �Ϲ������� PL/SQL�� �� ��ü�� �ϳ��� Ʈ����� ����
-- : �Ϲ������� �Ǹ� PL/SQL �� ���� �� �ַ� Ʈ����� ó���� ����.

select * from tblMen; --ȫ�浿 : �嵵��
select * from tblWomen; --�嵵�� : ȫ�浿

commit;
rollback;

begin
    --1.
    update tblMen set couple = null where name = 'ȫ�浿'; --����
    --2.
    update tblWomen set couple = '����������������������' where name = '�嵵��';--����
    
    commit;
exception
    when others then
        rollback;
end;



/*

PL/SQL �� > �̸� ���̱� > ���� ����Ŭ ������ ����(��ü) > ���� �� > ���� ���α׷� > Stored Procedure

���� ���ν���
- �̸��� ���� PL/SQL ��
- ���� �� 1���� ���� ���ν��� ���� > ����Ŭ ���� ���� > ������ ������ ���� ����(���� ���� ���� ���)
- ���� ���(���� �м� ~ ������ ���� ����)
- ��Ʈ��ũ Ʈ���� ����(�ڵ� ��ü ���� -> ���α׷� �̸��� ����)
- ���� ������ ������ �ڵ带 ��� ���� + ���� �ο� ����


���� ���α׷� ����
1. ���� ���ν���. Stored Procedure
    - ��� SQL ��� �뵵
    - �Ű� ���� ����
    - ��ȯ�� ����
    - �ڹ� : �޼ҵ�
    - ǥ�� SQL���� ����� �Ұ����ϴ�.
2. ���� �Լ�. Stored Function
    - �ַ� select �뵵
    - �ݵ�� �Ű������� ������.
    - �ݵ�� ��ȯ���� ������.(��ȯ���� ���ϰ�) : �ڹ� �޼ҵ� return��
    - ǥ�� SQL���� ����� �����ϴ�.(***)


���� ���ν��� ����

create [or replace] procedure ���ν�����
is[as]
    [�����;]
begin
    �����;
[exception
    ����ó����;]
end [���ν�����];
    
*/

-- ���ν��� ����
create or replace procedure procTest
is --�͸� ���� declare ����
    vnum number;
begin
    vnum := 100;
    dbms_output.put_line(vnum);
end procTest;

-- ���ν��� ȣ��
-- 1. PL/SQL �������� ȣ��(*****)
-- ���α׷��� ���
-- �͸� �� or �ٸ� ���ν��� ȣ��
-- �ַ� ���Ǵ� ���

-- 2. ��ũ��Ʈ ȯ�濡�� ȣ��(ANSI-SQL ȯ��)
-- ������, �����
-- execute, call ��ɾ� ���
    

--2�� ȯ��
procTest;
procTest();
select * from tblName;

begin --1�� ȯ��
    --procTest;
    procTest();
end;

create or replace procedure procHello
is
begin
    procTest;
end;

begin
    procHello;
end;


exec procTest;
execute procTest;
call procTest();


-- �Ű������� �ִ� ���ν���
create or replace procedure procTest(pnum number)
is
    vresult number;
begin
    vresult := pnum * 2;
    dbms_output.put_line(vresult);
end;

begin
    procTest(100);
end;







create or replace procedure procTest
(
    pwidth number, 
    pheight number
)
is
    vresult number;
begin
    vresult := pwidth * pheight;
    dbms_output.put_line(vresult);
end;

begin
    procTest(100, 50);
end;





create or replace procedure procTest
(
    pname varchar2, --�Ű������� ���� ���X
    pwidth number, 
    pheight number
)
is
    vresult number;
begin
    vresult := pwidth * pheight;
    dbms_output.put_line(pname || ' - ' || vresult);
end;

begin
    procTest('�簢��A', 100, 50);
end;





create or replace procedure procTest
(
    pname varchar2,
    pwidth number default 10, 
    pheight number default 20
)
is
    vresult number;
begin
    vresult := pwidth * pheight;
    dbms_output.put_line(pname || ' - ' || vresult);
end;

begin
    procTest('�簢��A', 100, 50);
    procTest('�簢��A', 100); --2000
    procTest('�簢��A');
    --procTest('�簢��A', null, 100); --����
    --procTest('�簢��A', default, 100);
end;


/*
�Ű������� �۵�(����) ���
- �Ű������� �����ϴ� ���
1. in ��� : �⺻
2. out ���
3. in out ��� : ���X

*/
create or replace procedure procSum
(
    pnum1 in number, -- in �Ķ����
    pnum2 in number
)
is
    vresult number;
begin
    vresult := pnum1 + pnum2;
    dbms_output.put_line(vresult);
end;

begin
    procSum(10, 20);
end;




create or replace procedure procSum
(
    pnum1 in number, -- in �Ķ����
    pnum2 in number,
    presult out number, -- out �Ķ����, ��ȯ�� ����
    presult2 out number, -- out �Ķ����
    presult3 out varchar2
)
is
begin
    presult := pnum1 + pnum2;
    presult2 := pnum1 - pnum2;
    if pnum1 > pnum2 then
        presult3 := 'ũ��';
    else
        presult3 := '�۴�';
    end if;
end;


declare
    vresult number;
    vresult2 number;
    vresult3 varchar2(20);
begin
    --���� = procSum(10, 20); //�� ��� ��� �Ұ�(����� �޼ҵ��� ��ȯ������ �ٸ���.)
    procSum(10, 20, vresult, vresult2, vresult3);
    dbms_output.put_line(vresult);
    dbms_output.put_line(vresult2);
    dbms_output.put_line(vresult3);
end;



-- �˻�, �߰�, ���� ��..

-- ���� ����ϱ�
-- 1. ���� ��ȣ > ���
-- 2. ������(����) > ���
create or replace procedure procDelInsa
(
    pnum in number
)
is
begin
    delete from tblInsa where num = pnum;
    insert into tblLog(seq, code, message, regdate) values (logSeq.nextval, 'AAA0001', 'ȫ�浿 ���', default);
--    commit;
--exception
--    when others then
--        rollback;
end;

begin
    procDelInsa(1001);
end;

select * from tblInsa;
select * from tblLog;
rollback;



-- ���� �߰��ϱ� ���ν���
select * from tblTodo;

create or replace procedure procAddTodo
(
    ptitle varchar2
)
is
    vseq number;
begin
    --1.
    select max(seq) + 1 into vseq from tblTodo;
    --2.
    insert into tblTodo (seq, title, adddate, completedate)
        values (vseq, ptitle, sysdate, null);
end;

begin
    procAddTodo('����Ŭ ���ν��� �����ϱ�');
end;

select * from tblTodo;



select * from tblName;
select * from tblAddressBook where address like '����%';
select * from tblAddressBook where substr(address, 1, 2) = '����';

create index idxAddressBookAddress
on tblAddressBook(substr(address, 1, 2));
    

create or replace procedure procAddName
(
    pname varchar2,
    pgender varchar2,
    pheight number,
    pweight number,
    pnick varchar2
)
is
begin
    insert into tblName (first, last, gender, height, weight, nick)
        values (substr(pname, 2), substr(pname, 1, 1), pgender, pheight, pweight, pnick);
end;

begin
    procAddName('�̱���', 'm', 190, 70, '�⸰');
end;

select * from tblName order by height desc;

rollback;




-- 
create table tblFullname
(
    seq number primary key,
    fullname varchar2(45) not null,
    employee_id number(6) not null references employees(employee_id)
);

create sequence fullnameSeq;

select * from employees;

--���ν��� :  id > full name ��ȯ
create or replace procedure procGetFullname
(
    pid in number,
    pfullname out varchar2
)
is
begin
    select first_name || ' ' || last_name into pfullname from employees
        where employee_id = pid;
end;

set serveroutput on;



-- ���ν��� : fullname insert
create or replace procedure procAddFullname
(
    pid number,
    pfullname varchar2
)
is
begin
    insert into tblFullname (seq, fullname, employee_id) values (fullnameSeq.nextval, pfullname, pid);
end;


declare
    vfullname varchar2(45); --out �Ķ���Ϳ� ������ ������ ����
begin
    procGetFullname(100, vfullname);
    dbms_output.put_line(vfullname);
    procAddFullname(100, 'Steven King');
end;


-- ���� 2���� ���ν����� �ϳ��� ����
create or replace procedure procInsertName
(
    pid in number
)
is
    vfullname varchar2(45);
begin
    --1.
    procGetFullname(pid, vfullname);
    --2.
    procAddFullname(pid, vfullname);
end;



begin
    procInsertName(105);
    procInsertName(110);
    procInsertName(123);
end;

select * from tblFullname;


--public int aaa() {}
--public void bbb(int a) {}
--
--public void ccc() {
--    int result = aaa();
--    bbb(result);
--}


-- ���ν��� ���� ���� : CRUD
select * from tabs;

create table tblAddress
(
    seq number primary key, --PK
    name varchar2(30) not null, --�̸�
    age number(3) not null, --����
    tel varchar2(15) not null, --��ȭ��ȣ
    address varchar2(500) not null, --�ּ�
    regdate date default sysdate not null --��Ͻð�
);

create sequence addressSeq;

-- C : �ּҷ� �߰��ϱ�
create or replace procedure procAddAddress
(
    pname in varchar2,
    page in number,
    ptel in varchar2,
    paddress in varchar2,
    presult out number --�߰� ���� ���� ����(1 : ����, 0 : ����)
)
is
begin
    insert into tblAddress (seq, name, age, tel, address, regdate)
        values (addressSeq.nextval, pname, page, ptel, paddress, default);
    presult := 1;
    commit;
exception
    when others then
        presult := 0;
        rollback;
end;




declare
    vresult number;
begin
    procAddAddress('ȫ�浿', 20, '010-1234-5678', '����� ������ ���ﵿ', vresult);
    
    if vresult = 1 then
        dbms_output.put_line('�Է� ����');
    else
        dbms_output.put_line('�Է� ����');
    end if;
end;

select * from tblAddress;



-- R : �б�
-- 1���� seq > ��� ���� ��ȯ
create or replace procedure procReadAddress
(
    pseq in number, --�˰� ���� �ּҷ� ��ȣ
    pname out varchar2,
    page out number,
    ptel out varchar2,
    paddress out varchar2,
    pregdate out date,
    presult out number --���� ����
)
is
    vcnt number;
begin
    
    select count(*) into vcnt from tblAddress where seq = pseq;
    
    if vcnt = 1 then
        select name, age, tel, address, regdate
            into pname, page, ptel, paddress, pregdate
                from tblAddress
                    where seq = pseq;
        presult := 1;
    else
        presult := 2;
    end if;
    
exception
    when others then
        presult := 0;
end procReadAddress;


declare
    vname tblAddress.name%type;
    vage tblAddress.age%type;
    vtel tblAddress.tel%type;
    vaddress tblAddress.address%type;
    vregdate tblAddress.regdate%type;
    vresult number;
begin
    procReadAddress(1, vname, vage, vtel, vaddress, vregdate, vresult);
    
    if vresult = 1 then
        dbms_output.put_line(vname || ' - ' || vage);
    elsif vresult = 2 then
        dbms_output.put_line('�������� �ʰų� �̹� ������ ��ȣ�� �Է��߽��ϴ�.');
    else 
        dbms_output.put_line('����Ŭ ����. �����ڿ��� �����ϼ���.');
    end if;    
end;






-- U : �ּҷ� �� 1��(���ڵ�) �����ϱ�
-- ��ȣ(PK)
-- �̸�, ����, ��ȭ, �ּ�, �����
--procUpdateAddress(seq, 'ȫ�海');
--procUpdateAddress(seq, '����� ������ õȣ��');
--procUpdateAddress(seq, 'ȫ�海', 19);
--procUpdateAddress(seq, '010-584-9854', '����� ������ ��ġ��');


--update tblAddress set
--    name = ���̸�
--        where seq = ��ȣ
--
--update tblAddress set
--    address = ���ּ�
--        where seq = ��ȣ
--
--update tblAddress set
--    name = ���̸�, age = ������
--        where seq = ��ȣ


procUpdateAddress(1, 'ȫ�海', 20, '010-1234-5678', '����� ������ ���ﵿ');

create or replace procedure procUpdateAddress
(
    pseq number,
    pname varchar2,
    page number,
    ptel varchar2,
    paddress varchar2,
    presult out number
)
is
    vcnt number;
begin
    
    select count(*) into vcnt from tblAddress where seq = pseq;
    
    if vcnt = 1 then
        update tblAddress set
            name = pname, age = page, tel = ptel, address = paddress
                where seq = pseq;
        presult := 1;
        commit;
    else
        presult := 2;
    end if;
exception
    when others then
        presult := 0;
        rollback;
end;


declare
    vresult number;
begin
    procUpdateAddress(1, 'ȫ�浿', '������', '010-1234-5678', '����� ������ ���ﵿ', vresult);
    
    if vresult = 1 then
        dbms_output.put_line('���� �Ϸ�');
    elsif vresult = 2 then
        dbms_output.put_line('�������� �ʰų� �̹� ������ �����Դϴ�');
    else
        dbms_output.put_line('����Ŭ ����');
    end if;
end;

select * from tblAddress;





-- D : �ּҷ� ���ڵ� ����
create or replace procedure procDeleteAddress
(
    pseq number,
    presult out number
)
is
    vcnt number;
begin
    
    select count(*) into vcnt from tblAddress where seq = pseq;
    
    if vcnt = 1 then
        delete from tblAddress where seq = pseq;
        presult := 1;
        commit;
    else
        presult := 2;
    end if;

exception
    when others then
        presult := 0;
        rollback;    
end;

declare
    vresult number;
begin
    procDeleteAddress(1, vresult);
    dbms_output.put_line(vresult);
end;


-------


-- �θ� ���̺�(PK) <-> �ڽ� ���̺�(FK + �Ϲ� �÷�) : ��ĺ� ����
-- �θ� ���̺�(PK) <-> �ڽ� ���̺�(FK + PK �÷�) : �ĺ� ����

-- ȸ�� ���� > ȸ�� ����(�ֿ� ���� + ���� ����)
create table tblMain
(
    id varchar2(30) primary key,
    pw varchar2(30) not null,
    name varchar2(30) not null
);

create table tblSub
(
    id varchar2(30) primary key, --PK
    age number null,
    tel varchar2(15) null,
    address varchar2(300) null,
    constraint tblSub_id_fk foreign key(id) references tblMain(id)
);


-- ȸ�� ���� ���ν���
create or replace procedure procRegister
(
    pid varchar2,
    ppw varchar2,
    pname varchar2,
    page number,
    ptel varchar2,
    paddress varchar2
)
is
begin
    --1.
    insert into tblMain (id, pw, name) values (pid, ppw, pname);
    --2.
    insert into tblSub (age, tel, address, id) values (page, ptel, paddress, pid);
    
    commit;

exception
    when others then
        rollback;
end;


begin
    --procRegister('hong', '1234', 'ȫ�浿', 20, '010-2514-8745', '�����');
    procRegister('test', '1234', '�׽�Ʈ', 20, '010-2514-874503432540340340303', '�����');
end;

select * from tblMain;
select * from tblSub;





-- ���� ���α׷�
-- 1. ���� ���ν���
-- : PL/SQL������ ��� ����
-- : out ���� ���Ѵ�

-- 2. ���� �Լ�
-- : PL/SQL or ǥ�� SQL������ ��� ��� ����
-- : ******* ǥ�� SQL ������ �Ϻκз� ��� ����(select, insert, update, delete)
-- : return 1��


-- �Լ�, Function
-- : ����(1�� �̻�) -> ��ȯ��(1��) ���ν���
-- : out �Ķ���� ��� ���� > return �� ���

-- ���ν���
create or replace procedure procAAA
(
    pnum1 in number,
    pnum2 in number,
    presult out number
)
is
begin
    presult := pnum1 + pnum2;
end;


-- ���ν��� ���
declare
    vresult number;
    vheight number;
    vweight number;
begin
    
    procAAA(10, 20, vresult);
    dbms_output.put_line(vresult);
    
    select height, weight into vheight, vweight from tblName where first = '�缮';
    
    procAAA(vheight, vweight, vresult);
    dbms_output.put_line(vresult);
    
    select procAAA(height, weight, vresult) from tblName where first = '�缮';
    dbms_output.put_line(vresult);
    
end;




-- �Լ� ����
--public int bbb(int a, int b)

create or replace function fnBBB 
(
    pnum1 number,
    pnum2 number
) return number
is
begin
    return pnum1 + pnum2;
end;


-- �Լ� ���
declare
    vresult number;
    vheight number;
    vweight number;
begin
    dbms_output.put_line(fnBBB(20, 30));
    
    vresult := fnBBB(50, 60);
    dbms_output.put_line(vresult);
    
    select height, weight into vheight, vweight from tblName where first = '�缮';
    
    vresult := fnBBB(vheight, vweight);
    dbms_output.put_line(vresult);
    
    -- �Լ��� ��� ����
    select fnBBB(height, weight) into vresult from tblName where first = '�缮';
    dbms_output.put_line(vresult);
    
end;



select fnBBB(height, weight) from tblName where first = '�缮';
select fnBBB(basicpay, sudang) from tblInsa;
select procAAA(basicpay, sudang) from tblInsa;



/*

���ν��� vs �Լ�
1. �Ű�����
    a. ���ν��� : 0 ~ �������
    b. �Լ� : 1�� ~ �������
2. ��ȯ��
    a. ���ν��� : 0 ~ ������� + out �Ķ����
    b. �Լ� : 1�� + return��
3. �����ġ
    a. ���ν��� : PL/SQL ��
    b. �Լ� : ǥ�� SQL ��

*/

select name, ssn from tblInsa; -- �̸�, ����
select name, fnGender(ssn) from tblInsa; -- �̸�, ����

-- ssn > ����
create or replace function fnGender
(
    pssn varchar2
) return varchar2
is
begin
    case
        when substr(pssn, 8, 1) = '1' then return '����';
        when substr(pssn, 8, 1) = '2' then return '����';
        else return null;
    end case;
end;




/*
Ʈ����, Trigger
- ���ν����� ����
- Ư�� ����� �߻��ϸ� �ڵ����� ����Ǵ� ���ν���
- ������ ����(ȣ��) X, DBMS ����(ȣ��) O
- Ư�� ��� : Ư�� ���̺��� ������� ����Ŭ�� �ǽð� ����(���̺� ���� : insert, update, delete) -> �߻� 
                    -> �̸� �غ��س��� ���ν����� �ڵ����� ȣ���Ѵ�.
- �ǽð� ���� : ��� �߻� > �ּ��� �ʿ��� ������..


Ʈ���� ����

create or replace trigger Ʈ���Ÿ�
    -- Ʈ���� ���� �ɼ�
    before | after -- ��� �߻� �� | ��
    insert | update | delete -- ��� ����
    on ���̺�� -- ��� ��� ���̺�
    [for each row]
declare
    �����;
begin
    �����;
exception
    ���ܺ�;
end;
                    
*/


-- Ư�� ����(��)���� tblName�� �����͸� ������ �� ����.!!
create or replace trigger trgDeleteName
    before
    delete
    on tblName
begin
    
    dbms_output.put_line('trgDeleteName ����Ǿ����ϴ�.');
    
    if to_char(sysdate, 'd') = 4 then
        -- ������ ���� �߻�
        -- throw new Exception()
        -- ����(�����ڵ��ȣ) : -20000 ~ 29990
        raise_application_error(-20000, '�����Ͽ��� tblName�� ������ �� �����ϴ�.');
    end if;
    
end;

select * from tblName;
delete from tblName where first = '�缮';

drop trigger trgDeleteName;





-- �α� Ʈ����
-- : tblName�� ��ȭ�� ����� ���߿� �����ڰ� ���� ���� �α׸� ���

create or replace trigger trgName
    after
    delete or insert or update
    on tblName
    for each row
declare
    vcode varchar2(10);
    vmessage varchar2(100);
begin
    --dbms_output.put_line(inserting);
    --dbms_output.put_line(updating);
    --dbms_output.put_line(deleting);
    if inserting then
        vcode := 'AAA0001';
        vmessage := 'tblName ���̺� ���ο� ���ڵ尡 �߰��Ǿ����ϴ�.';
    elsif updating then
        vcode := 'BBB001';
        vmessage := 'tblName ���̺��� ���ڵ尡 �����Ǿ����ϴ�.';
    elsif deleting then
        vcode := 'CCC001';
        vmessage := 'tblName ���̺��� ���ڵ尡 �����Ǿ����ϴ�.';
    end if;
    
    insert into tblLog (seq, code, message, regdate) values (logSeq.nextval, vcode, vmessage, default);
    
end;

insert into tblName values ('����', '��', 'm', 170, 60, '����');
update tblName set first = 'ȣȣ' where first = '����' and last = '��';
delete from tblName where first = 'ȣȣ';
rollback;

select * from tblName; --9��
select * from tblLog; --2��


/*
[for each row]

1. ����
- ���� ���� Ʈ����
- 1ȸ
- DML�� ���� ����� ���� ������ ������� DML 1ȸ�� Ʈ���� 1ȸ ȣ��

2. ���
- �� ���� Ʈ����
- �ݺ�
- DML�� ���� ����� ���� ������ŭ Ʈ���Ű� ȣ��
- ��� ���� ���� ����
    a. :old
    b. :new

2.1 insert �۾� �߻�
    - Ʈ���ų����� ��� insert �� ���� �÷����� ���� �����ϴ�.
    - :new <- ��� �߰��� ���� �����ϴ� ����
    - :new.�÷��� <- ��� �߰��� ���� Ư�� �÷��� ����
    - :old ��� �Ұ���
    - after Ʈ���ſ����� ����� ������.(before Ʈ���ſ����� ��� �Ұ���)

2.2 update �۾� �߻�
    - Ʈ���ų����� ��� ������ ���� �����Ǳ� ���� ���� ������ ���� ���� ���� �����ϴ�.
    - :new <- ��� ������ ���� ���� �����ϴ� ����
    - :old <- ��� �����Ǳ� ���� ���� �����ϴ� ����

2.3 delete �۾� �߻�
    - Ʈ���ų����� ��� ������ ���� ���� ���� �����ϴ�.
    - :old <- ��� ������ ���� �����ϴ� ����
    - :new ��� �Ұ���


*/


create or replace trigger trgInsertTodo
    after
    insert
    on tblTodo
    for each row
begin
    dbms_output.put_line(:new.title); --vrow
end;

insert into tblTodo values (23, '���ο� ����', sysdate, null);



create or replace trigger trgUpdateTodo
    after
    update
    on tblTodo
    for each row
begin
    dbms_output.put_line(:old.title);
    dbms_output.put_line(:new.title); 
end;



update tblTodo set title = '������ ��ȹ�ϱ�' where seq = 23;




create or replace trigger trgDeleteTodo
    before
    delete
    on tblTodo
    for each row
begin
    dbms_output.put_line(:old.title);
end;

delete from tblTodo where seq = 23;

select * from tblTodo;




-- tblTodo : ������ ��ϵǸ� �ּ��� 3�ϵ����� ������ �Ұ����ϴ�.

create table tblBoard
(
    seq number primary key, --�۹�ȣ(PK)
    subject varchar2(1000) not null, --������
    regdate date default sysdate not null --�۾���¥
);

create table tblComment
(
    seq number primary key, --��۹�ȣ(PK)
    subject varchar2(1000) not null, --������
    regdate date default sysdate not null, --�۾���¥
    bseq number not null references tblBoard(seq) --�θ�۹�ȣ(FK)
);

create sequence boardSeq;
create sequence commentSeq;


--�Խ��� ���̺� > ���� Ʈ���� > ������ ���� ��ȣ > ��� ���� ����
create or replace trigger trgDeleteBoard
    before
    delete
    on tblBoard
    for each row
begin
    
    delete from tblComment where bseq = :old.seq;

end;



select * from tblBoard; -- �Խ���
select * from tblComment; -- ���

insert into tblBoard values (1, '�Խ��� �׽�Ʈ�Դϴ�.', default);
insert into tblBoard values (2, '�ȳ��ϼ���~', default);

insert into tblComment values (1, '����Դϴ�.', default, 1);
insert into tblComment values (2, '����Դϴ�.', default, 1);
insert into tblComment values (3, '����Դϴ�.', default, 1);

insert into tblComment values (4, '�� �ȳ��ϼ���.', default, 2);
insert into tblComment values (5, '�ݰ����ϴ�~', default, 2);

-- ù��° �Խù� �����ϱ�
delete from tblComment where bseq = 1;--��ۺ��� ����
delete from tblBoard where seq = 1;

delete from tblBoard where seq = 2;

select * from tblMemo;
select * from tblUser;

drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    content varchar2(1000) not null,
    regdate date default sysdate not null,
    id varchar2(30) not null references tblUser(id)
);

create table tblUser
(
    id varchar2(30) primary key,
    name varchar2(30) not null,
    point number default 100 not null
);


create or replace trigger trgInsertMemo
    after
    insert
    on tblMemo
    for each row
begin
    update tblUser set point = point + 10 where id = :new.id;
end;


create or replace trigger trgDeleteMemo
    before
    delete
    on tblMemo
    for each row
begin
    update tblUser set point = point - 5 where id = :old.id;
end;


insert into tblUser values ('hong', 'ȫ�浿', default);

select * from tblUser;

insert into tblMemo values (1, '�޸��Դϴ�.', default, 'hong');
insert into tblMemo values (2, '�޸��Դϴ�.', default, 'hong');
delete from tblMemo where seq = 2;
insert into tblMemo values (3, '�޸��Դϴ�.', default, 'hong');
delete from tblMemo where seq = 3;
insert into tblMemo values (4, '�޸��Դϴ�.', default, 'hong');

-- Ʈ���� ����� : �޸� ����(+10), �޸� ����(-5)
-- 1. insert 1��, delete 1��
-- 2. insert or delete 1��

/*

������Ʈ ����..(DB)
1. ������ ����
2. �䱸 �м�
3. ERD �ۼ�(�𵨸�) > ���赵 �ۼ�(*****************************************************************)
4. DB Object ����
    a. ���̺� ����
    b. �� ����
    c. �ε��� ����
    d. Ʈ���� ����
    e. SQL ����(select, insert, update, delete)
    f. �Լ� / ���ν��� ����
    g. ���� ������ ����
-----------------------------------------------
������Ʈ ����(Java)

5. ��� ����
6. ȭ�� ����
7. ����
----------------------------------------------- Console


*/







-- DB ������Ʈ���� ���� ���ν��� ���

--1. �߰� �۾�(C)
create or replace procedure �߰��۾� (
    �߰� ������ -> in �Ű�����,
    ���� ���� ��ȯ -> out �Ű�����
)
is
    ���� ����
begin
    �۾�(insert.. + select..)
    commit;
exception
    when others then
        �����۾�;
        rollback;
end;




--2. ���� �۾�(U)
create or replace procedure �����۾� (
    �ĺ��� ������ -> in �Ű�����,
    ���� ������ -> in �Ű�����,
    ���� ���� ��ȯ -> out �Ű�����
)
is
    ���� ����
begin
    �۾�(update.. + select..)
    commit;
exception
    when others then
        �����۾�;
        rollback;
end;

--3. ���� �۾�(D)
create or replace procedure �����۾� (
    �ĺ��� ������ -> in �Ű�����,
    ���� ���� ��ȯ -> out �Ű�����
)
is
    ���� ����
begin
    �۾�(delete.. + select..)
    commit;
exception
    when others then
        �����۾�;
        rollback;
end;




--4. �б� �۾�(R) - ���� ���� + ��ȯ��(���� �÷� + ���� ���ڵ�)
create or replace procedure �б��۾� (
    ���� ������ -> in �Ű�����,
    ���� ��ȯ�� -> out �Ű�����
)
is
    ���� ����
begin
    �۾�(select..)
    commit;
exception
    when others then
        �����۾�;
        rollback;
end;



--5. �б� �۾�(R) - ���� ���� + ��ȯ��(���� �÷� + ���� ���ڵ�)
create or replace procedure �б��۾� (
    ���� ������ -> in �Ű�����,
    ���� ��ȯ�� -> out �Ű�����,
    ���� ��ȯ�� -> out �Ű�����,
    ���� ��ȯ�� -> out �Ű�����
)
is
    ���� ����
begin
    �۾�(select..)
    commit;
exception
    when others then
        �����۾�;
        rollback;
end;



--6. �б� �۾�(R) - ���� ���� + ��ȯ��(�÷� + ����(**) ���ڵ�)
create or replace procedure �б��۾� (
    ���� ������ -> in �Ű�����,
    Ŀ�� -> out �Ű�����
)
is
    ���� ����
begin
    �۾�(select..)
    commit;
exception
    when others then
        �����۾�;
        rollback;
end;





-- Ŀ��(�����)�� ��ȯ�ϴ� ���ν��� �����

select * from tblInsa where buseo = '?';

create or replace procedure procGetBuseo (
    pbuseo in varchar2, --����
    presult out sys_refcursor --��ȯ������ ����ϴ� cursor �ڷ���(= ��� ���̺�)
)
is
begin
    
    open presult 
        for select * from tblInsa where buseo = pbuseo;
    
end;

set serveroutput on;

declare
    vresult sys_refcursor; --���ν��� ��ȯ�� Ŀ���� �����ϴ� ����
    vrow tblInsa%rowtype;
begin
    
    procGetBuseo('������', vresult);
    
    loop
        fetch vresult into vrow;
        exit when vresult%notfound;
        
        dbms_output.put_line(vrow.name);    
    end loop;
    
end;


-- �Ⱓ ���� > �ݳ� ���� ���� ���
-- ���۳�¥ ~ ����¥ > date ? ����� ���� ?
create or replace procedure procCheckRent (
    pstartYear number,
    pstartMonth number,
    pstartDate number,
    pendYear number,
    pendMonth number,
    pendDate number,
    presult out sys_refcursor
)
is
begin
    
    -- SQL
    open presult for
    select v.name as vname, m.name as mname, r.rentDate from tblMember m
        inner join tblRent r
            on m.seq = r.member
                inner join tblVideo v
                    on v.seq = r.video
                        where retdate is null
                            --and rentdate between '2007-02-01' and '2007-02-28' ;
                            --and rentdate between pstartYear || '-' || pstartMonth || '-' || pstartDate and '2007-02-28' ;
                            and rentdate 
                                between 
                                    to_date(pstartYear || '-' || pstartMonth || '-' || pstartDate || 
                                    ' 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
                                    and
                                    to_date(pendYear || '-' || pendMonth || '-' || pendDate || 
                                    ' 23:59:59', 'yyyy-mm-dd hh24:mi:ss');
    
    
end;



declare
    vresult sys_refcursor; --�뿩 ����
    vvname tblVideo.name%type;
    vmname tblMember.name%type;
    vrentDate tblRent.rentDate%type;
begin
    
    --procCheckRent('2007-02-01', '2007-02-28', vresult);
    procCheckRent(2007, 2, 1, 2007, 2, 28, vresult);
    
    loop
        fetch vresult into vvname, vmname, vrentDate;
        exit when vresult%notfound;
        
        dbms_output.put_line(vvname || ' - ' || vmname || ' - ' || vrentDate);
    
    end loop;
    
--    for vrow in vresult loop
--        dbms_output.put_line(vrow.vvname);        
--    end loop;
    
end;































