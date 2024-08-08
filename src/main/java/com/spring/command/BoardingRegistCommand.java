package com.spring.command;

import java.util.List;

public class BoardingRegistCommand {
	
	private List<Integer> riding_people_num;
	private List<String> riding_people_name;
	private List<Integer> riding_station;
	private List<Integer> riding_check;
	private List<Integer> riding_belt;
	
	public List<Integer> getRiding_people_num() {
		return riding_people_num;
	}
	public void setRiding_people_num(List<Integer> riding_people_num) {
		this.riding_people_num = riding_people_num;
	}
	public List<String> getRiding_people_name() {
		return riding_people_name;
	}
	public void setRiding_people_name(List<String> riding_people_name) {
		this.riding_people_name = riding_people_name;
	}
	public List<Integer> getRiding_station() {
		return riding_station;
	}
	public void setRiding_station(List<Integer> riding_station) {
		this.riding_station = riding_station;
	}
	public List<Integer> getRiding_check() {
		return riding_check;
	}
	public void setRiding_check(List<Integer> riding_check) {
		this.riding_check = riding_check;
	}
	public List<Integer> getRiding_belt() {
		return riding_belt;
	}
	public void setRiding_belt(List<Integer> riding_belt) {
		this.riding_belt = riding_belt;
	}
	@Override
	public String toString() {
		return "BoardingRegistCommand2 [riding_people_num=" + riding_people_num + ", riding_people_name="
				+ riding_people_name + ", riding_station=" + riding_station + ", riding_check=" + riding_check
				+ ", riding_belt=" + riding_belt + "]";
	}
	
	
	
	
}
