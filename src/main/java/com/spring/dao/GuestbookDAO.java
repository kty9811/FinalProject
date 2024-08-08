package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.GuestbookVO;

public interface GuestbookDAO {
	
	List<GuestbookVO> selectSearchGuestbookList(PageMaker pageMaker) throws SQLException;
	
	int selectSearchGuestbookListCount(PageMaker pageMaker) throws SQLException;
	
	GuestbookVO selectGuestbookByPno(int pno) throws SQLException;
	
	int selectGuestbookSequenceNextValue() throws SQLException;
	
	void insertGuestbook(GuestbookVO guestbook) throws SQLException;
	
	void updateGuestbook(GuestbookVO guestbook) throws SQLException;
	
	void deleteGuestbook(int pno) throws SQLException;

}
