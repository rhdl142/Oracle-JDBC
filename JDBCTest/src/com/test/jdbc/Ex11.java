package com.test.jdbc;

import java.util.ArrayList;

public class Ex11 {

	public static void main(String[] args) {
		
		//적용 후
		// - MVC 패턴
		// - Model : 데이터 처리와 관계된 업무를 담당하는 계층
		
		//데이터베이스 작업 전문 객체(클래스)
		//- DAO, Data Access Object
		//		: 데이터 처리 업무 담당 객체
		//		: JDBC 관련 업무 담당 객체
		
		//- DTO, Data Transfer Object
		//		: 계층과 계층간에 데이터 전달 단위 객체
		//		: A 업무 -> DTO(데이터) -> B 업무
		// 	: 데이터를 담는 상자
		//		: 데이터를 상자에 담은 후에도 수정이 가능
		
		//- VO, Value Object
		//		: 계층과 계층간에 데이터 전달 단위 객체
		//		: A 업무 -> DTO(데이터) -> B 업무
		// 	: 데이터를 담는 상자
		//		: 데이터를 상자에 담은 후에도 수정이 불가능
		
		//create();
		//read();
		delete();
		
	}

	private static void delete() {
		
		//사용자 입력
		String seq = "43";
		
		//DB 작업 위임
		DAO dao = new DAO();
		
		int result = dao.delete(seq);
		
		System.out.println(result > 0 ? "성공" : "실패");
		
		
	}

	private static void read() {
		
		//DB 작업 위임
		DAO dao = new DAO();
		
//		ResultSet rs = dao.read();
//		
//		while (rs.next()) {
//			출력
//		}
		
		ArrayList<DTO> list =  dao.read();
		
		for (DTO dto : list) {
			System.out.println(
						dto.getSeq() + "-" +
						dto.getName() + "-" +
						dto.getAge() + "-" +
						dto.getTel() + "-" +
						dto.getAddress() + "-" +
						dto.getRegdate()
					);			
		}
		
	}

	private static void create() {
		
		//사용자 입력
		String name = "아무개";
		String age = "25";
		String tel = "010-1234-5678";
		String address = "서울시 강남구 역삼동";
		
		//DB 작업 > 담당자 위임 > DAO
		DAO dao = new DAO();
		//dao.create(10, 20, c, d);
		
		//상자
		DTO dto = new DTO();
		
		dto.setName(name);
		dto.setAge(age);
		dto.setTel(tel);
		dto.setAddress(address);
		
		int result = dao.create(dto);
		
		System.out.println(result > 0 ? "성공" : "실패");
		
		
		
		
	}
	
}










