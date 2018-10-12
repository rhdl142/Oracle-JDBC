-- ex10_update.sql
/*

update ��
- DML(insert, update, delete)
- ���ϴ� ���� ���ϴ� �÷� �����͸� �����ϴ� ��ɾ�
- update ���̺�� set �÷��� = �����Ұ� [, �÷��� = �����Ұ�] x N [where ��]
- ���̺��� ��� �࿡ ���� �����۾��� ����ȴ�.
- where�� : �����ϰ� ���� ���ڵ� ����
*/

-- Ʈ����� ó��
commit;
rollback;

select * from tblname;

select * from tblname where last = '��' and first = '�缮';
update tblname set gender = 'f' where last = '��' and first = '�缮';


select * from tblinsa;

-- ȫ�浿 : ���� > �̻�
-- ****** ������ ����� ������ ��(1��) -> �ĺ� -> PK -> num �÷� -> num �÷��� ��������
update tblinsa set
    jikwi = '�̻�'
        --where name = 'ȫ�浿';
        where num = 1001;

-- ������(�׷�) ������Ʈ : ��� ��ȹ�� ������ �޿� 10% �λ�. ȫ�浿(2610000) �̿���(1960000)
update tblinsa set
    basicpay = basicpay * 1.1
        where buseo = '��ȹ��';

-- ����� ������Ʈ
update tblinsa set
    basicpay = basicpay * 1.1;
    --basicpay *= 1.1; --SQL�� ���� ���� �����ڰ� ����.


--ȫ�浿�� �ּ� : ���� > �λ�
select * from tblinsa;

update tblinsa set
    city = '�λ�';
    
update �����̺� set
    �ּ��� = '�ұ���';

-- �ش� ������ ���Ѿ��� ������ �ĺ��� : PK
select * from tblinsa;
update tblinsa set
    num = 1100
        where num = 1001;

-- ** ������ �� ���̺��� �÷� ������׿� ��߳��� �ʴ� �����θ� ���� �����ϴ�.




/*
delete ��
- DML(insert, update, delete)
- (��) �����͸� �����ϴ� ��ɾ�
- �Ϻ� �÷����� ���� �Ұ��� > update(null)
- delete [from] ���̺�� [where ��]
*/

commit;
rollback;

select * from tblinsa;

delete from tblinsa where city = '����';
delete from tblinsa where city <> '���';

delete from tblinsa where num = 1002;

delete from tblinsa;















