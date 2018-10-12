-- ex23_모델링_정규화.sql
/*

데이터베이스 작업

1. 데이터베이스 설계
    a. 데이터베이스 모델링
        - 가장 초반 작업
        - 데이터베이스 구성 요소 인식 + 정의 > 테이블 도식화 > 최종 산출물 > ERD
        - ERD 만드는 과정(ERD, Entity(테이블) Relationship Diagram)
    b. 데이터베이스 설계
        - ERD를 가지고 구체적 방안(자료형 지정, 실제 컬럼명)

--------------------------------------- DBMS 결정되기 전(현실 : 미리 정함)    
    
2. 데이터베이스 구현
    a. DB Object 구현
        - ERD를 오라클 적용하는 단계
        


데이터베이스 모델링

1. ERD
- 엔티티 관계 다이어그램
- 모델링 대표적인 방식
- eXERD, er-win, 손, 오피스 등..

2. Entity, 엔티티
- 다른 Entity와 분류(구분)될 수 있고, 다른 Entity에 대해서 정해진 관계를 맺을 수 있는 단위
- 자바 : 객체와 유사
- ex) 회사 정보 관리 프로그램
        a. 사원 정보 관리
            - 사원명, 나이, 사원번호, 연락처, 주소 등...
            - 위의 정보 > 집합 > 엔티티
            - 다른 정보와 구분이 가능한 데이터의 최소 집합
        b. 부서 정보 관리
            - 부서명, 부서번호, 호실, 내선번호 등...
            - 위의 정보 > 엔티티

3. Entity Relationship
    - 엔티티간의 관계
    - 테이블과 테이블간의 관계(PK - FK)

4. Attribute, 속성
    - 엔티티가 가지는 세부 요소
    - 사원 엔티티 = 여러개의 데이터 집합(이름, 나이 등..) > 각각의 데이터 > 속성(Attribute)
    - 테이블의 컬럼

5. Tuple, 튜플
    - 엔티티에 정의된 규칙(속성)을 가지고 만들어진 실제 데이터
    - 행, 레코드 -> 실제 객체


ERD에서 Entity, Attribute, Relationship 등을 표현하는 방법

1. Entity
- 사각형으로 표시
- 이름은 사각형위에 표시
- 대문자 표기
- 중복 불가능
- 보통 단수로 표기(x..)

2. Attribute
- Entity 내에 표기
- 단수로 표기
- 목록 형태로 표기
- 추가 표시 사항(속성에 대한 제약)
    a. NN, Not Null
        - 이 속성은 비워두면 안된다.
        - 필수 입력 속성        
    b. ND, Not Duplicate
        - 이 속성은 중복되면 안된다.
        - 같은 값을 가지는 또 다른 객체가 있으면 안된다.
        - Unique
- 실제 그릴 때
    a. 중복되면 안되고, 생략되고 안된다.(NN, ND)
        - #*속성명
    b. 생략하면 안된다.(NN)
        - *속성명
    c. 생략해도 되지만 중복되면 안된다.(ND)
        - #속성명
    d. 생략해도 되고 중복되도 된다.
        - 속성명
        - o속성명(Optional)


3. Relationship (***)
- 엔티티와 엔티티의 관계
- 행과 행의 관계(레코드와 레코드의 관계)
- 객체와 객체의 관계
- 테이블와 테이블의 관계(XXXXXXXXXXXXXXXXX)
    a. 1 : 1 관계
    b. 1 : 0 관계
    c. 1 : N 관계
    




속성 > 컬럼 > 키(Key)
- 역할(의미)이 부여된 속성이나 컬럼

1. 슈퍼키
- 레코드(행)을 구분할 수 있는 역할
- 식별자 역할을 할 수 있는 속성
- 복합키(Composite Key)

2. 후보키
- 슈퍼키들 중에서 최소성을 갖춘 키

3. 기본키
- 후보키들 중에서 정식으로 테이블의 식별자로 선택된 키

4. 대체키
- 기본키에서 탈락된 나머지 후보키

5. 외래키
- 부모 테이블을 참조하는 키

6. 일반키
- 위의 1~5 중 어디에도 속하지 않는 키
- 평범한 데이터



--------------------------------

정규화, Normalization

- 자료의 손실이나 불필요한 정보를 없애고, 데이터의 일관성을 유지하고, 데이터 중복을 최소화하기 위해
  자료 구조(테이블 스키마)를 변경하는 작업
- 우리가 만든 테이블(비정형) -> 정규형의 테이블로 수정하는 작업
- 제 1 정규화, 제 2 정규화, 제 3 정규화...
- 제 1 정규화 ~ 제 3 정규화 + 역정규화


관계형 데이터베이스 시스템이 지향하는 데이터베이스의 상태
1. 최대한 null을 가지지 않는다.
2. 중복값을 가지지 않는다.(완전히 동일한 데이터가 2군데 이상 존재하지 않는다.)


정규화를 하는 목적
1. null + 중복값을 제거
2. 자료 삽입, 갱신, 삭제에 따른 이상 현상 제거

이상 현상(Anomaly)
- 테이블 설계가 잘못되면 발생 > 현상을 발생 안하도록 테이블을 다시 설계 > 정규화

1. 삽입 이상(Insertion Anomaly)
- 특정 테이블 데이터 삽입할 때 원하지 않는 데이터까지도 같이 넣어야 하는 상황

2. 삭제 이상(Deletion Anomaly)
- 특정 테이블 데이터 삭제할 때 원하지 않는 데이터까지 같이 삭제되는 상황

3. 갱신 이상(Update Anomaly)
- 동일한 데이터가 2개 이상의 테이블에 동시에 존재 > 그 중 1개의 데이터를 수정했지만 다른 테이블 수정하지 못했을 경우
 > 두 데이터의 상태가 서로 달라지는 상황
 
 
 함수 종속(Functional Dependency)
 - 테이블내에서 2개 이상의 속성끼리의 관계 제약
 - 정규화는 '부분 함수 종속'이나 '이행 함수 종속'을 모두 없애고, 모든 컬럼을 '완전 함수 종속'으로 만드는 작업이다.
 
 1. 완전 함수 종속, Full Functional Dependency
 2. 부분 함수 종속, Partial Functional Dependency
 3. 이행 함수 종속, Transitive Functional Dependency
 
 
 정규화 종류
 - 1NF ~ 3NF(Normal Form)
 - 비정규형 -> (정규화) -> 정규형

정규화 결과
- 1개 테이블 -> 2개 이상의 테이블


제 1 정규화, 1NF
- 제 1 정규화를 만족하는 정규형의 규칙
- 모든 컬럼(속성)은 원자값을 가진다.
- 여러개의 값들을 하나의 컬럼에 넣으면 안된다.
- 1개의 셀 안에 2개 이상의 복합 데이터가 보이면..
    -> 새롭게 컬럼을 나눠서 단일값 컬럼으로 분리한다.(1개 컬럼 = 1개 데이터 ************)
    **** 가로로 컬럼을 늘리면 -> null 발생
    **** 세로로 행을 늘리면 -> 중복값 발생
    -> 테이블 분리한다.(*** 정답)
- 분리되어 떨어져 나가는 테이블은 기본키를 정할 수 상태가 된다.


제 2 정규화, 2NF
- 키가 아닌 모든 컬럼은 키 전체에 완전 함수 종속이어야 한다.
- 부분 함수 종속을 발견해서 제거한다.(*****)
- 복합키를 가지는 테이블에서 발생한다.(PK가 1개인 테이블에서는 발생 안함)


제 3 정규화, 3NF
- 기본키가 아닌 컬럼에 의존하는 컬럼이 존재하면 안된다.
- 이행 함수 종속을 반결해서 제거한다.(*****)
- A -> B -> C (****)


제 1 정규화
- 하나의 컬럼에 2개 이상의 값이 있으면 안된다.

제 2 정규화
- 복합키 존재 시 복합키 중 일부 컬럼에만 종속적인 컬럼이 있으면 안된다.
- 부분 함수 종속 제거

제 3 정규화
- 기본키가 아닌 다른 키에 종속적인 컬럼이 있으면 안된다.
- 이행 함수 종속 제거

역정규화
- 정규화된 결과를 다시 원래대로 바꾸는 작업
- 2개 이상 테이블 -> 1개의 테이블로 되돌리는 작업


N : N 관계가 발견되는 경우
- 무조건 없앤다.
- 1 : N N : 1 형태로 바꾼다.


--------------------

모델링 툴 기능

1. ERD 작성 > 실제 구현
: 순공학, 포워드 엔지니어링
: X

2. 실제 구현 > ERD 작성
: 역공학, 리버스 엔지니어링
: O









        


*/





select last_name, (select department_name from departments where department_id = s.department_id ) 
from employees s
where (salary, department_id) in (select min(salary), d.department_id from employees e 
    inner join departments d 
        on e.department_id = d.department_id
            group by d.department_id);
        
        
        
        
        
        
        
        
        
        
        
        


