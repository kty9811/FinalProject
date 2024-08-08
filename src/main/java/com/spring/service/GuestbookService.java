package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.dto.GuestbookVO;


public interface GuestbookService {
	//목록
	public Map<String, Object> list(PageMaker pageMaker) throws SQLException;

	
	public GuestbookVO detail(int pno) throws SQLException;
	
	//등록
	public void regist(GuestbookVO guestbook) throws SQLException;

	//읽기
	GuestbookVO getGuestbook(int pno) throws SQLException;
	
	
	//수정
	public void modify(GuestbookVO guestbook) throws SQLException;
	//삭제
	public void remove(int pno) throws SQLException;
}
	

