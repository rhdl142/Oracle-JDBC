package com.test.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Ex06_Memo {
	
	private static Scanner scan;
	private static Connection conn;
	private static Statement stat;
	
	static {
		scan = new Scanner(System.in);
		conn = DBUtil.getConnection();
		try {
			stat = conn.createStatement();
		} catch (Exception e) {
			System.out.println("Ex06_Memo.enclosing_method() : " + e.toString());
		}

	}

	public static void main(String[] args) {
		
		//메모장
		boolean loop = true;
		
		while (loop) {
			System.out.println("=============");
			System.out.println("메모장");
			System.out.println("=============");
			System.out.println("1. 메모 쓰기");
			System.out.println("2. 메모 읽기");
			System.out.println("3. 메모 삭제");
			System.out.println("4. 메모 검색");
			System.out.println("5. 종료");
			
			System.out.print("선택 : ");
			String input = scan.nextLine();
			
			if (input.equals("1")) add();
			else if (input.equals("2")) list();
			else if (input.equals("3")) del();
			else if (input.equals("4")) search();
			else loop = false;
						
		}//while
		
		System.out.println("메모장 종료");
		
		try {			
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("Ex06_Memo.main() : " + e.toString());
		}

		
	}//main

	private static void add() {
		
		//메모 쓰기
		System.out.println("[메모 추가]");
		
		System.out.print("이름 : ");
		String name = scan.nextLine();
		
		System.out.print("메모 : ");
		String memo = scan.nextLine();
		
		System.out.print("우선순위(1. 높음, 2. 중간, 3. 낮음) : ");
		String priority = scan.nextLine();
		
		String sql = String.format("insert into tblMemo values (memoSeq.nextval, '%s', '%s', default, %s)", name, memo, priority);
		
		try {
			
			if (stat.executeUpdate(sql) > 0) {
				System.out.println("메모 추가 완료");
			} else {
				System.out.println("메모 추가 실패");
			}
			
		} catch (Exception e) {
			System.out.println("Ex06_Memo.add() : " + e.toString());
		}	
		
		scan.nextLine(); //pause() 역할
		
	}

	private static void list() {
		
		//메모 읽기
		System.out.println("[메모 읽기]");
		
		String sql = "select  " + 
							"    seq, name, memo," + 
							"    to_char(regdate, 'hh24:mi:ss') as regdate," + 
							"    case" + 
							"        when priority = 1 then '높음'" + 
							"        when priority = 2 then '중간'" + 
							"        when priority = 3 then '낮음'" + 
							"    end as priority " + 
							"from tblMemo " + 
							"    order by seq desc";
		
		try {
			
			ResultSet rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				System.out.printf("%s\t %s\t %s\t %s\t %s\n"
												, rs.getString("seq")
												, rs.getString("name")
												, rs.getString("regdate")
												, rs.getString("priority")
												, rs.getString("memo"));
			}//while
			
			rs.close();
			
		} catch (Exception e) {
			System.out.println("Ex06_Memo.list() : " + e.toString());
		}
		
		scan.nextLine();
	}

	private static void del() {
		
		//메모 삭제
		System.out.println("[메모 삭제]");
		
		System.out.print("삭제할 메모 번호 : ");
		String seq = scan.nextLine();
		
		try {
			
			String sql = "delete from tblMemo where seq = " + seq;
			
			if (stat.executeUpdate(sql) > 0) {
				System.out.println("메모 삭제 완료");
			} else {
				System.out.println("메모 삭제 실패");
			}
			
		} catch (Exception e) {
			System.out.println("Ex06_Memo.del() : " + e.toString());
		}

		scan.nextLine();
		
	}

	private static void search() {
		
		//메모 검색
		System.out.println("[메모 검색]");
		
		//1. 작성자(동등 비교) > =
		//2. 메모내용(일부 비교) > like
		
		//System.out.print("검색어(이름) : ");
		//String name = scan.nextLine();
		
		System.out.print("검색어(메모내용) : ");
		String word = scan.nextLine();
		
		try {
			
			//String sql = String.format("select * from tblMemo where name = '%s'", name);
					
			String sql = String.format("select * from tblMemo"
														+ " where memo like '%%%s%%' ", word);
			ResultSet rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				System.out.printf("%s\t %s\t %s\t %s\t %s\n"
						, rs.getString("seq")
						, rs.getString("name")
						, rs.getString("regdate")
						, rs.getString("priority")
						, rs.getString("memo"));
			}//while
			
			rs.close();
			
		} catch (Exception e) {
			System.out.println("Ex06_Memo.search() : " + e.toString());
		}

		scan.nextLine();
	}
	
}










