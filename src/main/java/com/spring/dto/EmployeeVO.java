package com.spring.dto;

import java.util.Date;

public class EmployeeVO {
	private String employee_id;
	private String employee_pwd;
	private String employee_name;
	private String employee_phone;
	private int employee_enable;
	private Date employee_regdate;
	
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_pwd() {
		return employee_pwd;
	}
	public void setEmployee_pwd(String employee_pwd) {
		this.employee_pwd = employee_pwd;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getEmployee_phone() {
		return employee_phone;
	}
	public void setEmployee_phone(String employee_phone) {
		this.employee_phone = employee_phone;
	}
	public int getEmployee_enable() {
		return employee_enable;
	}
	public void setEmployee_enable(int employee_enable) {
		this.employee_enable = employee_enable;
	}
	public Date getEmployee_regdate() {
		return employee_regdate;
	}
	public void setEmployee_regdate(Date employee_regdate) {
		this.employee_regdate = employee_regdate;
	}
	
	
}
