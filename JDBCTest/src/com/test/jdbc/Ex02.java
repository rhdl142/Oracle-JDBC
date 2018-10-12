package com.test.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

public class Ex02 {

	public static void main(String[] args) {
		
		//Ex02.java
		Connection conn = null;
		
		conn = DBUtil.getConnection();
		
		try {
			
			System.out.println(conn.isClosed());
			
			conn.close();
			
			conn = DBUtil.getConnection("211.63.89.35", "hr", "java1234");
			
			System.out.println(conn.isClosed());
			
			conn.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
}





