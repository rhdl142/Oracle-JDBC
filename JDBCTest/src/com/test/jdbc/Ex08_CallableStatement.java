package com.test.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Random;
import java.util.Scanner;

import oracle.jdbc.OracleTypes;

public class Ex08_CallableStatement {
	
	public static void main(String[] args) {
		
		//Ex08_CallableStatement.java
		
		//1. Statement : 정적 쿼리 사용
		//2. PreparedStatment : 동적 쿼리 사용(매개변수 사용)
		//3. CallableStatment : 프로시저 사용
		
		//m1();
		//m2();
		//m3();
		//m3_1();
		//m4();
		//m5();
		//m6();
		//m7();
		//m8();
		//m9();
		//m10();
		//m11();
		m12();
	}

	private static void m12() {
		
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call proc_list_electronics(?) }";
			stat = conn.prepareCall(sql);
			
			stat.registerOutParameter(1, OracleTypes.CURSOR);
			stat.executeQuery();
			
			rs = (ResultSet)stat.getObject(1);
			
			while (rs.next()) {
				System.out.println("[" + rs.getString("name") +"]");
				
				//두번째 프로시저 호출(proc_check)
				sql = "{ call proc_check(?, ?) }";
				stat = conn.prepareCall(sql);
				
				stat.setString(1, rs.getString("seq")); //루프 - n번째 가전제품 번호(seq)
				stat.registerOutParameter(2, OracleTypes.DOUBLE);
				stat.executeQuery();
				
				System.out.printf("총 소비시간 : %,.1f\n", stat.getDouble(2));
				double hour = stat.getDouble(2);
				
				
				//세번째 프로시저 호출(proc_get_total_capacity)
				sql = "{ call proc_get_total_capacity(?, ?) }";
				stat = conn.prepareCall(sql);
				
				stat.setString(1, rs.getString("seq")); //루프 - n번째 가전제품 번호(seq)
				stat.registerOutParameter(2, OracleTypes.NUMBER);
				stat.executeQuery();
				
				System.out.printf("총 배터리용량 : %,d\n", stat.getInt(2));
				int capacity = stat.getInt(2);
				
				//시간당 소비용량
				System.out.printf("시간당 소비용량 : %,d\n", rs.getInt("consumption"));
				
				//현재 상태
				double remain = capacity - (hour * rs.getInt("consumption"));
				System.out.printf("현재 남은 용량 : %,.1f\n", remain);
				
				//결론
				if (remain > 0) {
					//배터리가 남아있음.
					System.out.printf("남은 사용 시간 : %.1f\n", remain / rs.getInt("consumption"));
				} else {
					//배터리 없음
					System.out.println("배터리 0%");
				}
				System.out.println();
			}

			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m11() {
		
//		while (rs.next()) { //부서명
//			while (srs.next()) { //직원
//				이름 출력
//			}			
//		}
		
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procBuseo(?) }";
			stat = conn.prepareCall(sql);
			
			stat.registerOutParameter(1, OracleTypes.CURSOR);
			stat.executeQuery();
			
			rs = (ResultSet)stat.getObject(1);
			
			sql = "{call procJikwon(?, ?)";
			stat = conn.prepareCall(sql);
			
			while (rs.next()) {
				System.out.println("[" + rs.getString("buseo") + "]");
				
				//부서별 직원 명단 가져오기
				stat.setString(1, rs.getString("buseo"));
				stat.registerOutParameter(2, OracleTypes.CURSOR);
				
				stat.executeQuery();
				
				ResultSet srs = (ResultSet)stat.getObject(2);
				
				while (srs.next()) {
					System.out.print(srs.getString("name") + " > ");
				}
				System.out.println("(종료)");
				
			}

			
			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}

	private static void m10() {
		
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procM10(?) }";
			stat = conn.prepareCall(sql);
			
			stat.registerOutParameter(1, OracleTypes.CURSOR);
			stat.executeQuery();
			
			rs = (ResultSet)stat.getObject(1);
			
			while (rs.next()) {
				System.out.printf("%s ▷ %s : %skm\n"
												, rs.getString("p1")
												, rs.getString("p2")
												, rs.getString("distance"));
			}
			
			
			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m9() {
		
		String[] names = { "홍길동", "아무개", "하하하", "테스트", "호호호", "후후후" };
		String[] items = { "키보드", "모니터", "마우스", "태블릿", "프린터" };
		
		Random rnd = new Random();
		Scanner scan = new Scanner(System.in);
		
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			
			String sql = "";
			
			//구매 내역 추가하기
			for (int i=0; i<100; i++) {
				sql = "{ call procAddBuy(?, ?, ?) }";
				stat = conn.prepareCall(sql);
				
				//set x 3개
				//이름 : names[rnd.nextInt(names.length)]
				//아이템 : items[rnd.nextInt(items.length)]
				//수량 : rnd.nextInt(10) + 1
				
				stat.setString(1, names[rnd.nextInt(names.length)]);
				stat.setString(2, items[rnd.nextInt(items.length)]);
				stat.setInt(3, rnd.nextInt(10) + 1);
				
				stat.executeUpdate();
			}
			
			stat.close();
			
			//구매 내역 가져오기
			System.out.print("최소 수량 : ");
			String qty = scan.nextLine();
			
			sql = "{ call procListBuy(?, ?) }";
			stat = conn.prepareCall(sql);
			
			//1개 in 매개변수, 1개 out 매개변수(커서)
			stat.setString(1, qty);
			stat.registerOutParameter(2, OracleTypes.CURSOR);
			
			stat.executeQuery();
			
			//커서 > ResultSet > loop > 출력
			rs = (ResultSet)stat.getObject(2);
			
			while (rs.next()) {
				System.out.printf("%s - %s - %s\n"
												, rs.getString("name")
												, rs.getString("item")
												, rs.getString("qty"));	
			}
			
			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m8() {
		
		Scanner scan = new Scanner(System.in);
		
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procM8(?, ?) }";
			stat = conn.prepareCall(sql);
			
			System.out.print("사원 번호 입력 : ");
			stat.setString(1, scan.nextLine());
			
			stat.registerOutParameter(2, OracleTypes.CURSOR);
			
			stat.executeQuery();
			
			rs = (ResultSet)stat.getObject(2);
			
			while (rs.next()) {
				//System.out.println(rs.getString("name"));
				
				String margin = "";
				for (int i=1; i<rs.getInt("level"); i++) {
					margin += "   ";
				}
				
				if (rs.getInt("level") > 1) {
					margin += "▷ ";
				}
				
				System.out.printf("%s%s, %s, %s\n"
												, margin
												, rs.getString("name")
												, rs.getString("email")
												, rs.getString("phone"));
			}

			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m7() {
		
		Scanner scan = new Scanner(System.in);
		
		//대분류 입력
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procBigCategory(?) }";
			stat = conn.prepareCall(sql);
			
			stat.registerOutParameter(1, OracleTypes.CURSOR);
			stat.executeQuery();
			
			rs = (ResultSet)stat.getObject(1);
			
			while (rs.next()) {
				System.out.printf("%s. %s\n"
												, rs.getString("seq")
												, rs.getString("name"));
			}
			
			rs.close();
			stat.close();
			
			
			
			System.out.print("선택 : ");
			String input = scan.nextLine();
			
			
			sql = "{ call procMiddleCategory(?, ?) }";
			stat = conn.prepareCall(sql);
			
			stat.setString(1, input);
			stat.registerOutParameter(2, OracleTypes.CURSOR);
			
			stat.executeQuery();
			
			rs = (ResultSet)stat.getObject(2);
			
			while (rs.next()) {
				System.out.printf("%s. %s\n"
												, rs.getString("seq")
												, rs.getString("name"));
			}
			
			rs.close();
			stat.close();
			
			
			//소분류 출력
			System.out.print("선택 : ");
			input = scan.nextLine();
			
			
			sql = "{ call procSmallCategory(?, ?) }";
			stat = conn.prepareCall(sql);
			
			stat.setString(1, input);
			stat.registerOutParameter(2, OracleTypes.CURSOR);
			
			stat.executeQuery();
			
			rs = (ResultSet)stat.getObject(2);
			
			while (rs.next()) {
				System.out.printf("%s. %s\n"
												, rs.getString("seq")
												, rs.getString("name"));
			}
			
			rs.close();
			stat.close();
			
			
			//상품 목록
			System.out.print("선택 : ");
			input = scan.nextLine();
			
			
			sql = "{ call procProduct(?, ?) }";
			stat = conn.prepareCall(sql);
			
			stat.setString(1, input);
			stat.registerOutParameter(2, OracleTypes.CURSOR);
			
			stat.executeQuery();
			
			rs = (ResultSet)stat.getObject(2);
			
			while (rs.next()) {
				System.out.printf("%s. %s(%s개)\n"
												, rs.getString("seq")
												, rs.getString("name")
												, rs.getString("qty"));
			}
			
			rs.close();
			stat.close();
			
			

			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}

	private static void m6() {
		
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procM6(?, ?) }";
			stat = conn.prepareCall(sql);
			
			stat.setString(1, "lee");
			stat.registerOutParameter(2, OracleTypes.NUMBER);
			
			stat.executeQuery();
			
			if (stat.getInt(2) == 0) {
				System.out.println("사용가능한 아이디입니다.");
			} else {
				System.out.println("이미 사용중인 아이디입니다.");
			}

			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m5() {
		
		//5. 커서 반환
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procM5(?, ?, ?, ?) }";
			stat = conn.prepareCall(sql);
			
			stat.setString(1, "부산");
			stat.setString(2, "학생");
			stat.registerOutParameter(3, OracleTypes.CURSOR);
			stat.registerOutParameter(4, OracleTypes.NUMBER);
			
			stat.executeQuery(); //in x 2, out x 2
			
			System.out.println("결과 인원 수 : " + stat.getString(4));
			
			rs = (ResultSet)stat.getObject(3);
			
			while (rs.next()) {
				System.out.println(rs.getString("name") + " - " + rs.getString("job") + " - " + rs.getString("address"));
			}
			
			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m4() {
		
		//4. 커서 반환
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procM4(?, ?) }";
			stat = conn.prepareCall(sql);
			
			stat.setString(1, "서울"); //in
			stat.registerOutParameter(2, OracleTypes.CURSOR);
			
			//rs = stat.executeQuery();
			//System.out.println(rs.next());
			
			stat.executeQuery();
			
			rs = (ResultSet)stat.getObject(2);
			//rs = stat.getResultSet();
			
			while (rs.next()) {
				System.out.println(rs.getString("name") + " - " + rs.getString("buseo" )
												+ " - " + rs.getString("jikwi") + " - " + rs.getString("city"));
			}
			
			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m3_1() {
		
		//3. 반환값 O
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procM3_1(?, ?, ?) }";
			stat = conn.prepareCall(sql);
			
			stat.registerOutParameter(1, OracleTypes.VARCHAR);
			stat.registerOutParameter(2, OracleTypes.NUMBER);
			stat.registerOutParameter(3, OracleTypes.VARCHAR);
			
			stat.executeQuery();//3개의 out 변수가 채워짐
			
			System.out.println(stat.getString(1));
			System.out.println(stat.getString(2));
			System.out.println(stat.getString(3));
			
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m3() {
		
		//3. 반환값 O
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procM3(?) }";
			stat = conn.prepareCall(sql);
			
			//out 매개변수 등록
			stat.registerOutParameter(1, OracleTypes.NUMBER);//PL/SQL out 변수 생성
			
			//실행
			stat.executeQuery();//out 변수 채우기
			
			System.out.println(stat.getString(1));

			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m2() {
		
		//2. 매개변수 O
		String name = "테스트";
		String memo = "프로시저 테스트 중..";
		String priority = "1";
		
		Connection conn = null;
		CallableStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "{ call procM2(?, ?, ?) }";
			stat = conn.prepareCall(sql);
			
			stat.setString(1, name);
			stat.setString(2, memo);
			stat.setString(3, priority);
			
			System.out.println(stat.executeUpdate());

			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	private static void m1() {
		
		//1. 반환값 X, 매개변수 X
		
		Connection conn = null;
		CallableStatement stat = null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			String sql = "{ call procM1 }";
			
			stat = conn.prepareCall(sql);
			
			System.out.println(stat.executeUpdate());
			
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("Ex08_CallableStatement.m1() : " + e.toString());
		}

		
	}

}










