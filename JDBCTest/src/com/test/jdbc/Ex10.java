package com.test.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Ex10 {

	public static void main(String[] args) {
		
		//적용 전
		//C
		//create();
		
		//R
		//- 단일 레코드
		//- 다중 레코드(***)
		//read();
		
		//D
		delete();
		
	}

	private static void delete() {
		
		//번호 입력 > 삭제
		//사용자 입력
		String seq = "42";
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "delete from tblAddress where seq = ?";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, seq);
			
			int result = stat.executeUpdate();
			
			System.out.println(result > 0 ? "성공" : "실패");

			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void read() {
		
		//주소록 목록
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "select * from tblAddress order by seq desc";
			stat = conn.prepareStatement(sql);
			
			rs = stat.executeQuery();
			
			while (rs.next()) {
				System.out.println(
								rs.getString("seq") + "-" +
								rs.getString("name") + "-" +
								rs.getString("age") + "-" +
								rs.getString("tel") + "-" +
								rs.getString("address") + "-" +
								rs.getString("regdate")
								);
			}

			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void create() {
		
		//사용자 입력
		String name = "아무개";
		String age = "25";
		String tel = "010-1234-5678";
		String address = "서울시 강남구 역삼동";
		
		Connection conn = null;
		PreparedStatement stat = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "insert into tblAddress values (addressSeq.nextval, ?, ?, ?, ?, default)";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, name);
			stat.setString(2, age);
			stat.setString(3, tel);
			stat.setString(4, address);
			
			int result = stat.executeUpdate();
			
			System.out.println(result > 0 ? "성공" : "실패");

			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
	
}







