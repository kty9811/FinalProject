package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.EmployeeDAO;
import com.spring.dto.EmployeeVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdentityException;

public class EmployeeServiceImpl implements EmployeeService{

	private EmployeeDAO employeeDAO;
	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
	
	@Override
	public void login(String employee_id, String employee_pwd)
			throws NotFoundIdentityException, InvalidPasswordException, SQLException {
		EmployeeVO employee = employeeDAO.selectEmployeeById(employee_id);
		
		if(employee == null) throw new NotFoundIdentityException();
		if(!employee_pwd.equals(employee.getEmployee_pwd())) throw new InvalidPasswordException();

	}
	
	
	@Override
	public List<EmployeeVO> list() throws SQLException {
		return employeeDAO.selectList();
	}


	@Override
	public EmployeeVO detail(String employee_id) throws SQLException {
		return employeeDAO.selectEmployeeById(employee_id);
	}


	@Override
	public void regist(EmployeeVO employee) throws SQLException {
		employeeDAO.insertEmployee(employee);
	}


	@Override
	public void modify(EmployeeVO employee) throws SQLException {
		employeeDAO.updateEmployee(employee);
	}


	@Override
	public void remove(String employee_id) throws SQLException {
		employeeDAO.deleteEmployee(employee_id);
	}
	

}
