package com.test.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Ex09_Transaction {
	
	public static void main(String[] args) {
		
		//Ex09_Transaction.java
		
		//트랜잭션 처리
		//1. 오라클
		//		a. 스크립트 작업 중 사용자가 직접 commit / rollback
		//		b. 프로시저내에서 여러 작업을 하나의 논리 작업으로 묶기 위해서
		//2. 자바
		//		a. 오라클과 동일하게 트랜잭션 제어 가능 > Connection 클래스 사용
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			//Statement를 생성하기 전에 트랜잭션 적용
			conn.setAutoCommit(false); //자동 커밋 끄기
			
			stat = conn.createStatement();
			
			//이순신 : city > 경기 -> 서울 -> 대전
			String sql = "update tblInsa set city = '대전' where name = '이순신'"; //DML
			stat.executeUpdate(sql);
			
			//이순애 : city > 인천 -> 부산
			sql = "update tblInsa set city = '부산부산부산부산부산부산부산부산' where name = '이순애'"; //DML
			stat.executeUpdate(sql);
			
			stat.close();
			
			
			//commit;
			conn.commit();
			
			conn.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			
			//rollback;
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
		}
		
	}

}

































