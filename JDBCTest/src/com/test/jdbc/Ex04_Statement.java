package com.test.jdbc;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;

public class Ex04_Statement {

	public static void main(String[] args) {
		
		//Ex04_Statement.java
		
		//사용자 입력
		
		Connection conn = null;
		Statement stat = null;
		Scanner scan = new Scanner(System.in);
		
		try {
			
			//System.out.print("이름 : ");
			//String name = scan.nextLine();
			
			
			//자바의 자료형 <-> 오라클의 자료형
			// - 호환성 0%
			
			//String sql = "insert into tblAddress (seq, name, age, tel, address, regdate) values (addressSeq.nextval, '홍길동', 20, '010-5478-9854', '서울시 강남구 역삼동', default)";
			//System.out.print("나이 : ");
			//String age = scan.nextLine();
			
			//System.out.print("전화 : ");
			//String tel = scan.nextLine();
			
			//System.out.print("주소 : ");
			//String address = scan.nextLine();
			
			
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			
			//String sql = String.format("insert into tblAddress (seq, name, age, tel, address, regdate) values (addressSeq.nextval, '%s', %s, '%s', '%s', default)", name, age, tel, address);
			//String sql = "update tblAddress set age = 22 where seq = 22";
			//String sql = "delete from tblAddress where seq = 22";
			//String sql = "create table tblJDBC (seq number primary key, data varchar2(100) not null)";
			String sql = "drop table tblJDBC";
			
			int result = stat.executeUpdate(sql);
			
			if (result > 0) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			
			
			stat.close();
			conn.close();			
			
		} catch (Exception e) {
			System.out.println("Ex04_Statement.main() : " + e.toString());
		}

		
		
		
		
	}
	
}












