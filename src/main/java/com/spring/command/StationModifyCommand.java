package com.spring.command;

import java.util.List;

public class StationModifyCommand {
	
	private List<Integer> child_id;
	private List<Integer> station_num;
	
	
	public List<Integer> getChild_id() {
		return child_id;
	}


	public void setChild_id(List<Integer> child_id) {
		this.child_id = child_id;
	}

	public List<Integer> getStation_num() {
		return station_num;
	}

	public void setStation_num(List<Integer> station_num) {
		this.station_num = station_num;
	}

	@Override
	public String toString() {
		return "StationModifyCommand [child_id=" + child_id + ", station_num=" + station_num + "]";
	}
	
	
	
}
