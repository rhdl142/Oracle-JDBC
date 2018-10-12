-- ex10_update.sql
/*

update 문
- DML(insert, update, delete)
- 원하는 행의 원하는 컬럼 데이터를 수정하는 명령어
- update 테이블명 set 컬럼명 = 수정할값 [, 컬럼명 = 수정할값] x N [where 절]
- 테이블의 모든 행에 대한 수정작업이 실행된다.
- where절 : 수정하고 싶은 레코드 지정
*/

-- 트랜잭션 처리
commit;
rollback;

select * from tblname;

select * from tblname where last = '유' and first = '재석';
update tblname set gender = 'f' where last = '유' and first = '재석';


select * from tblinsa;

-- 홍길동 : 부장 > 이사
-- ****** 수정할 대상이 유일한 행(1개) -> 식별 -> PK -> num 컬럼 -> num 컬럼을 조건으로
update tblinsa set
    jikwi = '이사'
        --where name = '홍길동';
        where num = 1001;

-- 다중행(그룹) 업데이트 : 모든 기획부 직원의 급여 10% 인상. 홍길동(2610000) 이영숙(1960000)
update tblinsa set
    basicpay = basicpay * 1.1
        where buseo = '기획부';

-- 모든행 업데이트
update tblinsa set
    basicpay = basicpay * 1.1;
    --basicpay *= 1.1; --SQL은 복합 대입 연산자가 없다.


--홍길동의 주소 : 서울 > 부산
select * from tblinsa;

update tblinsa set
    city = '부산';
    
update 고객테이블 set
    주소지 = '불광동';

-- 해당 데이터 기한없는 유일한 식별자 : PK
select * from tblinsa;
update tblinsa set
    num = 1100
        where num = 1001;

-- ** 수정할 땐 테이블의 컬럼 제약사항에 어긋나지 않는 값으로만 수정 가능하다.




/*
delete 문
- DML(insert, update, delete)
- (행) 데이터를 삭제하는 명령어
- 일부 컬럼값만 삭제 불가능 > update(null)
- delete [from] 테이블명 [where 절]
*/

commit;
rollback;

select * from tblinsa;

delete from tblinsa where city = '서울';
delete from tblinsa where city <> '경기';

delete from tblinsa where num = 1002;

delete from tblinsa;















