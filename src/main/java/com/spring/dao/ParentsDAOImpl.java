package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.ParentsVO;

public class ParentsDAOImpl implements ParentsDAO{
	

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<ParentsVO> selectList() throws SQLException {
		return session.selectList("Parents-Mapper.selectParentsList");
	}
	@Override
	public ParentsVO selectParentsById(String parents_id) throws SQLException {
		return session.selectOne("Parents-Mapper.selectParentsById", parents_id);
	}
	@Override
	public void insertParents(ParentsVO parents) throws SQLException {
		session.insert("Parents-Mapper.insertParents", parents);
		
	}
	@Override
	public void updateParents(ParentsVO parents) throws SQLException {
		session.insert("Parents-Mapper.updateParents", parents);
		
	}
	@Override
	public void deleteParents(String parents_id) throws SQLException {
		session.insert("Parents-Mapper.deleteParents", parents_id);
		
	}
	@Override
	public void deleteParents2(String parents_id) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
