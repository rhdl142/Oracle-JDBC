package com.test.jdbc;

//주소록 데이터를 나르는 상자 역할
//DTO 자격 조건
//1. 멤버 변수 private 선언
//2. 멤버 변수 getter/setter 선언
//		a. setter 오버로딩 금지(인자 갯수가 2개 이상 금지)
//		b. getter 매개변수 금지
//3. 생성자, 추가 멤버, toString() 오버라이드 등은 자유

//DB 테이블의 레코드 1줄 유사
public class DTO {
	
	private String seq;
	private String name;
	private String age;
	private String tel;
	private String address;
	private String regdate;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	

}







