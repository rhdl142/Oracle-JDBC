package com.test.jdbc;

import java.sql.Connection;
import java.sql.Statement;

public class Ex03_Statement {

	public static void main(String[] args) {
		
		//Ex03_Statement.java
		
		/*
		
		Statement 클래스
		- SQL 구문을 실행하는 역할
		- 스스로는 SQL 구문 이해 못함(구문 해석 X) -> 오라클 전달 역할
		- SQL 관리 O + 연결 정보 X
		- JDBC의 질의는 기본이 자동 커밋
		- 문장 종결자 사용 금지(;) > 1번에 1개의 쿼리만 실행 가능
		
		
		Statement 종류
		1. Statement
			- 기본 객체
			- 텍스트 SQL 호출
			
		2. PreparedStatement
			- 1번의 기능 향상
			- 인자와 관련된 작업이 특화(매개변수)
			- 코드 안정성 높음, 가독성 높음.
			- 코드량이 증가(;;)
			- 텍스트 SQL 호출
		
		3. CallableStatement
			- 2번이 베이스
			- 프로시저 호출 전용
		
		*/
		
		//1. 접속
		Connection conn = null;
		
		try {
			
			conn = DBUtil.getConnection();
			System.out.println(conn.isClosed() ? "접속안됨." : "접속됨.");
			
			
			//2. SQL 실행
			Statement stat = conn.createStatement();
			
			//SQL -> 문자열 -> Statement 전달 -> 오라클 전달
			String sql = "insert into tblAddress (seq, name, age, tel, address, regdate) values (addressSeq.nextval, '홍길동', 20, '010-5478-9854', '서울시 강남구 역삼동', default)";
			
			//a. 반환값이 없는 쿼리용
			// - select 제외한 전용
			// - 반환값 : 해당 쿼리를 실행했을 때 적용된 행의 갯수
			int result = stat.executeUpdate(sql); //Ctrl + Enter
			System.out.println(result);
		
			
			//b. 반환값이 있는 쿼리용
			// - select 전용
			//stat.executeQuery(sql);
			
			
			//3. 접속 종료(자원 해제)
			stat.close();
			conn.close();
			
			
			
		} catch (Exception e) {
			System.out.println("Ex03_Statement.main() : " + e.toString());
		}

		
	}
	
}












