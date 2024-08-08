package com.spring.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageMaker;
import com.spring.dto.GuestbookVO;

public class GuestbookDAOImpl implements GuestbookDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		
	}
	@Override
	public List<GuestbookVO> selectSearchGuestbookList(PageMaker pageMaker) throws SQLException {
		int startRow = pageMaker.getStartRow();
		int endRow = startRow+pageMaker.getPerPageNum();
		
		Map<String, Object> dataParam = new HashMap<String, Object>();
		dataParam.put("startRow", startRow);
		dataParam.put("endRow", endRow);
		dataParam.put("searchType", pageMaker.getSearchType());
		dataParam.put("keyword", pageMaker.getKeyword());
		
		List<GuestbookVO> guestbookList
			= sqlSession.selectList("Guestbook-Mapper.selectSearchGuestbookList", dataParam);
		
		return guestbookList;
		
	}
	@Override
	public int selectSearchGuestbookListCount(PageMaker pageMaker) throws SQLException {
		int count = sqlSession.selectOne("Guestbook-Mapper.selectSearchGuestbookListCount",pageMaker);
		return count;
	}
	@Override
	public int selectGuestbookSequenceNextValue() throws SQLException {
		int pno = sqlSession.selectOne("Guestbook-Mapper.selectGuestbookSequenceNextValue");
		return pno;
	}
	@Override
	public void insertGuestbook(GuestbookVO guestbook) throws SQLException {
		sqlSession.insert("Guestbook-Mapper.insertGuestbook",guestbook);
		
	}
	@Override
	public void updateGuestbook(GuestbookVO guestbook) throws SQLException {
		sqlSession.update("Guestbook-Mapper.updateGuestbook",guestbook);
		
	}
	@Override
	public void deleteGuestbook(int pno) throws SQLException {
		sqlSession.delete("Guestbook-Mapper.deleteGuestbook",pno);
		
	}
	@Override
	public GuestbookVO selectGuestbookByPno(int pno) throws SQLException {
		GuestbookVO guestbook = sqlSession.selectOne("Guestbook-Mapper.selectGuestbookByPno",pno);
		return guestbook;
	}
	
}
