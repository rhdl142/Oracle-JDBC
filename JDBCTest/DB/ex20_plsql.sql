-- ex20_plsql.sql
/*

PL/SQL
- Procedural Language Extensions to SQL(+ 절차, 제어)
- 표준 SQL : 비 절차성 언어(명령어들간의 순서가 없다. 명령어들끼리 연속적이지 않다.)
- 표준 SQL + 절차적 기능 추가 -> 오라클 추가 SQL -> PL/SQL
- 추가된 부분 : 자바의 프로그래밍 기능 추가(변수, 제어문, 메소드 등..)
- 오라클 전용 SQL

- 표준 SQL <> PL/SQL : 표준 SQL 자료형의 거의 통일시켰다.
- 표준 SQL : 문장 종결자 필수X
- PL/SQL : 문장 종결자 필수O


SQL 처리 과정 & 순서

1. 표준 SQL
    : 클라이언트 구문 작성(select 문) > 실행(Ctrl + Enter) > 네트워크를 통해 SQL(문자열)이 DBMS 서버에 전달
        > DBMS 전달 받음 > 구문 분석(파싱) > 컴파일(인터프리팅) > 기계어(명령어) > 실제 실행(CPU) > 결과 처리 > 반환
    : 위에서 한번 실행했던 질의를 다시 실행(똑같은 SQL을 다시 실행) > 위의 과정을 처음부터 끝까지 완전히 동일하게 반복(***)

2. PL/SQL
    : 클라이언트 구문 작성(select 문) > 실행(Ctrl + Enter) > 네트워크를 통해 SQL(문자열)이 DBMS 서버에 전달
        > DBMS 전달 받음 > 구문 분석(파싱) > 컴파일(인터프리팅) + 컴파일 결과 저장(DB) > 기계어(명령어) > 실제 실행(CPU) > 결과 처리 > 반환
    : 위에서 한번 실행했던 질의를 다시 실행(똑같은 SQL을 다시 실행) > 
        클라이언트 구문 작성(select 문) > 실행(Ctrl + Enter) > 네트워크를 통해 SQL(문자열)이 DBMS 서버에 전달
        > DBMS 전달 받음 > X > X > X > 위의 컴파일 결과 로드 > 실제 실행(CPU) > 결과 처리 > 반환


프로시저, Procedure
- 함수, 메소드, 서브루틴 등..
- 특정 목적을 가지고 모인 순서대로 실행하는 명령어의 집합
1. 익명 프로시저 : 이름없음 > 재사용을 목적으로 하지 않는 프로시저 > 동작 방식(표준 SQL 동일) > 확장 기능때문에 사용
2. 실명 프로시저 : 이름있음 > 재사용을 목적으로 하는 프로시저 > 동작 방식(Pl/SQL 동일. 재사용) > 비용 절감 + 확장 기능
        
*/
select * from tblInsa;


 SET SERVEROUTPUT ON ; 
 
set serveroutput on;

-- 프로시저 영역(코드 블럭 {})
begin -- {
    -- 각종 명령어 : 표준 SQL + PL/SQL
    dbms_output.put_line('Hello'); -- System.out.println()
end; -- }

begin   
    dbms_output.put_line('Hello');
end;


/*

PL/SQL 블럭 구조

1. 4개의 키워드로 구성
a. [declare]
b. begin
c. [exception]
d. end;

2. declare
- 선언부, declare section
- 프로그램에서 사용되는 변수, 객체 등을 선언하는 영역
- 생략 가능

3. begin
- 실행부, 구현부, executable section
- begin ~ end
- 프로그램에서 실제 구현 내용들을 선언하는 영역
- 표준 SQL + PL/SQL(연산, 제어 등..)
- 생략 불가능

4. exception
- 예외 처리부, exception section
- catch 절 역할
- 예외 처리 코드를 선언하는 영역
- 생략 가능

5. end;
- 블럭의 종료
- 생략 불가능

6. PL/SQL 블럭 = 선언부 + 실행부 + 예외처리부

자바
{  
    {
        
    }
}

오라클
begin
    begin
    
    end;
end;


declare
    변수, 자원 선언
begin
    구현부
exception
    예외처리부
end;




자료형 & 변수

자료형
- 표준 SQL 동일(거의 유사 + 확장)

변수 선언하기
- 변수명 자료형 [not null] [default 값]
- 표준 SQL에서 컬럼 정의하는 구문과 유사
- 변수의 역할 : 질의(select 문)의 결과나 인자값을 저장하는 용도

연산자
- 표준 SQL 동일

표준 SQL 대입 연산자
    - 컬럼명 = 값; // update tblInsa set buseo = '영업부';
    - 용도 : 컬럼값 대입

PL/SQL 대입 연산자
    - 변수 := 값;
    - 용도 : 변수값 대입

*/

declare
    num number; -- number : PL/SQL 자료형
    name varchar2(30); --varchar2 : PL/SQL 자료형
    today date; --date : PL/SQL 자료형
begin
    
    num := 10; --정수형 리터럴(표준 SQL 동일)
    dbms_output.put_line(num);
    
    name := '홍길동';
    dbms_output.put_line(name);
    
    today := sysdate;
    dbms_output.put_line(today);
    dbms_output.put_line(to_char(today, 'yyyy-mm-dd'));
    
    today := '2018-09-04';
    dbms_output.put_line(today);
    
    
    --ORA-06502: PL/SQL: numeric or value error: character string buffer too small
    name := '홍길동입니다안녕하세요';
    dbms_output.put_line(name);
        
end;






declare
    num1 number;
    --num2 number not null; --사용 유무와 상관없이 end;전까지 반드시 값을 가져야 한다.
    num3 number default 100;
    num4 number not null default 300;
    num5 number := 500; --비권장(초기화는 begin 블럭에서 주로 한다.)
    today date := sysdate;
begin
    
    --변수 초기화 X
    --바로 사용 : 초기화를 하지 않은 변수도 사용이 가능하다.(null 값인 채로 사용 가능)
    dbms_output.put_line(num1); --null 출력
    
    --PLS-00218: a variable declared NOT NULL must have an initialization assignment
    --dbms_output.put_line(num2); --null 출력
    
    --num3 := 200;
    dbms_output.put_line(num3);
    
    --num4 := 400;
    dbms_output.put_line(num4);
    
    
    dbms_output.put_line(num5);
    
end;

/*
테이블에서 조회한 데이터를 변수를 담기

*/
declare
    vbuseo varchar2(15);
begin
    --vbuseo := (select buseo from tblInsa where name = '홍길동');
    
    -- select의 결과 컬럼값을 변수에 대입 > into
    select buseo into vbuseo from tblInsa where name = '홍길동';
    dbms_output.put_line(vbuseo);
    
end;


declare
    cnt number;
begin
    
    select count(*) into cnt from tblAddressBook where address like '서울특별시%';
    dbms_output.put_line('서울특별시 인원수 : ' || to_char(cnt, '9,999') || '명');
    
end;

declare
    vbuseo number;
begin
    select buseo into vbuseo from tblInsa where name = '홍길동';
    dbms_output.put_line(vbuseo);    
end;


declare
    cnt varchar2(50); --형변환이 가능한 상황이면 암시적으로 해준다.
begin
    select count(*) into cnt from tblAddressBook where address like '서울특별시%';
    dbms_output.put_line('서울특별시 인원수 : ' || to_char(cnt, '9,999') || '명');
end;


declare
    vbuseo varchar2(100); --길이가 더 큰건 상관없다.(overflow X)
begin
    select buseo into vbuseo from tblInsa where name = '홍길동';
    dbms_output.put_line(vbuseo);    
end;


declare
    vbuseo varchar2(6);  --결과값보다 크기가 작으면 에러 발생
begin
    select buseo into vbuseo from tblInsa where name = '홍길동';
    dbms_output.put_line(vbuseo);    
end;


declare
    vpop number;
begin
    select population into vpop from tblCountry where name = '대한민국';
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
    from tblCountry where name = '케냐';
    dbms_output.put_line(vpop);    
end;

-- 위의 쿼리
-- 질의의 결과가 단일값이어 한다.
-- : 단일 컬럼 + 단일 행
-- : PK 조건 + 단일 컬럼 : select 결과셋
-- : 집계 함수의 결과셋

-- 반환되는 컬럼의 갯수를 여러개
-- : N개의 반환값 > N개의 변수
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
        (select count(*) from tblInsa where buseo = i.buseo and jikwi <> '부장')
        into 
        vbuseo, 
        vjikwi, 
        vbasicpay, 
        vtotal,
        vcnt
    from tblInsa i where name = '홍길동';
    dbms_output.put_line('부서 : ' || vbuseo || ', 직위 : ' || vjikwi || ', 급여 : ' || vbasicpay);    
    dbms_output.put_line('총급여 : ' || vtotal);
    dbms_output.put_line(vbuseo || '의 총인원수 : ' || vcnt);
end;

desc tblInsa;


/*
참조형
- 원본(컬럼)의 자료형을 참조해서 변수의 자료형으로 사용할 수 있다.
- 원본(컬럼)의 자료형을 몰라도 된다.
- 유지 보수 유리

1. %type
- 대상 컬럼의 자료형과 길이를 참조해서 해당 변수에 적용하겠습니다.
- 복사되는 항목
    a. 자료형
    b. 길이
    c. not null

2. %rowtype
- 테이블 레코드 구조를 참조해서 해당 변수에 적용하겠습니다.
- %type의 집합

*/

declare
    vname tblInsa.name%type;-- vname varchar2(20) not null
    --vname varchar2(20) not null;
    --vname char(40);
    vbuseo tblInsa.buseo%type;
    vbasicpay tblInsa.basicpay%type;
begin
    select name, buseo, basicpay into vname, vbuseo, vbasicpay from tblInsa 
        where (basicpay + sudang) = (select min(basicpay + sudang) from tblInsa);--심심해
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
    dbms_output.put_line('가장 키 큰 사람 : ' || vlast || vfirst || ' - ' || vheight);
    
    select first, last, height into vfirst, vlast, vheight from tblname
        where height = (select min(height) from tblname);
    dbms_output.put_line('가장 키 작은 사람 : ' || vlast || vfirst || ' - ' || vheight);
    
    select first, last, weight into vfirst, vlast, vweight from tblname
        where weight = (select max(weight) from tblname);
    dbms_output.put_line('가장 뚱뚱한 사람 : ' || vlast || vfirst || ' - ' || vweight);
    
    select first, last, weight into vfirst, vlast, vweight from tblname
        where weight = (select min(weight) from tblname);
    dbms_output.put_line('가장 마른 사람 : ' || vlast || vfirst || ' - ' || vweight);
    
end;



declare
    oldMan tblMen.name%type; --옛남자친구
    newMan tblMen.name%type; --현재남자친구
    newWoman tblWomen.name%type; --여자친구
begin
    --홍길동의 여자친구 > 바람 > 하하하
    --select * from tblMen;
    --select * from tblWomen;
    
    oldMan := '홍길동';
    newMan := '하하하';
    
    --1.
    select couple into newWoman from tblMen where name = oldMan;
    
    --2.
    update tblWomen set couple = newMan where name = newWoman;
    
    --3.
    update tblMen set couple = newWoman where name = newMan;
    
    --4.
    update tblMen set couple = null where name = oldMan;
    
    dbms_output.put_line('완료');
    
end;


commit;
rollback;

select * from tblWomen;
select * from tblMen;



-- tblInsa. 직원 중 일부에게만 보너스 지급. 지급 내역을 별도로 저장
create table tblBonus
(
    seq number primary key, --일련 번호(PK)
    iseq number references tblInsa(num) not null, --직원 번호(FK)
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
        where city = '서울' and jikwi = '부장' and to_char(ibsadate, 'yyyy') <= 1995;
    
    --dbms_output.put_line(vnum);
    --dbms_output.put_line(vsudang);
    
    --2.
    insert into tblBonus (seq, iseq, bonus) values (bonusSeq.nextval, vnum, vsudang * 3);
    
end;

select * from tblBonus;

select b.*,
    (select name from tblInsa where num = b.iseq), --김인수
    (select city from tblInsa where num = b.iseq),
    (select jikwi from tblInsa where num = b.iseq),
    (select to_char(ibsadate, 'yyyy') from tblInsa where num = b.iseq),
    (select sudang from tblInsa where num = b.iseq)
from tblBonus b;


--tblTodo. 가장 질질 끌던 완료 못한 일을 목록에서 제거하기
select * from tblTodo;

--서브쿼리
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


-- PL/SQL 블럭 구조
-- 자료형 + 변수 생성
-- 변수의 자료형 > 테이블+컬럼 참조형
-- select 결과 > 단일값 가져오기
-- select 결과 > 단일레코드 + 다중 컬럼값 가져오기
-- 변수값을 select, update, delete, insert 등에 사용하기



declare
    -- 자료형을 참조(good) + 컬럼 갯수가 많다.(bad)
--    vfirst tblname.first%type;
--    vlast tblname.last%type;
--    vgender tblname.gender%type;
--    vheight tblname.height%type;
--    vweight tblname.weight%type;
--    vnick tblname.nick%type;
    vrow tblname%rowtype; --컬럼의 집합
begin
    
    -- 컬럼 갯수가 많다.(bad)
    --select first, last, gender, height, weight, nick into vfirst, vlast, vgender, vheight, vweight, vnick
    --    from tblname where last = '유' and first = '재석';
        
--    select * into vfirst, vlast, vgender, vheight, vweight, vnick
--        from tblname where last = '유' and first = '재석';

    select first, last, gender, height, weight, nick into vrow
        from tblname where last = '유' and first = '재석';
    
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
    vrow tblInsa%rowtype; --10개의 컬럼을 가진 레코드 구조 변수(부분 컬럼 선택 불가능)
    vnum tblInsa.num%type; --컬럼 변수
begin
    
    vnum := 1010;
    
    --select 10개 컬럼 into 10개 변수 from tblInsa where num = vnum;
    --select * into vrow from tblInsa where num = vnum;
    select name, buseo, city into vrow from tblInsa where num = vnum;
    
    dbms_output.put_line(vrow.name);
    dbms_output.put_line(vrow.buseo);
    dbms_output.put_line(vrow.city);
    
end;

-- tblMen -> 1명(무명씨) -> tblWomen : 옮기기
select * from tblMen;
select * from tblWomen;

declare
    vrow tblMen%rowtype;
begin
    
    --1. '무명씨'의 모든 정보 가져오기(select)
    select * into vrow from tblMen where name = '무명씨';
    --dbms_output.put_line(vrow.name);
    
    --2. 1번의 모든 정보를 tblWomen에 추가하기(insert)
    --insert into tblWomen (name, age, height, weight, couple) values (vrow);
    insert into tblWomen (name, age, height, weight, couple) 
        values (vrow.name, vrow.age, vrow.height, vrow.weight, vrow.couple);
    
    --3. tblMen에서 '무명씨' 정보 삭제하기(delete)
    delete from tblMen where name = '무명씨';
    
    
end;


commit;
rollback;



/*
PL/SQL 상수
- 리터럴
- 자바 : public static final double PI = 3.14;
- 변수명 자료형 [not null] [default];
- 상수명 constant 자료형 [not null] [default];
*/

declare
    num1 number := 100;
    NUM2 constant number := 200; --***
    --NUM3 constant number; --PLS-00322: declaration of a constant 'NUM3' must contain an initialization assignment
    NUM4 constant number default 400; --default값을 상수의 초기값으로 사용
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


-- 제어문
























