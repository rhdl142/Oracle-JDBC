/*

C:\Class\Java\DB\�ʱ�.txt


OracleXE112_Win64.zip : ����Ŭ, �����ͺ��̽�, DBMS, ����
SQL Developer : Ŭ���̾�Ʈ ��
---------------------------------------------------
eXERD : �𵨸� ��


����Ŭ, Oracle
- ȸ���
- ��ǰ��(�����ͺ��̽� + �����ͺ��̽� ���� �ý���(DBMS))
- ���� ���α׷�(X), ���� ���α׷�(O)
- Win + R(����) > services.msc 
	1. OracleServiceXE
		- �����ͺ��̽� ���� ����
	2. OracleXETNSListener
		- Ŭ���̾�Ʈ ��û ���� ����


����Ŭ ���� ����/����
1. �ٷΰ��� �޴� ���
2. C:\oraclexe\app\oracle\product\11.2.0\server\bin
	a. StartDB.bat(��ġ ���� - ��ɾ� ����)
	b. StopDB.bat
3. ����
	cmd > net start ���񽺸�
	cmd > net stop ���񽺸�
	cmd > net start OracleServiceXE
	cmd > net stop OracleServiceXE
	

�����ͺ��̽� Ŭ���̾�Ʈ ��
- SQL Developer(***)
- Toad
- Query Box
- SQLGate
- DataGrip(**)




127.0.0.1
- Ư���� IP �ּ�
- ������(Loop Back), ��(Ping) �ּ�
- �� �ڽ��� ���ϴ� ����� IP �ּ�
- localhost(�ü���� ���ؼ� ������)
	- C:\Windows\System32\drivers\etc\hosts





SQL Developer : ��ũ ��Ʈ
���� DB : ��Ʈ��Ʈ ����(Script)

���� > SQL �ۼ�
*/

--���϶���

--ex01.sql


-- ��ũ��Ʈ���� �ִ� ��ɾ���� ���ΰ��� ������ ���谡 ����.
select * from tabs;

desc HELP;

-- ������(system)���� ���� ��
-- �Ϲ� ���� ���� ���� ��
-- ����Ŭ���� �н������� �����ϴ� ���� ����
-- 1. scott/tiger
-- 2. hr/lion *** ������
-- : human resources - ���� ���� ���� ������ ����

-- hr ������ ����Ŭ ��ġ ���� : Lock ����
-- ��� ������ Ǯ��(������)
alter user hr account unlock;

-- ��ȣ�� �����ϱ�(������)
alter user hr identified by java1234;

/*

DB ���� ����

1. DB ������, DB Administrator
    - DB �Ѱ�
    - DB ���� ���������� �/����

2. DB �����Ͼ�
    - H/W ����

3. ��� �����
    - DB ������ ����

4. �𵨷�
    - DB ����

5. Ʃ��
    - DB Ʃ��

6. DB ������
    - ������ ����/���� ����
    - SQL �۾�
    - ���� ���α׷� �����ڵ� ���� ����
    
    

SQL
- Structured Query Language
- ����ȭ�� ���� ���
- ������ �����ͺ��̽� �ý��ۿ��� ������ ��ȭ�� �� �ִ� ���(��ɾ�)

SQL ��ɾ��� ����

1. DDL, Data Definition Language, ������ ���Ǿ�
    - �����͸� �����ϱ� ���� �����ͺ��̽��� ������ �����ϴ� ��ɾ�
    - ���̺�, ��ü, �����, DB Object ��.. ���� & ����
    a. create : ��ü ����
    b. drop : ��ü ����
    c. alter : ��ü ����
    - �����ͺ��̽� ������(�����), ���α׷���(�Ϻ�)

2. DML, Data Manipulation Language, ������ ���۾�
    - �����ͺ��̽��� �����͸� �߰�/�˻�/����/�����ϴ� �۾�
    - SQL ���� �⺻ & ���� �κ�
    - ������ CRUD �۾�
    a. select : ������ ��������(R) *********************
    b. insert : ������ �߰��ϱ�(C)
    c. update : ������ �����ϱ�(U)
    d. delete : ������ �����ϱ�(D)
    - �����ͺ��̽� ������(�����), ���α׷���(�־���)

3. DCL, Data Control Language, ������ �����
    - ����, ����, Ʈ����� �� ����
    a. commit
    b. rollback
    c. grant
    d. revoke
    - �����ͺ��̽� ������(�����)    
    
--------
4. DQL, Data Query Language
    - DML �߿� select������ ������ DQL��� �θ���.

5. TCL, Transact Control Language
    - DCL �߿� Ʈ����� ���� ��ɾ ���� ���� TCL�̶�� �θ���.
    a. commit
    b. rollback
    

SQL�� ����

1. ANSI-SQL(=ǥ�� SQL)
    - ANSI, ISO���� ǥ��ȭ �۾��� ��ģ ǥ�� SQL ����
    - DBMS ������ �����ϰ� �������� ����ϴ� ��ɾ�

2. PL/SQL
    - ����Ŭ�翡�� ������ ������ Ȯ���� SQL ����
    - ����Ŭ������ ����(�ٸ� DB������ �������� �ʴ� ��ɾ�)



Ŭ���̾�Ʈ ��

1. SQL Developer
2. SQL*Plus : ����Ŭ ��ġ �� ���� ��ġ�Ǵ� Ŭ���̾�Ʈ ��(�ܼ� ���α׷�)
    cmd > sqlplus
    


*/


















