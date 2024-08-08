package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.EmployeeVO;

public interface SearchEmployeeDAO extends EmployeeDAO{
	List<EmployeeVO> selectSearchEmployeeList(PageMaker pageMaker) throws SQLException;
	
	int selectSearchEmployeeListCount(PageMaker pageMaker) throws SQLException;

}
