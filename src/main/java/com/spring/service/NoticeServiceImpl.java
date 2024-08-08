package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.dao.AttachDAO;
import com.spring.dao.NoticeDAO;
import com.spring.dto.AttachVO;
import com.spring.dto.NoticeVO;

public class NoticeServiceImpl implements NoticeService{
	
	private NoticeDAO noticeDAO;
	private AttachDAO attachDAO;
	
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	@Override
	public Map<String, Object> list(PageMaker pageMaker) throws SQLException {
		List<NoticeVO> noticeList = noticeDAO.selectSearchNoticeList(pageMaker);
		
		// 전체 board 개수
		int totalCount = noticeDAO.selectSearchNoticeListCount(pageMaker);
		
		// PageMaker 생성.
		pageMaker.setTotalCount(totalCount);
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public NoticeVO detail(int nno) throws SQLException {
		NoticeVO notice = noticeDAO.selectNoticeByNno(nno);
		noticeDAO.increaseViewCnt(nno);
		return notice;
		
	}
	@Override
	public void regist(NoticeVO notice) throws SQLException {
		int nno = noticeDAO.selectNoticeSequenceNextValue();
		notice.setNno(nno);
		noticeDAO.insertNotice(notice);

		List<AttachVO> attachList = notice.getAttachList();
		if (attachList != null)
			for (AttachVO attach : attachList) {
				attach.setNno(nno);
				attach.setAttacher(notice.getWriter());
				attachDAO.insertAttach(attach);
			}
		
	}
	@Override
	public void increaseViewCnt(int nno) throws SQLException {
		noticeDAO.increaseViewCnt(nno);
		
	}
	@Override
	public NoticeVO getNotice(int nno) throws SQLException {
		NoticeVO notice = noticeDAO.selectNoticeByNno(nno);
		List<AttachVO> attachList = attachDAO.selectAttachByNno(nno);
		notice.setAttachList(attachList);
		return notice;
	}
	@Override
	public void modify(NoticeVO notice) throws SQLException {
		noticeDAO.updateNotice(notice);
		
		int nno = notice.getNno();
		
		List<AttachVO> attachList = notice.getAttachList();
		if (attachList != null)
			for (AttachVO attach : attachList) {
				attach.setNno(nno);
				attach.setAttacher(notice.getWriter());
				attachDAO.insertAttach(attach);
			}
		
	}
	@Override
	public void remove(int nno) throws SQLException {
		noticeDAO.deleteNotice(nno);
		
	}
	@Override
	public AttachVO getAttachByAno(int ano) throws SQLException {
		return attachDAO.selectAttachByAno(ano);
	}
	@Override
	public void removeAttachByAno(int ano) throws SQLException {
		attachDAO.deleteAttach(ano);
		
	}

}
