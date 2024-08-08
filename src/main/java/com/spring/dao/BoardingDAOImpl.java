package com.spring.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageMaker;
import com.spring.dto.BoardingVO;

public class BoardingDAOImpl implements BoardingDAO {

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession session) {
		this.sqlSession = session;
	}

	@Override
	public void insertBoarding(BoardingVO boarding) throws SQLException {
		sqlSession.insert("Boarding-Mapper.insertBoarding", boarding);
	}

	@Override
	public void deleteBoardingByToday(HashMap<String, Object> parameters) throws SQLException {
		sqlSession.delete("Boarding-Mapper.deleteBoardingByToday", parameters);
	}

	@Override
	public List<BoardingVO> selectBoardingChild(PageMaker pageMaker) throws SQLException {
		int offset = pageMaker.getStartRow();
		int limit = pageMaker.getPerPageNum();
		RowBounds rows = new RowBounds(offset, limit);

		List<BoardingVO> boardingList
		= sqlSession.selectList("Boarding-Mapper.selectBoardingChild", pageMaker, rows);
		return boardingList;
	}
	
	@Override
	public int selectBoardingChildCount(PageMaker pageMaker) throws SQLException {
		return sqlSession.selectOne("Boarding-Mapper.selectBoardingChildCount", pageMaker);
	}

	@Override
	public List<BoardingVO> selectBoardingHistory(PageMaker pageMaker) throws SQLException {
		
		int offset = pageMaker.getStartRow();
		int limit = pageMaker.getPerPageNum();
		RowBounds rows = new RowBounds(offset, limit);
		
		List<BoardingVO> boardingList
		= sqlSession.selectList("Boarding-Mapper.BoardingHistoryList", pageMaker, rows);
		return boardingList;
	}

	@Override
	public int selectBoardingHistoryCount(PageMaker pageMaker) throws SQLException {
		return sqlSession.selectOne("Boarding-Mapper.BoardingHistoryCount", pageMaker);
	}

	@Override
	public BoardingVO selectBoardingByChildId(int child_id) throws SQLException {
		
		return sqlSession.selectOne("Boarding-Mapper.selectBoardingByChildId",child_id);
	}
	
	@Override
	public void updateBoardingOff(BoardingVO boarding) throws SQLException {
		sqlSession.update("Boarding-Mapper.updateBoardingOff");
		
	}


}
