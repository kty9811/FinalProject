package com.spring.command;

import com.spring.dto.EmployeeVO;

public class EmployeeRegistCommand {

	private String employee_id;
	private String employee_pwd;
	private String employee_name;
	private String[] employee_phone;
	
	
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
	public String[] getEmployee_phone() {
		return employee_phone;
	}
	public void setEmployee_phone(String[] employee_phone) {
		this.employee_phone = employee_phone;
	}
	
	public EmployeeVO toEmployeeVO() {
		EmployeeVO employee = new EmployeeVO();
		employee.setEmployee_id(employee_id);
		employee.setEmployee_pwd(employee_pwd);
		employee.setEmployee_name(employee_name);
		
		String phoneTemp = "";
		if (employee_phone != null) {
			for ( String p : employee_phone) {
				phoneTemp += p;
			}
		}
		employee.setEmployee_phone(phoneTemp);
		
		return employee;
	}
	
}
