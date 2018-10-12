package com.test.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex05_Statement {
	
	public static void main(String[] args) {
		
		//select의 결과셋
		// - 전진 커서
		// - 커서 사용하는 환경의 공통점 > 자기가 읽게될 집합의 요소 갯수를 미리 알 수 없다.
		//1. 단일 레코드
		//		- if (rs.next()) {} > rs.getXXX("컬럼명")
		//2. 다중 레코드
		//		- while (rs.next()) {} > rs.getXXX("컬럼명")
		
		
		//Ex05_Statement.java
		//m1();
		//m2();
		//m3();
		//m4();
		//m5();
		m6();
		
	}
	
	private static void m6() {
		
		//주업무 : 영업부 직원 명단 출력
		//부업무 : select 작업 중 가져온 결과셋의 레코드 갯수를 알아야 하는 경우
		
		//1. 총 직원수 : 7명
		//2. 직원 명단
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			
			String sql = "select count(*) as cnt from tblInsa where buseo = '영업부'";
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				System.out.println("총 사원 수 : " + rs.getString("cnt"));
			}
			
			rs.close();
			
			
			sql = "select name, jikwi from tblInsa where buseo = '영업부'";
			rs = stat.executeQuery(sql);
			
			int count = 0;
			
			while (rs.next()) {
				System.out.printf("%s\t%s\n", rs.getString("name"), rs.getString("jikwi"));
				count++;
			}
			
			System.out.println(count);
			
			rs.close();
			stat.close();
			conn.close();		
			
		} catch (Exception e) {
			System.out.println("Ex05_Statement.m6() : " + e.toString());
		}

		
	}
	
	
	private static void m5() {
		
		//다중행 + 다중컬럼
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			
			//SQL 결과셋에 중복 컬럼이 발생하면 반드시 별칭으로 유일하게 만들 것!!!!
			String sql = "select m.name as mname, w.name as wname, m.age - w.age as age from tblMen m inner join tblWomen w on m.name = w.couple";
			
			rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				
				String mname = rs.getString("mname");
				String wname = rs.getString("wname");
				String age = rs.getString("age");
				
				System.out.println(mname);
				System.out.println(wname);
				System.out.println(age);
				
			} //while 
			
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("Ex05_Statement.m3() : " + e.toString());
		}

		
		
	}
	
	
	private static void m4() {
		
		//단일행 + 다중컬럼
		//1010번 직원 정보
		
		String num = "1010";
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			
			//SQL 결과셋에 중복 컬럼이 발생하면 반드시 별칭으로 유일하게 만들 것!!!!
			String sql = "select m.name as mname, w.name as wname, m.age - w.age as age from tblMen m inner join tblWomen w on m.name = w.couple where rownum = 1";
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				
				String mname = rs.getString("mname");
				String wname = rs.getString("wname");
				String age = rs.getString("age");
				
				rs.close();
				stat.close();
				conn.close();
				
				System.out.println(mname);
				System.out.println(wname);
				System.out.println(age);
				
			} else {
				System.out.println("사원번호 " + num + "은 존재하지 않습니다.");
			}
			
		} catch (Exception e) {
			System.out.println("Ex05_Statement.m3() : " + e.toString());
		}

		
		
	}

	private static void m3() {
		
		//단일행 + 다중컬럼
		//1010번 직원 정보
		
		String num = "1010";
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			
			String sql = "select * from tblInsa where num = " + num;
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				
				String name = rs.getString("name");
				String ssn = rs.getString("ssn");
				String buseo = rs.getString("buseo");
				String jikwi = rs.getString("jikwi");
				
				rs.close();
				stat.close();
				conn.close();
				
				System.out.println(name);
				System.out.println(ssn);
				System.out.println(buseo);
				System.out.println(jikwi);
				
			} else {
				System.out.println("사원번호 " + num + "은 존재하지 않습니다.");
			}
			
		} catch (Exception e) {
			System.out.println("Ex05_Statement.m3() : " + e.toString());
		}

		
		
	}

	private static void m2() {
		
		//단일값 반환
		//1. 대다수 : 오라클 -> (문자열, 숫자) -> 자바
		//2. 날짜/시간형 : 오라클 -> 자바
		//		a. 문자열 : 권장
		//		b. java.sql.Date : 사용 빈도 낮음
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			
			String sql = "select max(adddate) as adddate from tblTodo";
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
			
				//String result = rs.getString("adddate");
				Date result = rs.getDate("adddate");
				
				//System.out.println(result);
				System.out.printf("%tF %tT\n", result, result);
				
			}			
			
			rs.close();
			stat.close();
			conn.close();
			
			
		} catch (Exception e) {
			System.out.println("Ex05_Statement.m2() : " + e.toString());
		}

		
	}

	private static void m1() {
		
		//단일값 반환
		// : select > 1행 1열 > 단일값(숫자/문자열)		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			if (!conn.isClosed()) {
				
				stat = conn.createStatement();
				//String sql = "select count(*) as cnt from tblInsa";
				String sql = "select buseo from tblInsa where name = '이순신'";
				
				//반환값이 있는 쿼리
				rs = stat.executeQuery(sql);
				
				//ResultSet 탐색
				if (rs.next()) {
					
					//String result = rs.getString(1); //컬럼 Index(1부터 시작)
					//int result = rs.getInt(1);
					String result = rs.getString("buseo"); //컬럼명(****************)
					System.out.println(result);
					
					
					//System.out.println(rs.next()); //false
					
					//결과 집합을 모두 소모했음
					//result = rs.getString("buseo");
					//System.out.println(result);
					
					
					//자원 해제
					rs.close();
					
					//rs.next();
					
					stat.close();
					
					//stat.executeQuery(sql);
					
					conn.close();
					
					//stat.executeQuery(sql);
					
				} else {
					System.out.println("데이터 없음");
				}
				
			} else {
				System.out.println("DB 접속이 원할하지 않습니다. 관리자에게 연락..");
			}
			
		} catch (Exception e) {
			System.out.println("Ex05_Statement.m1() : " + e.toString());
		}

		
	}

}










