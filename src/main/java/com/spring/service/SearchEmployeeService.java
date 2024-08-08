package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.EmployeeVO;

public interface SearchEmployeeService extends EmployeeService{
	List<EmployeeVO> searchList(PageMaker pageMaker) throws SQLException;

}
