-- ex21_plsql.sql
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
-- 조건문 : if문

set serveroutput on;

declare
    vnum number;
begin
    vnum := -10;
    
    if vnum > 0 then -- {
        dbms_output.put_line('양수');
    end if; -- }
    
    if vnum > 0 then
        dbms_output.put_line('양수');
    else
        dbms_output.put_line('양수아님');
    end if;
    
    if vnum > 0 then
        dbms_output.put_line('양수');
    elsif vnum < 0 then
        dbms_output.put_line('음수');
    else
        dbms_output.put_line('zero');
    
end;

-- 커플 선택 -> 둘의 나이가 가장 많은 커플 -> 남자 연상? 여자 연상?
select * from tblMen;
select * from tblWomen;

select 
    case
        when m.age - w.age > 0 then '남자 연상'
        when m.age - w.age < 0 then '여자 연상'
        else '동갑'
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
        dbms_output.put_line('남자가 연상입니다.');
    elsif wage > mage then
        dbms_output.put_line('여자가 연상입니다.');
    else
        dbms_output.put_line('동갑내기입니다.');
    end if;
    
end;


-- 현재 시각이 홀수초이면 유재석 몸무게 +1kg 증가, 짝수초이면 김숙 몸무게 +1kg 증가
begin
    if mod(to_char(sysdate, 'ss'), 2) = 0 then
        dbms_output.put_line('짝수');
        update tblWomen set weight = weight + 1 where name = '박나래';
    else
        dbms_output.put_line('홀수');
        update tblMen set weight = weight + 1 where name = '홍길동';
    end if;
end;

select * from tblMen;
select * from tblWomen;


select * from tblBonus;

-- 직원 번호 -> 부장,과장(수당 3배), 대리,사원(수당 2배)

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
    if vjikwi in ('부장','과장') then
        dbms_output.put_line('수당 3배 지급');
        --insert into tblBonus (seq, iseq, bonus) values (bonusSeq.nextval, vnum, vsudang * 3);
        vsudang := vsudang * 3;
    else
        dbms_output.put_line('수당 2배 지급');
        --insert into tblBonus (seq, iseq, bonus) values (bonusSeq.nextval, vnum, vsudang * 2);
        vsudang := vsudang * 2;
    end if;
    
    insert into tblBonus (seq, iseq, bonus) values (bonusSeq.nextval, vnum, vsudang);
    
end;

select * from tblBonus;





-- case 문
-- 자바 : switch case 문
-- 표준 SQL의 case와 같음
declare
    vcontinent tblCountry.continent%type;
    vresult varchar2(30);
begin
    
    -- 대한민국이 어느 대륙에 속하는지?
    select continent into vcontinent from tblCountry where name = '대한민국';
    
    if vcontinent = 'AS' then
        vresult := '아시아';
    elsif vcontinent = 'EU' then
        vresult := '유럽';
    elsif vcontinent = 'AF' then
        vresult := '아프리카';
    end if;
    
    dbms_output.put_line(vresult);
    
    case
        when vcontinent = 'AS' then vresult := '아시아';
        when vcontinent = 'EU' then vresult := '유럽';
        when vcontinent = 'AF' then vresult := '아프리카';
        else vresult := '기타';
    end case;
    
    dbms_output.put_line(vresult);
    
end;


/*
반복문

1. loop
- 조건 반복

2. for loop
- 지정 횟수 반복(자바 for문 유사)

3. while loop
- 조건 반복(자바 while문 유사)

*/

-- loop

-- 무한 루프 & 다른 루프 기본 골격
begin
    
    loop
        dbms_output.put_line('현재 시간 : ' || sysdate);
        --exit;
        --exit when 조건;
        exit when to_char(sysdate, 'ss') > 30;
    end loop;
    
end;

--사원 번호 1001 ~ 1060 : 10만원 지급
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
-- : 정식으로 루프 변수를 제공한다.
begin
    -- 루프변수를 따로 선언하지 않는다.
    -- i : 루프변수
    -- 변수 in 집합
    -- 1 : 초기값
    -- .. : 순차 증가
    -- 10 : 최대값
    -- reverse : 역순
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


-- 구구단 테이블
create table tblGugudan
(
    --seq number primary key
    dan number not null,-- primary key,        -- 2, 2, 2
    num number not null,-- primary key,       -- 1, 2, 3
    result number not null,      --2, 4, 6
    
    --복합키(Composite Key)
    -- : 2개 이상의 컬럼이 모여서 키본키(PK) 역할
    -- : 컬럼 수준으로 선언 불가능, 테이블 수준으로 선언 가능
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


truncate table tblGugudan; --commit 포함

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
select 문 통해서 가져온 데이터를 PL/SQL 변수에 넣는 방법
1. select into 사용
    - 결과셋의 레코드 1개일때만 가능하다.
2. 커서(cursor) 사용
    - 결과셋의 레코드가 1개 이상일 때 가능하다.
    
커서 구문

declare
    변수 선언;
    커서 선언;
begin
    커서 열기;
    loop
        커서를 사용해서 데이터 접근;
    end loop;
    커서 닫기;
end;

*/

--  select 데이터 가져오기
-- 1. select into
--      a. 단일컬럼 + 단일행
--      b. 다중컬럼 + 단일행
-- 2. cursor
--      a. 단일컬럼 + 다중행
--      b. 다중컬럼 + 다중행

-- tblInsa. 직원명 x 60개
declare
    vname tblInsa.name%type; --한명한명의 이름을 저장할 변수
    cursor vcursor
    is
    select name from tblInsa order by name asc;--아직 select문 실행 전(선언 O, 실행 X)
begin
    
    open vcursor; --커서 열기(select문 실행)
    
        loop
            
            --순차적으로 레코드 하나하나를 커서를 사용해서 접근
            fetch vcursor into vname;
            
            --커서 내장 속성
            exit when vcursor%notfound; --다음 레코드가 존재하면 false, 다음 레코드가 존재안하면 true 반환
            
            dbms_output.put_line(vname);
            
        end loop;
    
    close vcursor; --커서 닫기
    
end;


select * from tblBonus;
truncate table tblBonus;

delete from tblInsa where city = '서울';

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

-- 다중 컬럼 + 다중 레코드
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
        
        --업무
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
        
        --업무
        dbms_output.put_line(vrow.name || ', ' || vrow.buseo || ', ' || vrow.city);
        
    end loop;
    close vcursor;
end;




/*
cursor 사용법(FM)
- 커서 + loop
: 커서 객체 생성(select 문 정의) > 커서 열기(select 실행) > 루프 > 데이터 접근(fetch) + 사용(변수) > 커서 닫기

cursor 사용법(편함)
- 커서 + for loop
: 커서 처리가 단순해짐

*/
declare
    --vrow : 생성 안함 > 루프 변수가 대신함
    cursor vcursor is
        select * from tblInsa;
begin
    --open vcursor; : 생략    
    for vrow in vcursor loop -- loop + fetch into    
        dbms_output.put_line(vrow.name);    
    end loop;            
    --close vcursor; : 생략
end;


-- 커서 ≒ 뷰(실명뷰, 인라인뷰)
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
- 예외 처리부
*/
declare
    vname number;
begin
    dbms_output.put_line('시작');
    select name into vname from tblInsa where num = 1001;
    dbms_output.put_line('끝');
exception
    when others then -- catch(Exception e)
        dbms_output.put_line('예외 처리');
end;


--예외 발생 기록(로그 테이블)
create table tblLog
(
    seq number primary key, --PK
    code varchar2(20) check (code in ('AAA0001', 'BBB001', 'CCC001')) not null, --예외 업무 식별자
    message varchar2(1000) null, --상태 메시지
    regdate date default sysdate not null --발생 시각
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
        dbms_output.put_line('tblName 테이블에 데이터가 없습니다.');
        insert into tblLog values (logSeq.nextval, 'AAA0001', '김대리 담당', default);
    
    when too_many_rows then
        dbms_output.put_line('가져온 직원이 너무 많습니다.');
        insert into tblLog values (logSeq.nextval, 'BBB001', null, default);
    
    when others then
        dbms_output.put_line('오류 발생.');
        insert into tblLog values (logSeq.nextval, 'CCC001', null, default);
    
end;


select * from tblLog;




-- PL/SQL내의 트랜잭션 처리
-- : 일반적으로 PL/SQL은 블럭 자체가 하나의 트랜잭션 단위
-- : 일반적으로 실명 PL/SQL 블럭 생성 시 주로 트랜잭션 처리가 들어간다.

select * from tblMen; --홍길동 : 장도연
select * from tblWomen; --장도연 : 홍길동

commit;
rollback;

begin
    --1.
    update tblMen set couple = null where name = '홍길동'; --성공
    --2.
    update tblWomen set couple = '가가가가가가가가가가가' where name = '장도연';--실패
    
    commit;
exception
    when others then
        rollback;
end;



/*

PL/SQL 블럭 > 이름 붙이기 > 블럭이 오라클 서버에 저장(객체) > 저장 블럭 > 저장 프로그램 > Stored Procedure

저장 프로시저
- 이름을 붙인 PL/SQL 블럭
- 팀원 중 1명이 저장 프로시저 생성 > 오라클 서버 저장 > 나머지 팀원도 재사용 가능(접근 권한 있을 경우)
- 성능 향상(구문 분석 ~ 컴파일 과정 생략)
- 네트워크 트래픽 감소(코드 전체 전송 -> 프로그램 이름만 전송)
- 여러 계정이 동일한 코드를 사용 가능 + 권한 부여 제어


저장 프로그램 종류
1. 저장 프로시저. Stored Procedure
    - 모든 SQL 사용 용도
    - 매개 변수 선택
    - 반환값 선택
    - 자바 : 메소드
    - 표준 SQL에서 사용이 불가능하다.
2. 저장 함수. Stored Function
    - 주로 select 용도
    - 반드시 매개변수를 가진다.
    - 반드시 반환값을 가진다.(반환값이 단일값) : 자바 메소드 return문
    - 표준 SQL에서 사용이 가능하다.(***)


저장 프로시저 구문

create [or replace] procedure 프로시저명
is[as]
    [선언부;]
begin
    실행부;
[exception
    예외처리부;]
end [프로시저명];
    
*/

-- 프로시저 생성
create or replace procedure procTest
is --익명 블럭의 declare 역할
    vnum number;
begin
    vnum := 100;
    dbms_output.put_line(vnum);
end procTest;

-- 프로시저 호출
-- 1. PL/SQL 블럭내에서 호출(*****)
-- 프로그래밍 방식
-- 익명 블럭 or 다른 프로시저 호출
-- 주로 사용되는 방식

-- 2. 스크립트 환경에서 호출(ANSI-SQL 환경)
-- 관리자, 담당자
-- execute, call 명령어 사용
    

--2번 환경
procTest;
procTest();
select * from tblName;

begin --1번 환경
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


-- 매개변수가 있는 프로시저
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
    pname varchar2, --매개변수는 길이 명시X
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
    procTest('사각형A', 100, 50);
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
    procTest('사각형A', 100, 50);
    procTest('사각형A', 100); --2000
    procTest('사각형A');
    --procTest('사각형A', null, 100); --실패
    --procTest('사각형A', default, 100);
end;


/*
매개변수의 작동(동작) 모드
- 매개변수를 전달하는 방법
1. in 모드 : 기본
2. out 모드
3. in out 모드 : 사용X

*/
create or replace procedure procSum
(
    pnum1 in number, -- in 파라미터
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
    pnum1 in number, -- in 파라미터
    pnum2 in number,
    presult out number, -- out 파라미터, 반환값 역할
    presult2 out number, -- out 파라미터
    presult3 out varchar2
)
is
begin
    presult := pnum1 + pnum2;
    presult2 := pnum1 - pnum2;
    if pnum1 > pnum2 then
        presult3 := '크다';
    else
        presult3 := '작다';
    end if;
end;


declare
    vresult number;
    vresult2 number;
    vresult3 varchar2(20);
begin
    --변수 = procSum(10, 20); //이 방법 사용 불가(평범한 메소드의 반환값과는 다르다.)
    procSum(10, 20, vresult, vresult2, vresult3);
    dbms_output.put_line(vresult);
    dbms_output.put_line(vresult2);
    dbms_output.put_line(vresult3);
end;



-- 검색, 추가, 삭제 등..

-- 직원 퇴사하기
-- 1. 직원 번호 > 퇴사
-- 2. 직원명(유일) > 퇴사
create or replace procedure procDelInsa
(
    pnum in number
)
is
begin
    delete from tblInsa where num = pnum;
    insert into tblLog(seq, code, message, regdate) values (logSeq.nextval, 'AAA0001', '홍길동 퇴사', default);
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



-- 할일 추가하기 프로시저
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
    procAddTodo('오라클 프로시저 정리하기');
end;

select * from tblTodo;



select * from tblName;
select * from tblAddressBook where address like '서울%';
select * from tblAddressBook where substr(address, 1, 2) = '서울';

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
    procAddName('이광수', 'm', 190, 70, '기린');
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

--프로시저 :  id > full name 반환
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



-- 프로시저 : fullname insert
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
    vfullname varchar2(45); --out 파라미터에 대응할 실인자 변수
begin
    procGetFullname(100, vfullname);
    dbms_output.put_line(vfullname);
    procAddFullname(100, 'Steven King');
end;


-- 위의 2개의 프로시저를 하나로 통합
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


-- 프로시저 흔한 패턴 : CRUD
select * from tabs;

create table tblAddress
(
    seq number primary key, --PK
    name varchar2(30) not null, --이름
    age number(3) not null, --나이
    tel varchar2(15) not null, --전화번호
    address varchar2(500) not null, --주소
    regdate date default sysdate not null --등록시간
);

create sequence addressSeq;

-- C : 주소록 추가하기
create or replace procedure procAddAddress
(
    pname in varchar2,
    page in number,
    ptel in varchar2,
    paddress in varchar2,
    presult out number --추가 업무 성공 유무(1 : 성공, 0 : 실패)
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
    procAddAddress('홍길동', 20, '010-1234-5678', '서울시 강남구 역삼동', vresult);
    
    if vresult = 1 then
        dbms_output.put_line('입력 성공');
    else
        dbms_output.put_line('입력 실패');
    end if;
end;

select * from tblAddress;



-- R : 읽기
-- 1명의 seq > 모든 정보 반환
create or replace procedure procReadAddress
(
    pseq in number, --알고 싶은 주소록 번호
    pname out varchar2,
    page out number,
    ptel out varchar2,
    paddress out varchar2,
    pregdate out date,
    presult out number --성공 유무
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
        dbms_output.put_line('존재하지 않거나 이미 삭제된 번호를 입력했습니다.');
    else 
        dbms_output.put_line('오라클 오류. 관리자에게 연락하세요.');
    end if;    
end;






-- U : 주소록 중 1건(레코드) 수정하기
-- 번호(PK)
-- 이름, 나이, 전화, 주소, 등록일
--procUpdateAddress(seq, '홍길돈');
--procUpdateAddress(seq, '서울시 강동구 천호동');
--procUpdateAddress(seq, '홍길돈', 19);
--procUpdateAddress(seq, '010-584-9854', '서울시 강남구 대치동');


--update tblAddress set
--    name = 새이름
--        where seq = 번호
--
--update tblAddress set
--    address = 새주소
--        where seq = 번호
--
--update tblAddress set
--    name = 새이름, age = 새나이
--        where seq = 번호


procUpdateAddress(1, '홍길돈', 20, '010-1234-5678', '서울시 강남구 역삼동');

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
    procUpdateAddress(1, '홍길동', '스무살', '010-1234-5678', '서울시 강남구 역삼동', vresult);
    
    if vresult = 1 then
        dbms_output.put_line('수정 완료');
    elsif vresult = 2 then
        dbms_output.put_line('존재하지 않거나 이미 삭제된 정보입니다');
    else
        dbms_output.put_line('오라클 오류');
    end if;
end;

select * from tblAddress;





-- D : 주소록 레코드 삭제
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


-- 부모 테이블(PK) <-> 자식 테이블(FK + 일반 컬럼) : 비식별 관계
-- 부모 테이블(PK) <-> 자식 테이블(FK + PK 컬럼) : 식별 관계

-- 회원 가입 > 회원 정보(주요 정보 + 보조 정보)
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


-- 회원 가입 프로시저
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
    --procRegister('hong', '1234', '홍길동', 20, '010-2514-8745', '서울시');
    procRegister('test', '1234', '테스트', 20, '010-2514-874503432540340340303', '서울시');
end;

select * from tblMain;
select * from tblSub;





-- 저장 프로그램
-- 1. 저장 프로시저
-- : PL/SQL내에서 사용 가능
-- : out 갯수 무한대

-- 2. 저장 함수
-- : PL/SQL or 표준 SQL내에서 모두 사용 가능
-- : ******* 표준 SQL 구문의 일부분로 사용 가능(select, insert, update, delete)
-- : return 1개


-- 함수, Function
-- : 인자(1개 이상) -> 반환값(1개) 프로시저
-- : out 파라미터 사용 금지 > return 문 사용

-- 프로시저
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


-- 프로시저 사용
declare
    vresult number;
    vheight number;
    vweight number;
begin
    
    procAAA(10, 20, vresult);
    dbms_output.put_line(vresult);
    
    select height, weight into vheight, vweight from tblName where first = '재석';
    
    procAAA(vheight, vweight, vresult);
    dbms_output.put_line(vresult);
    
    select procAAA(height, weight, vresult) from tblName where first = '재석';
    dbms_output.put_line(vresult);
    
end;




-- 함수 선언
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


-- 함수 사용
declare
    vresult number;
    vheight number;
    vweight number;
begin
    dbms_output.put_line(fnBBB(20, 30));
    
    vresult := fnBBB(50, 60);
    dbms_output.put_line(vresult);
    
    select height, weight into vheight, vweight from tblName where first = '재석';
    
    vresult := fnBBB(vheight, vweight);
    dbms_output.put_line(vresult);
    
    -- 함수의 사용 목적
    select fnBBB(height, weight) into vresult from tblName where first = '재석';
    dbms_output.put_line(vresult);
    
end;



select fnBBB(height, weight) from tblName where first = '재석';
select fnBBB(basicpay, sudang) from tblInsa;
select procAAA(basicpay, sudang) from tblInsa;



/*

프로시저 vs 함수
1. 매개변수
    a. 프로시저 : 0 ~ 마음대로
    b. 함수 : 1개 ~ 마음대로
2. 반환값
    a. 프로시저 : 0 ~ 마음대로 + out 파라미터
    b. 함수 : 1개 + return문
3. 사용위치
    a. 프로시저 : PL/SQL 내
    b. 함수 : 표준 SQL 내

*/

select name, ssn from tblInsa; -- 이름, 성별
select name, fnGender(ssn) from tblInsa; -- 이름, 성별

-- ssn > 성별
create or replace function fnGender
(
    pssn varchar2
) return varchar2
is
begin
    case
        when substr(pssn, 8, 1) = '1' then return '남자';
        when substr(pssn, 8, 1) = '2' then return '여자';
        else return null;
    end case;
end;




/*
트리거, Trigger
- 프로시저의 일종
- 특정 사건이 발생하면 자동으로 실행되는 프로시저
- 개발자 실행(호출) X, DBMS 실행(호출) O
- 특정 사건 : 특정 테이블을 대상으로 오라클이 실시간 감시(테이블 조작 : insert, update, delete) -> 발생 
                    -> 미리 준비해놓은 프로시저를 자동으로 호출한다.
- 실시간 감시 : 비용 발생 > 최소한 필요한 업무만..


트리거 구문

create or replace trigger 트리거명
    -- 트리거 동작 옵션
    before | after -- 사건 발생 전 | 후
    insert | update | delete -- 사건 종류
    on 테이블명 -- 사건 대상 테이블
    [for each row]
declare
    선언부;
begin
    실행부;
exception
    예외부;
end;
                    
*/


-- 특정 요일(수)에는 tblName의 데이터를 삭제할 수 없다.!!
create or replace trigger trgDeleteName
    before
    delete
    on tblName
begin
    
    dbms_output.put_line('trgDeleteName 실행되었습니다.');
    
    if to_char(sysdate, 'd') = 4 then
        -- 강제로 예외 발생
        -- throw new Exception()
        -- 숫자(에러코드번호) : -20000 ~ 29990
        raise_application_error(-20000, '수요일에는 tblName을 삭제할 수 없습니다.');
    end if;
    
end;

select * from tblName;
delete from tblName where first = '재석';

drop trigger trgDeleteName;





-- 로그 트리거
-- : tblName에 변화가 생기면 나중에 관리자가 보기 위한 로그를 기록

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
        vmessage := 'tblName 테이블에 새로운 레코드가 추가되었습니다.';
    elsif updating then
        vcode := 'BBB001';
        vmessage := 'tblName 테이블의 레코드가 수정되었습니다.';
    elsif deleting then
        vcode := 'CCC001';
        vmessage := 'tblName 테이블의 레코드가 삭제되었습니다.';
    end if;
    
    insert into tblLog (seq, code, message, regdate) values (logSeq.nextval, vcode, vmessage, default);
    
end;

insert into tblName values ('하하', '하', 'm', 170, 60, '별명');
update tblName set first = '호호' where first = '하하' and last = '하';
delete from tblName where first = '호호';
rollback;

select * from tblName; --9명
select * from tblLog; --2건


/*
[for each row]

1. 생략
- 문장 단위 트리거
- 1회
- DML에 의해 적용된 행의 갯수와 상관없이 DML 1회당 트리거 1회 호출

2. 사용
- 행 단위 트리거
- 반복
- DML에 의해 적용된 행의 갯수만큼 트리거가 호출
- 상관 관계 변수 지원
    a. :old
    b. :new

2.1 insert 작업 발생
    - 트리거내에서 방금 insert 된 행의 컬럼값을 접근 가능하다.
    - :new <- 방금 추가된 행을 참조하는 변수
    - :new.컬럼명 <- 방금 추가된 행의 특정 컬럼값 참조
    - :old 사용 불가능
    - after 트리거에서만 사용이 가능함.(before 트리거에서는 사용 불가능)

2.2 update 작업 발생
    - 트리거내에서 방금 수정된 행의 수정되기 전의 값과 수정된 후의 값을 접근 가능하다.
    - :new <- 방금 수정된 후의 행을 참조하는 변수
    - :old <- 방금 수정되기 전의 행을 참조하는 변수

2.3 delete 작업 발생
    - 트리거내에서 방금 삭제된 행의 값을 접근 가능하다.
    - :old <- 방금 삭제된 행을 참조하는 변수
    - :new 사용 불가능


*/


create or replace trigger trgInsertTodo
    after
    insert
    on tblTodo
    for each row
begin
    dbms_output.put_line(:new.title); --vrow
end;

insert into tblTodo values (23, '새로운 할일', sysdate, null);



create or replace trigger trgUpdateTodo
    after
    update
    on tblTodo
    for each row
begin
    dbms_output.put_line(:old.title);
    dbms_output.put_line(:new.title); 
end;



update tblTodo set title = '새할일 계획하기' where seq = 23;




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




-- tblTodo : 할일이 등록되면 최소한 3일동안은 삭제가 불가능하다.

create table tblBoard
(
    seq number primary key, --글번호(PK)
    subject varchar2(1000) not null, --글제목
    regdate date default sysdate not null --글쓴날짜
);

create table tblComment
(
    seq number primary key, --댓글번호(PK)
    subject varchar2(1000) not null, --글제목
    regdate date default sysdate not null, --글쓴날짜
    bseq number not null references tblBoard(seq) --부모글번호(FK)
);

create sequence boardSeq;
create sequence commentSeq;


--게시판 테이블 > 삭제 트리거 > 삭제할 행의 번호 > 댓글 삭제 실행
create or replace trigger trgDeleteBoard
    before
    delete
    on tblBoard
    for each row
begin
    
    delete from tblComment where bseq = :old.seq;

end;



select * from tblBoard; -- 게시판
select * from tblComment; -- 댓글

insert into tblBoard values (1, '게시판 테스트입니다.', default);
insert into tblBoard values (2, '안녕하세요~', default);

insert into tblComment values (1, '댓글입니다.', default, 1);
insert into tblComment values (2, '댓글입니다.', default, 1);
insert into tblComment values (3, '댓글입니다.', default, 1);

insert into tblComment values (4, '네 안녕하세요.', default, 2);
insert into tblComment values (5, '반갑습니다~', default, 2);

-- 첫번째 게시물 삭제하기
delete from tblComment where bseq = 1;--댓글부터 삭제
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


insert into tblUser values ('hong', '홍길동', default);

select * from tblUser;

insert into tblMemo values (1, '메모입니다.', default, 'hong');
insert into tblMemo values (2, '메모입니다.', default, 'hong');
delete from tblMemo where seq = 2;
insert into tblMemo values (3, '메모입니다.', default, 'hong');
delete from tblMemo where seq = 3;
insert into tblMemo values (4, '메모입니다.', default, 'hong');

-- 트리거 만들기 : 메모 쓰기(+10), 메모 삭제(-5)
-- 1. insert 1개, delete 1개
-- 2. insert or delete 1개

/*

프로젝트 진행..(DB)
1. 아이템 선정
2. 요구 분석
3. ERD 작성(모델링) > 설계도 작성(*****************************************************************)
4. DB Object 구현
    a. 테이블 생성
    b. 뷰 생성
    c. 인덱스 생성
    d. 트리거 생성
    e. SQL 생성(select, insert, update, delete)
    f. 함수 / 프로시저 생성
    g. 더미 데이터 생성
-----------------------------------------------
프로젝트 진행(Java)

5. 기능 명세서
6. 화면 설계
7. 구현
----------------------------------------------- Console


*/







-- DB 프로젝트에서 만들 프로시저 골격

--1. 추가 작업(C)
create or replace procedure 추가작업 (
    추가 데이터 -> in 매개변수,
    성공 유무 반환 -> out 매개변수
)
is
    내부 변수
begin
    작업(insert.. + select..)
    commit;
exception
    when others then
        예외작업;
        rollback;
end;




--2. 수정 작업(U)
create or replace procedure 수정작업 (
    식별자 데이터 -> in 매개변수,
    수정 데이터 -> in 매개변수,
    성공 유무 반환 -> out 매개변수
)
is
    내부 변수
begin
    작업(update.. + select..)
    commit;
exception
    when others then
        예외작업;
        rollback;
end;

--3. 삭제 작업(D)
create or replace procedure 삭제작업 (
    식별자 데이터 -> in 매개변수,
    성공 유무 반환 -> out 매개변수
)
is
    내부 변수
begin
    작업(delete.. + select..)
    commit;
exception
    when others then
        예외작업;
        rollback;
end;




--4. 읽기 작업(R) - 조건 선택 + 반환값(단일 컬럼 + 단일 레코드)
create or replace procedure 읽기작업 (
    조건 데이터 -> in 매개변수,
    단일 반환값 -> out 매개변수
)
is
    내부 변수
begin
    작업(select..)
    commit;
exception
    when others then
        예외작업;
        rollback;
end;



--5. 읽기 작업(R) - 조건 선택 + 반환값(다중 컬럼 + 단일 레코드)
create or replace procedure 읽기작업 (
    조건 데이터 -> in 매개변수,
    단일 반환값 -> out 매개변수,
    단일 반환값 -> out 매개변수,
    단일 반환값 -> out 매개변수
)
is
    내부 변수
begin
    작업(select..)
    commit;
exception
    when others then
        예외작업;
        rollback;
end;



--6. 읽기 작업(R) - 조건 선택 + 반환값(컬럼 + 다중(**) 레코드)
create or replace procedure 읽기작업 (
    조건 데이터 -> in 매개변수,
    커서 -> out 매개변수
)
is
    내부 변수
begin
    작업(select..)
    commit;
exception
    when others then
        예외작업;
        rollback;
end;





-- 커서(결과셋)를 반환하는 프로시저 만들기

select * from tblInsa where buseo = '?';

create or replace procedure procGetBuseo (
    pbuseo in varchar2, --조건
    presult out sys_refcursor --반환값으로 사용하는 cursor 자료형(= 결과 테이블)
)
is
begin
    
    open presult 
        for select * from tblInsa where buseo = pbuseo;
    
end;

set serveroutput on;

declare
    vresult sys_refcursor; --프로시저 반환한 커서를 참조하는 변수
    vrow tblInsa%rowtype;
begin
    
    procGetBuseo('영업부', vresult);
    
    loop
        fetch vresult into vrow;
        exit when vresult%notfound;
        
        dbms_output.put_line(vrow.name);    
    end loop;
    
end;


-- 기간 대입 > 반납 안한 내역 목록
-- 시작날짜 ~ 끝날짜 > date ? 년월일 각각 ?
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
    vresult sys_refcursor; --대여 내역
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































