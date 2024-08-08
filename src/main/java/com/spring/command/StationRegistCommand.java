package com.spring.command;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.StationVO;

public class StationRegistCommand {

	private int station_num;
	private String child_name;
	private MultipartFile picture;
	
	
	public int getStation_num() {
		return station_num;
	}
	public void setStation_num(int station_num) {
		this.station_num = station_num;
	}
	public String getChild_name() {
		return child_name;
	}
	public void setChild_name(String child_name) {
		this.child_name = child_name;
	}
	
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	
	public StationVO toStationVO() {
		StationVO station = new StationVO();
		station.setStation_num(station_num);
		station.setChild_name(child_name);
		
		return station;
	}

	
}
