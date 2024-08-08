package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.command.PageMaker3;
import com.spring.dto.EventVO;

public class EventDAOImpl implements EventDAO {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession session) {
		this.sqlSession = session;
	}

	@Override
	public List<EventVO> selectEventList(PageMaker3 pageMaker) throws SQLException {
		int offset = pageMaker.getStartRow();
		int limit = pageMaker.getPerPageNum();
		RowBounds rows = new RowBounds(offset, limit);

		List<EventVO> eventList = sqlSession.selectList("Event-Mapper.selectEventList", pageMaker, rows);
		return eventList;
	}

	@Override
	public int selectEventListCount(PageMaker3 pageMaker) throws SQLException {
		return sqlSession.selectOne("Event-Mapper.selectEventListCount", pageMaker);
	}


	@Override
	public EventVO selectEventById(int num) throws SQLException {
		return sqlSession.selectOne("Event-Mapper.selectEventById", num);
	}

	

}