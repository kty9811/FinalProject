package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageMaker;
import com.spring.dto.EmployeeVO;

public class SearchEmployeeDAOImpl extends EmployeeDAOImpl implements SearchEmployeeDAO{
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession session) {
		this.sqlSession = session;
	}
	
	@Override
	public List<EmployeeVO> selectSearchEmployeeList(PageMaker pageMaker) throws SQLException {
		int offset = pageMaker.getStartRow();
		int limit = pageMaker.getPerPageNum();
		RowBounds rows = new RowBounds(offset, limit);
		
		List<EmployeeVO> employeeList
		= sqlSession.selectList("Employee-Mapper.selectSearchEmployeeList", pageMaker, rows);
		return employeeList;
	}
	
	@Override
	public int selectSearchEmployeeListCount(PageMaker pageMaker) throws SQLException {
		return sqlSession.selectOne("Employee-Mapper.selectSearchEmployeeListCount", pageMaker);
	}
	
	

}
