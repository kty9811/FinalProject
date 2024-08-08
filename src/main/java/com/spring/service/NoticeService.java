package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.dto.AttachVO;
import com.spring.dto.NoticeVO;

public interface NoticeService {
	//목록
	public Map<String, Object> list(PageMaker pageMaker) throws SQLException;

	
	public NoticeVO detail(int nno) throws SQLException;
	
	//등록
	public void regist(NoticeVO notice) throws SQLException;
	//읽기
	void increaseViewCnt(int nno) throws SQLException;
	
	NoticeVO getNotice(int nno) throws SQLException;
	
	
	//수정
	public void modify(NoticeVO notice) throws SQLException;
	//삭제
	public void remove(int nno) throws SQLException;
	
	//파일조회
	AttachVO getAttachByAno(int ano)throws SQLException;
	
	//파일삭제
	void removeAttachByAno(int ano)throws SQLException;
}
