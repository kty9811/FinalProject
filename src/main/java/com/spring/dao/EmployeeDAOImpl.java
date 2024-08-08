package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.EmployeeVO;

public class EmployeeDAOImpl implements EmployeeDAO{
	

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<EmployeeVO> selectList() throws SQLException {
		return session.selectList("Employee-Mapper.selectEmployeeList");
	}
	
	@Override
	public EmployeeVO selectEmployeeById(String employee_id) throws SQLException {
		return session.selectOne("Employee-Mapper.selectEmployeeById", employee_id);
	}

	@Override
	public void insertEmployee(EmployeeVO employee) throws SQLException {
		session.insert("Employee-Mapper.insertEmployee", employee);
		
	}

	@Override
	public void updateEmployee(EmployeeVO employee) throws SQLException {
		session.insert("Employee-Mapper.updateEmployee", employee);
	}

	@Override
	public void deleteEmployee(String employee_id) throws SQLException {
		session.insert("Employee-Mapper.deleteEmployee", employee_id);
	}

}
