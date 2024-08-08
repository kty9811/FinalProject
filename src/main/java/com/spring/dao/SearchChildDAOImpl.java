package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.spring.command.PageMaker;
import com.spring.command.PageMaker2;
import com.spring.dto.ChildVO;

public class SearchChildDAOImpl implements SearchChildDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private SqlSession sqlSession;

	public void setSearchDAOSqlSession(SqlSession session) {
		this.sqlSession = session;
	}

	
	@Override
	public List<ChildVO> selectChildList(PageMaker2 pageMaker2) throws SQLException {
		int offset = pageMaker2.getStartRow();
		int limit = pageMaker2.getPerPageNum();
		RowBounds rows = new RowBounds(offset, limit);
		
		List<ChildVO> childList = sqlSession.selectList("Child-Mapper.selectChildList", pageMaker2, rows);
		return childList;
	}

	@Override
	public int selectChildListCount(PageMaker2 pageMaker2) throws SQLException {
		return sqlSession.selectOne("Child-Mapper.selectChildListCount", pageMaker2);
	}


	@Override
	public String selectParentPhoneByChildId(int child_id) throws SQLException {
		return sqlSession.selectOne("Child-Mapper.selectParentPhoneByChildId", child_id);
	}

	
	@Override
	public List<ChildVO> findByParentId(String parents_id) throws SQLException {
	    List<ChildVO> childList = sqlSession.selectList("Child-Mapper.findByParentsID", parents_id); // 매개변수를 추가
	    return childList;
	}

	@Override
	public List<ChildVO> selectSearchChildList(PageMaker pageMaker) throws SQLException {
		int offset = pageMaker.getStartRow();
		int limit = pageMaker.getPerPageNum();
		RowBounds rows = new RowBounds(offset, limit);

		List<ChildVO> childList = sqlSession.selectList("Child-Mapper.selectSearchChildList", pageMaker, rows);
		return childList;
	}

	@Override
	public int selectSearchChildListCount(PageMaker pageMaker) throws SQLException {
		return sqlSession.selectOne("Child-Mapper.selectSearchChildListCount", pageMaker);
	}

	@Override
	public ChildVO selectChildById(int child_id) throws SQLException {
		return sqlSession.selectOne("Child-Mapper.selectChildById", child_id);
	}

	@Override
	public void insertChild(ChildVO child) throws SQLException {
	    sqlSession.insert("Child-Mapper.insertChild", child); 
	}


	@Override
	public void updateChild(ChildVO child) throws SQLException {
		sqlSession.update("Child-Mapper.updateChild", child);

	}

	@Override
	public void deleteChild(int child_id) throws SQLException {
		sqlSession.delete("Child-Mapper.deleteChild", child_id);

	}

	@Override
	public int selectChildIdSeqNextVal() throws SQLException {
		return sqlSession.selectOne("Child-Mapper.selectChildIdSeqNextVal");
	}


}