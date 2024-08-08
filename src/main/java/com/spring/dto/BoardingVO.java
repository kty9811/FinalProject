package com.spring.dto;

import java.util.Date;

public class BoardingVO {

	// boarding

	private int child_id;
	private String child_name;
	private String child_picture;
	private String parents_name;
	
	private int station_num;
	private String station_name;
	
	private String belt_status;
	private String boarding_status;
	private Date up_time;
	
	
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
	public String getParents_name() {
		return parents_name;
	}
	public void setParents_name(String parents_name) {
		this.parents_name = parents_name;
	}
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
	public String getBelt_status() {
		return belt_status;
	}
	public void setBelt_status(String belt_status) {
		this.belt_status = belt_status;
	}
	public String getBoarding_status() {
		return boarding_status;
	}
	public void setBoarding_status(String boarding_status) {
		this.boarding_status = boarding_status;
	}
	public Date getUp_time() {
		return up_time;
	}
	public void setUp_time(Date up_time) {
		this.up_time = up_time;
	}
	public String getChild_picture() {
		return child_picture;
	}
	public void setChild_picture(String child_picture) {
		this.child_picture = child_picture;
	}

}
