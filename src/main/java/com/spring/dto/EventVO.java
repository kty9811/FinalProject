package com.spring.dto;

import java.util.Date;

public class EventVO {
	private int num;
	private String event_title;
	private String event_object;
	private String event_video;
	private Date event_time;
	private String event_location;
	private String event_thumbnail;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_object() {
		return event_object;
	}
	public void setEvent_object(String event_object) {
		this.event_object = event_object;
	}
	public String getEvent_video() {
		return event_video;
	}
	public void setEvent_video(String event_video) {
		this.event_video = event_video;
	}
	public Date getEvent_time() {
		return event_time;
	}
	public void setEvent_time(Date event_time) {
		this.event_time = event_time;
	}
	public String getEvent_location() {
		return event_location;
	}
	public void setEvent_location(String event_location) {
		this.event_location = event_location;
	}
	public String getEvent_thumbnail() {
		return event_thumbnail;
	}
	public void setEvent_thumbnail(String event_thumbnail) {
		this.event_thumbnail = event_thumbnail;
	}

	
}
