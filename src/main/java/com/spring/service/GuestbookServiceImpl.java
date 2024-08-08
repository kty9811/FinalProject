package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.dao.GuestbookDAO;
import com.spring.dto.GuestbookVO;


public class GuestbookServiceImpl implements GuestbookService{
	
	private GuestbookDAO guestbookDAO;

	
	public void setGuestbookDAO(GuestbookDAO guestbookDAO) {
		this.guestbookDAO = guestbookDAO;
	}


	@Override
	public Map<String, Object> list(PageMaker pageMaker) throws SQLException {
		List<GuestbookVO> guestbookList = guestbookDAO.selectSearchGuestbookList(pageMaker);
		
		//전체 board 개수
		int totalCount = guestbookDAO.selectSearchGuestbookListCount(pageMaker);
		// PageMaker 생성.
		pageMaker.setTotalCount(totalCount);
				
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("guestbookList", guestbookList);
		dataMap.put("pageMaker", pageMaker);
				
		return dataMap;
	}


	@Override
	public GuestbookVO detail(int pno) throws SQLException {
		GuestbookVO guestbook = guestbookDAO.selectGuestbookByPno(pno);
		return guestbook;
	}


	@Override
	public void regist(GuestbookVO guestbook) throws SQLException {
		int pno = guestbookDAO.selectGuestbookSequenceNextValue();
		guestbook.setPno(pno);
		guestbookDAO.insertGuestbook(guestbook);
		
	}


	@Override
	public GuestbookVO getGuestbook(int pno) throws SQLException {
		GuestbookVO guestbook = guestbookDAO.selectGuestbookByPno(pno);
		return guestbook;
	}


	@Override
	public void modify(GuestbookVO guestbook) throws SQLException {
		guestbookDAO.updateGuestbook(guestbook);
	}


	@Override
	public void remove(int pno) throws SQLException {
		guestbookDAO.deleteGuestbook(pno);
		
	}

	

}
