package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageMaker;
import com.spring.dto.ParentsVO;

public class SearchParentsDAOImpl implements SearchParentsDAO {

	private SqlSession sqlSession;

	public void setSearchDAOSqlSession(SqlSession session) {
		this.sqlSession = session;
	}
	@Override
	public ParentsVO findByIdParents(String parents_id) {
		return sqlSession.selectOne("Parents-Mapper.selectById", parents_id);
	}

	@Override
	public List<ParentsVO> selectSearchParentsList(PageMaker pageMaker) throws SQLException {
		int offset = pageMaker.getStartRow();
		int limit = pageMaker.getPerPageNum();
		RowBounds rows = new RowBounds(offset, limit);

		List<ParentsVO> parentsList = sqlSession.selectList("Parents-Mapper.selectSearchParentsList", pageMaker, rows);
		return parentsList;
	}

	@Override
	public int selectSearchParentsListCount(PageMaker pageMaker) throws SQLException {
		return sqlSession.selectOne("Parents-Mapper.selectSearchParentsListCount", pageMaker);
	}

	@Override
	public List<ParentsVO> selectList() throws SQLException {
		return sqlSession.selectList("Parents-Mapper.selectParentsList");
	}

	@Override
	public ParentsVO selectParentsById(String parents_id) throws SQLException {
		return sqlSession.selectOne("Parents-Mapper.selectParentsById", parents_id);
	}

	@Override
	public void insertParents(ParentsVO parents) throws SQLException {
		sqlSession.insert("Parents-Mapper.insertParents", parents);

	}

	@Override
	public void updateParents(ParentsVO parents) throws SQLException {
		sqlSession.update("Parents-Mapper.updateParents", parents);

	}

	@Override
	public void deleteParents(String parents_id) throws SQLException {
		sqlSession.delete("Parents-Mapper.deleteParents", parents_id);

	}
	
	@Override
	public void deleteParents2(String parents_id) throws SQLException {
		sqlSession.delete("Parents-Mapper.deleteParents2",parents_id);
		
	}
	
	@Override
	public List<String> selectParentsAuthoritiesById(String parents_id) throws SQLException {
		List<String> authorities 
			= sqlSession.selectList("Parents-Mapper.selectParentsAuthoritiesById",parents_id);
		return authorities;
	}
	
	

}
