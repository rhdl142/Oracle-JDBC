package com.test.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	public static Connection getConnection() {
		
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hr";
		String pw = "java1234";
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, id, pw);
			
			return conn;
			
		} catch (Exception e) {
			System.out.println("DBUtil.getConnection() : " + e.toString());
		}

		
		return null;
		
	}
	
	
	public static Connection getConnection(String server, String id, String pw) {
		
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@" + server + ":1521:xe";
				
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, id, pw);
			
			return conn;
			
		} catch (Exception e) {
			System.out.println("DBUtil.getConnection() : " + e.toString());
		}

		
		return null;
		
	}
	
}












