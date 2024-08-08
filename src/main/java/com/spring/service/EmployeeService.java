package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.EmployeeVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdentityException;

public interface EmployeeService {
	
	void login(String employee_id, String employee_pwd) throws NotFoundIdentityException,
    																 InvalidPasswordException,
    																 SQLException;
	
	List<EmployeeVO> list() throws SQLException;
	EmployeeVO detail(String employee_id) throws SQLException;
	void regist(EmployeeVO employee) throws SQLException;
	void modify(EmployeeVO employee) throws SQLException;
	void remove(String employee_id) throws SQLException;
	
}
