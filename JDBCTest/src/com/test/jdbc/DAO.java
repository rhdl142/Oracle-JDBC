package com.test.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//JDBC 코드 담당 객체
public class DAO {

	//Main 클래스가 입력할 데이터 전달 > insert 위임
//	public void create(String name, String age, String tel, String address) {
//		
//	}
	
	public int create(DTO dto) {
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "insert into tblAddress values (addressSeq.nextval, ?, ?, ?, ?, default)";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getAge());
			stat.setString(3, dto.getTel());
			stat.setString(4, dto.getAddress());
			
			int result = stat.executeUpdate();

			stat.close();
			conn.close();
			
			return result;

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return 0;
		
	}//create
	
	
	//Main 클래스가 주소록을 읽어달라고 호출
	public ArrayList<DTO> read() {
		
		//주소록 목록
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "select * from tblAddress order by seq desc";
			stat = conn.prepareStatement(sql);
			
			rs = stat.executeQuery();
			
			//ResultSet이(DB 코드가) 아닌 또다른 자료형으로 변환 > 반환
			//ResultSet = 테이블 = 컬렉션
			ArrayList<DTO> list = new ArrayList<DTO>();
			
			while (rs.next()) {
				//레코드 1줄 > DTO 1개 생성 + 각 컬럼 > DTO 멤버 변수 복사
				DTO dto = new DTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getString("age"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}

			rs.close();
			stat.close();
			conn.close();
			
			return list;

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
		
	}


	public int delete(String seq) {
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {

			conn = DBUtil.getConnection();
			String sql = "delete from tblAddress where seq = ?";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, seq);
			
			int result = stat.executeUpdate();
			
			stat.close();
			conn.close();
			
			return result;

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return 0;
	}
	
	
}//DAO











