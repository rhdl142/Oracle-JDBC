-- ex20_plsql.sql
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
























