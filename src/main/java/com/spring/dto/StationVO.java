package com.spring.dto;

import java.util.Date;

// station 테이블과 child 테이블에서 가져온 데이터
public class StationVO {

	// station 테이블의 primary key
	private int station_num;

	// station 테이블의 역 이름
	private String station_name;

	// child 테이블의 primary key
	private int child_id;

	// child 테이블의 child 이름
	private String child_name;

	// child 테이블의 child 생년월일
	private Date child_birth;

	// child 테이블의 child 사진
	private String child_picture;

	// child 테이블의 parents_id;
	private String parents_id;

	// parent 테이블의 phone 번호
	private String parents_phone;

	public int getStation_num() {
		return station_num;
	}

	public void setStation_num(int station_num) {
		this.station_num = station_num;
	}

	public String getStation_name() {
		return station_name;
	}

	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}

	public int getChild_id() {
		return child_id;
	}

	public void setChild_id(int child_id) {
		this.child_id = child_id;
	}

	public String getChild_name() {
		return child_name;
	}

	public void setChild_name(String child_name) {
		this.child_name = child_name;
	}

	public Date getChild_birth() {
		return child_birth;
	}

	public void setChild_birth(Date child_birth) {
		this.child_birth = child_birth;
	}

	public String getChild_picture() {
		return child_picture;
	}

	public void setChild_picture(String child_picture) {
		this.child_picture = child_picture;
	}

	public String getParents_id() {
		return parents_id;
	}

	public void setParents_id(String parents_id) {
		this.parents_id = parents_id;
	}

	public String getParents_phone() {
		return parents_phone;
	}

	public void setParents_phone(String parents_phone) {
		this.parents_phone = parents_phone;
	}
}
