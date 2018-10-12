-- ex14_view.sql
/*

��, View
- DB Object �� �ϳ�(���̺�, ������, ��)
- ���� ���̺�
- ��¥ ���̺��� ���纻 -> ���� ���̺�, �� ���̺�, ���� ���̺�..
- ���̺�ó�� ����ϴ� ��ü(***)

�� ����
1. create
2. drop

*/

-- �����
create view vwInsa --�Ӹ�
as --��
select * from tblInsa; --����(*****)

--���� ���̺� ����
create table copyInsa
as
select * from tblInsa;

-- ����
select * from vwInsa; --���� ����?, ������ insert?
select * from copyInsa; --����� ���̺�

select * from vwInsa where buseo = '��ȹ��'; --���� ����?, ������ insert?
select * from copyInsa where buseo = '��ȹ��'; --����� ���̺�


--���� ���� : (������ & ��ȹ��) + �������� x 1�� ���� + �Ϸ� ���ʹ�
select * from tblInsa 
    where buseo in ('������', '��ȹ') and substr(ssn, 8, 1) = '1';


-- ���� Ư¡
-- 1. ���� �ݺ��ϴ� ������ �����ϰ� ���� �� �ִ�.
-- 2. 
--  a. ���� ���̺� : ���� ���̺��� ���� ����. ���� ���纻 ���� �и���Ų��. ���� ���̺� ���� > ���� ���̺� �ݿ� X
--  b. �� : ���� ���̺��� ���� ����. ��� ������ ���� ��ü�� �ƴ� SQL ���� ��ü. ���� ���̺� ���� > �� �ݿ� O
-- 3. ��� �ַ� ���� ���̺���� ���������� ������ �ʿ��� �ӽ� ���̺��� �ʿ��� �� ���� ����Ѵ�.
-- 4. ��� ����
--  a. ���� �ݺ��Ǵ� ���Ǹ� ����
--  b. �ݺ��� ������� �ش� ���ǿ� �ǹ̸� �ο��ؼ� �������� ���̰� ���� ��
--  c. ���� : ���� �� �ϳ� > �ڿ�(���̺�,��)�� ���� ���� ����

select * from tblInsa;
select * from tblInsa where buseo = '��ȹ��';

create view ��ȹ��
as
select * from tblInsa where buseo = '��ȹ��';

create view ����
as
select * from tblInsa where jikwi = '���';

create view vwSub
as
select * from tblInsa 
    where buseo in ('������', '��ȹ') and substr(ssn, 8, 1) = '1';


select * from vwSub;

select * from tblInsa where buseo = '��ȹ��';
delete from tblInsa where num in (1024, 1031, 1034);

commit;




create view vwRet
as
select 
    m.name as ȸ����,
    v.name as ��������,
    to_char(r.rentdate, 'yyyy-mm-dd') as �뿩��¥,
    case
        when r.retdate is null then '�̹ݳ�'
        when r.retdate is not null then '�ݳ��Ϸ�'
    end as �ݳ�����,
    case
        when r.retdate is null then round(sysdate - (r.rentdate + g.period))
        when r.retdate is not null then null
    end as ��ü�Ⱓ,
    
    case
        when r.retdate is null 
            then round(sysdate - (r.rentdate + g.period)) * (g.price * 0.05)
        when r.retdate is not null then null
    end as ��ü��
    
from tblVideo v
    inner join tblGenre g
        on g.seq = v.genre
            inner join tblRent r
                on v.seq = r.video
                    inner join tblMember m
                        on m.seq = r.member;



-- ��� : ��� ����
select * from vwRet;







--��ü ���� ���
select * from tblInsa;

--���� ���
select * from tblInsa where jikwi = '����';

create view vw����
as
select * from tblInsa where jikwi = '����';

select * from vw����;


drop view vw����;







-- ����, ��
-- ���� ����

--��(�θ�,��ȣ(PK)) <-> �Ǹ�(�ڽ�,��(FK))
select * from tblCustomer; --��
select * from tblSales; --�Ǹ�

--tblCustomer + tblSales
select c.name, s.item, s.qty from tblCustomer c inner join tblSales s on c.seq = s.customer;

--� ȸ��(tblMember.name)? � ����(tblVideo.name)? ����(tblRent.rentDate)?

select m.name as mname, v.name as vname, to_char(r.rentdate, 'yyyy-mm-dd') as rentdate from tblMember m
        inner join tblRent r
                on m.seq = r.member
                        inner join tblVideo v
                                on v.seq = r.video;

-- ������ ��ϰ� �ݳ����θ� �������ÿ�.
-- inner join : �� ���̺� ��� �����ϴ� ���ڵ常 ��ȯ. �������� �߿��� �뿩����� �ִ� �������� �����´�.

select 
        v.name,  
        case
            when r.retdate is null then '�̹ݳ�'
            when r.retdate is not null then '�ݳ��Ϸ�'
        end
        from tblVideo v
                inner join tblRent r
                        on v.seq = r.video;

-- ������ ��ϰ� �ݳ����θ� �������ÿ�.(+ �ѹ��� �뿩����� ���� �������鵵 �������ÿ�.)
-- outer join : inner join + �������� �ʾҴ� �θ� ���̺��� ������ ���ڵ嵵 �Բ� ��������. �뿩����� ���� ������
select 
        v.name,  
        case
            when r.retdate is null and r.rentdate is not null then '�̹ݳ�'
            when r.retdate is not null then '�ݳ��Ϸ�'
            when r.retdate is null and r.rentdate is null then '�Ǽ����'
        end
        from tblVideo v
                left outer join tblRent r
                        on v.seq = r.video;


select * from tblStaff;
select * from tblProject;

insert into tblStaff values (1, 'ȫ�浿', 250, '�����');

-- ����. ���� ��������(***) ��� ������Ʈ�� ����� ������ �����Ͷ�
select * from tblStaff s
        inner join tblProject p
                on s.seq = p.staffseq;


-- ����. ��� ��������(***) �������µ� ������Ʈ�� ����ϰ� ������ �� ������Ʈ ������ ���� �����Ͷ�.
select * from tblStaff s
        left outer join tblProject p
                on s.seq = p.staffseq;



-- ���� ����
 select * from tblSelf;

-- ������(�μ�) + ����(�μ�)
select 
        s1.name as "����", 
        s1.department as "���μ�",
        s2.name as "���ϸ�", 
        s2.department as "���Ϻμ�" 
            from tblSelf s1
                inner join tblSelf s2
                    on s1.seq = s2.super;


-- ��� �������� vs ����
-- : �������� �� �� �ִ� �� = ���������� �� �� �ִ� ��
select 
    name, 
    department as "���Ϻμ�",
    (select name from tblSelf where seq=s1.super) as "����",
    (select department from tblSelf where seq=s1.super) as "���μ�" 
        from tblSelf s1; --���� ���


-- �� : select����(SQL ��ü��) �����ϴ� ��ü. �ڹ�(�޼ҵ�)
-- ���ν��� : select, insert, update, delete.. �� ��� SQL�� �����ϴ� ��ü. �ڹ�(== �޼ҵ�)

create view vwStudent
as
select * from tblAddressBook where job = '�л�';


-- ���� : ���̺�ó�� ���ȴ�.

--select���� �ĺ��ڰ� �����. > ���߿� �ٽ� ȣ���� �� �ִ�. > ������ �ϰڴٴ� �ǵ�.
select * from vwStudent; 

--�ζ��� �� > select���� �ĺ��ڰ� ���� > ���߿� �ٽ� ȣ���� �� ����. > ������ ���� �ʰڴٴ� �ǵ�. 1ȸ��
select * from (select * from tblAddressBook where job = '�л�'); 


--ORA-00957: duplicate column name
create view �������
as
select m.name as mname, v.name as aname, r.rentdate, g.price from tblMember m
        left outer join tblRent r
                on m.seq = r.member
                        inner join tblVideo v
                                on v.seq = r.video
                                        inner join tblGenre g
                                                on g.seq = v.genre;


select * from �������;
insert into ������� (mname, vname, rentdate, price) values ('������', '���ޱ���', sysdate, 2000);



-- �� �����ϴ� ���
-- : DB Object �����ϴ� ��ɾ� > alter
-- : ��� �ٸ� ����� ���
--  1. drop > create
--  2. ����
create or replace view tblComplete
as
select title, completedate from tblTodo where completedate is not null;

drop view tblComplete;

select * from tblComplete;



-- **** ��� �б� �����̴�. ��� �б� �������θ� ����ؾ� �Ѵ�.

select * from tblTodo;

--���ο� ���� �߰��ϱ�
insert into tblTodo (seq, title, adddate, completedate) values (21, '����Ŭ �����ϱ�', sysdate, null);

-- �����
create or replace view vwTodo
as
--select * from tblTodo;
select title, completedate from tblTodo;

-- �б�
select * from vwTodo;

-- ����
insert into vwTodo (seq, title, adddate, completedate) values (22, '�� �����ϱ�', sysdate, null);

--ORA-00904: "ADDDATE": invalid identifier
--ORA-01400: cannot insert NULL into ("HR"."TBLTODO"."SEQ")
insert into vwTodo (title, completedate) values ('�� �����ϱ�', null);

-- �����ϱ�
update vwTodo set title = 'Oralce �����ϱ�' where seq = 21;

-- �����ϱ�
delete from vwTodo where seq = 22;


-- �� ���� DML ���������� ����ٸ�? > ���̺��� ����Ѵ�.
-- ��� �д� �뵵�θ� ����Ѵ�.


























