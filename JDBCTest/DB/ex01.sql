/*

C:\Class\Java\DB\필기.txt


OracleXE112_Win64.zip : 오라클, 데이터베이스, DBMS, 서버
SQL Developer : 클라이언트 툴
---------------------------------------------------
eXERD : 모델링 툴


오라클, Oracle
- 회사명
- 제품명(데이터베이스 + 데이터베이스 관리 시스템(DBMS))
- 응용 프로그램(X), 서비스 프로그램(O)
- Win + R(실행) > services.msc 
	1. OracleServiceXE
		- 데이터베이스 서버 서비스
	2. OracleXETNSListener
		- 클라이언트 요청 관리 서비스


오라클 서비스 시작/멈춤
1. 바로가기 메뉴 사용
2. C:\oraclexe\app\oracle\product\11.2.0\server\bin
	a. StartDB.bat(배치 파일 - 명령어 집합)
	b. StopDB.bat
3. 직접
	cmd > net start 서비스명
	cmd > net stop 서비스명
	cmd > net start OracleServiceXE
	cmd > net stop OracleServiceXE
	

데이터베이스 클라이언트 툴
- SQL Developer(***)
- Toad
- Query Box
- SQLGate
- DataGrip(**)




127.0.0.1
- 특별한 IP 주소
- 루프백(Loop Back), 핑(Ping) 주소
- 나 자신을 뜻하는 예약된 IP 주소
- localhost(운영체제에 의해서 정해짐)
	- C:\Windows\System32\drivers\etc\hosts





SQL Developer : 워크 시트
보통 DB : 스트립트 파일(Script)

목적 > SQL 작성
*/

--단일라인

--ex01.sql


-- 스크립트내에 있는 명령어들은 서로간의 순서나 관계가 없다.
select * from tabs;

desc HELP;

-- 관리자(system)으로 접속 중
-- 일반 유저 계정 접속 중
-- 오라클에서 학습용으로 제공하는 샘플 계정
-- 1. scott/tiger
-- 2. hr/lion *** 수업용
-- : human resources - 인적 관리 샘플 데이터 계정

-- hr 계정은 오라클 설치 직후 : Lock 상태
-- 잠긴 계정을 풀기(관리자)
alter user hr account unlock;

-- 암호를 변경하기(관리자)
alter user hr identified by java1234;

/*

DB 관련 직무

1. DB 관리자, DB Administrator
    - DB 총괄
    - DB 서비스 안정적으로 운영/관리

2. DB 엔지니어
    - H/W 관리

3. 백업 담당자
    - DB 관리자 겸함

4. 모델러
    - DB 설계

5. 튜너
    - DB 튜닝

6. DB 개발자
    - 데이터 조작/관리 업무
    - SQL 작업
    - 응용 프로그램 개발자도 많이 겸함
    
    

SQL
- Structured Query Language
- 구조화된 질의 언어
- 관계형 데이터베이스 시스템에서 서버와 대화할 수 있는 언어(명령어)

SQL 명령어의 종류

1. DDL, Data Definition Language, 데이터 정의어
    - 데이터를 저장하기 위한 데이터베이스의 구조를 정의하는 명령어
    - 테이블, 객체, 사용자, DB Object 등.. 생성 & 삭제
    a. create : 객체 생성
    b. drop : 객체 삭제
    c. alter : 객체 수정
    - 데이터베이스 관리자(담당자), 프로그래머(일부)

2. DML, Data Manipulation Language, 데이터 조작어
    - 데이터베이스에 데이터를 추가/검색/수정/삭제하는 작업
    - SQL 가장 기본 & 많은 부분
    - 데이터 CRUD 작업
    a. select : 데이터 가져오기(R) *********************
    b. insert : 데이터 추가하기(C)
    c. update : 데이터 수정하기(U)
    d. delete : 데이터 삭제하기(D)
    - 데이터베이스 관리자(담당자), 프로그래머(주업무)

3. DCL, Data Control Language, 데이터 제어어
    - 계정, 보안, 트랜잭션 등 제어
    a. commit
    b. rollback
    c. grant
    d. revoke
    - 데이터베이스 관리자(담당자)    
    
--------
4. DQL, Data Query Language
    - DML 중에 select문만을 별도로 DQL라고 부른다.

5. TCL, Transact Control Language
    - DCL 중에 트랜잭션 관련 명령어만 따로 빼서 TCL이라고 부른다.
    a. commit
    b. rollback
    

SQL의 종류

1. ANSI-SQL(=표준 SQL)
    - ANSI, ISO에서 표준화 작업을 거친 표준 SQL 구문
    - DBMS 종류와 무관하게 공통으로 사용하는 명령어

2. PL/SQL
    - 오라클사에서 별도록 제작한 확장자 SQL 구문
    - 오라클에서만 동작(다른 DB에서는 동작하지 않는 명령어)



클라이언트 툴

1. SQL Developer
2. SQL*Plus : 오라클 설치 시 같이 설치되는 클라이언트 툴(콘솔 프로그램)
    cmd > sqlplus
    


*/


















