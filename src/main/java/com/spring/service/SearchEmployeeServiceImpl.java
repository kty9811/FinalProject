package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dao.SearchEmployeeDAO;
import com.spring.dto.EmployeeVO;

public class SearchEmployeeServiceImpl extends EmployeeServiceImpl implements SearchEmployeeService{
	
	private SearchEmployeeDAO searchEmployeeDAO;
	public void setSearchEmployeeDAO(SearchEmployeeDAO searchEmployeeDAO) {
		this.searchEmployeeDAO = searchEmployeeDAO;
	}
	@Override
	public List<EmployeeVO> searchList(PageMaker pageMaker) throws SQLException {
		int totalCount = searchEmployeeDAO.selectSearchEmployeeListCount(pageMaker);
		pageMaker.setTotalCount(totalCount);
		return searchEmployeeDAO.selectSearchEmployeeList(pageMaker);
	}

	
}
