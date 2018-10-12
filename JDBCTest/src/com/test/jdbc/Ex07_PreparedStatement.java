package com.test.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex07_PreparedStatement {
	
	public static void main(String[] args) {
		
		//Ex07_PreparedStatement.java
		
		//m1();
		//m2();
		//m3();
		//m4();
		//m5();
		//m6();
		//m7();
		m8();
		
	}
	
	private static void m8() {
		
		
		
	}
	
	private static void m7() {
		
		//다중 루프 쿼리
		// - 부모 & 자식 테이블의 내용을 동시에 출력하는 경우
		
		//주요 정보 출력(유저 명단)
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "select * from tblUser order by id asc";
			stat = conn.prepareStatement(sql);
			
			System.out.println("==== 유저 목록 ====");
			
			rs = stat.executeQuery();
			
			while (rs.next()) {
				System.out.printf("%s\t%s\t%s\n"
											, rs.getString("id")
											, rs.getString("name")
											, rs.getString("grade"));
				
				//현재 유저의 부가 정보를 select 처리
				sql = "select * from tblDesc where id = ?";
				stat = conn.prepareStatement(sql);
				
				stat.setString(1, rs.getString("id"));
				
				ResultSet drs = stat.executeQuery();
				
				while (drs.next()) {
					System.out.printf("\t > %s(%s)\n"
													, drs.getString("name")
													, drs.getString("content"));
				}
				
				drs.close();
				stat.close();
				
			}//while
			
			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m6() {
		
		String tableName = "zipcode";
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "select count(*) as cnt from ?";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, tableName);
			
			rs = stat.executeQuery();
			
			if (rs.next()) {
				System.out.println("행의 갯수 : " + rs.getString("cnt"));
			}

			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m5() {
		
		//식별자(컬럼, 테이블, 뷰)를 매개변수로 하는 업무
		//사용자 입력(테이블명) : tblAddressBook
		//결과 : 행의 갯수 출력
		
		//select count(*) from tblAddressBook;
		
		String tableName = "zipcode";
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			
			String sql = String.format("select count(*) as cnt  from %s", tableName);
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				System.out.println("행의 갯수 : " + rs.getString("cnt"));
			}
			
			
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}

	private static void m4() {
		
		//주소 검색
		//tblAddressBook
		String address = "서울";
		String job = "학생";
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "select * from tblAddressBook"
								+ " where job = ? and address like '%' || ? || '%'";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, job);
			stat.setString(2, address);
			
			rs = stat.executeQuery();
			
			while (rs.next()) {
				System.out.printf("%s - %d - %s - %s\n"
												, rs.getString("name")
												, rs.getInt("age") - 1
												, rs.getString("job")
												, rs.getString("address"));
			}

			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		
	}

	private static void m3() {
		
		//정적 쿼리(매개변수가 없거나.. 쿼리 구문이 변화가 없는 쿼리)
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "delete from tblMemo";
			stat = conn.prepareStatement(sql);
			
			System.out.println(stat.executeUpdate());
			
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m2() {
		
		//메모 삭제
		String seq = "23";
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "delete from tblMemo where seq = ?";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, seq);
			
			System.out.println(stat.executeUpdate());

			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}



	private static void m1() {
		//insert into tblMemo values (memoSeq.nextval, '하하하', '메모 테스트입니다. 홍길동''s 메모장', default, 1)
		
		//Statement
		//PreparedStatement
		
		Connection conn = null;
		Statement stat = null;
		PreparedStatement pstat = null;
		
		//사용자 입력
		String name = "홍길동";
		//name = name.replace("'", "''");
		String memo = "메모 테스트입니다. 홍길동's 메모장";
		//memo = memo.replace("'", "''");
		String priority = "1";
		
		try {
			
			//접속
			conn = DBUtil.getConnection();
			
			//Statement 사용
			String sql = String.format("insert into tblMemo values (memoSeq.nextval, '%s', '%s', default, %s)", name, memo, priority);
			
			stat = conn.createStatement();
			
//			if (stat.executeUpdate(sql) > 0) {
//				System.out.println("메모 작성");
//			} else {
//				System.out.println("실패");
//			}
			
			stat.close();
			
			
			//PreparedStatement
			//SQL 내부의 '?' 는 매개변수
			sql = "insert into tblMemo values (memoSeq.nextval, ?, ?, default, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			//매개변수 값 대입 + 매개변수 유효화 처리
			pstat.setString(1, name);
			pstat.setString(2, memo);
			pstat.setString(3, priority);
						
			if (pstat.executeUpdate() > 0) {//Ctrl + Enter
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			
			pstat.close();
			
			conn.close();
			
		} catch (Exception e) {
			System.out.println("Ex07_PreparedStatement.main() : " + e.toString());
		}
	}

}




















