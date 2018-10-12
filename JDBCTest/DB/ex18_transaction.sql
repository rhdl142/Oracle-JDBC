-- ex18_transaction.sql
/*

Ʈ�����, Transaction
- ����Ŭ(DBMS)���� �߻��ϴ� 1�� �̻��� ��ɾ�(SQL)���� �ϳ��� �� �������� ���� ���� ���� -> ����(����)
- Ʈ����ǿ� ���ؼ� �����Ǵ� ��ɾ� : DML�� ���Եȴ�.(insert, update, delete). �����Ϳ� ������ ���ϴ� ��ɾ�.

Ʈ����� ����
- DCL�� �� ����
1. commit
2. rollback
3. savepoint

Ʈ������� ����
- �ϳ��� Ʈ��������� �����ִ� ��� ��ɾ� ��� > ��� ��ɾ �����ϸ� Ʈ����� ����, �Ϻ� ��ɾ �����ϸ� Ʈ����� ����



1. �� Ʈ������� �����ϴ� ���
    a. Ŭ���̾�Ʈ�� ������ �� ��
    b. commit ��ɾ ������ �� ��
    c. rollback ��ɾ ������ �� ��
    d. ddl, dcl ��ɾ ������ �� ��

2. ���� Ʈ������� �����ϴ� ���
    a. Ŭ���̾�Ʈ�� ������ ������ �� ��
    b. commit ��ɾ ������ �� ��
    c. rollback ��ɾ ������ �� ��
    d. ddl, dcl ��ɾ ������ �� ��(Auto Commit)

c. �ڵ� Ŀ��, Auto Commit
    - ddl, dcl ��ɾ ���ؼ� ���� Ʈ������� ����Ǵ� ����
    - ����!!!!!!!!!!!

d. Auto Commit
    - ���� �ڵ� Ŀ�� ���
    - ��� insert, update, delete�� ���� ������ ������ commit �ٷ� �̾ ����
    - rollback �Ұ���
    


*/

drop table �����;

create table �����
as
select * from tblInsa where city = '����';


select * from �����; --20��

delete from ����� where name = 'ȫ�浿';

commit;

delete from ����� where name = '������';
update ����� set jikwi = '�븮' where name = '������';


rollback;


create table tblTest2
(
    seq number primary key
);


commit;

select * from �����;

delete from ����� where name = '�踻��';

savepoint a;

delete from ����� where name = '�����';

savepoint b;

delete from ����� where name = '�迵��';

select * from �����;

-- commit or rollback ?
rollback; --Ʈ����� ���
rollback to a;

-- ó�� : commit, rollback
-- ���� : savepoint

























