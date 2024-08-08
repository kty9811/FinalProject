package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.EmployeeVO;

public interface EmployeeDAO {
	List<EmployeeVO> selectList() throws SQLException;
	EmployeeVO selectEmployeeById(String employee_id) throws SQLException;
	void insertEmployee(EmployeeVO employee) throws SQLException;
	void updateEmployee(EmployeeVO employee) throws SQLException;
	void deleteEmployee(String employee_id) throws SQLException;
	
	
	
}
