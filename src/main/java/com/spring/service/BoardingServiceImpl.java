package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.command.PageMaker;
import com.spring.dao.BoardingDAO;
import com.spring.dto.BoardingVO;

@Service
public class BoardingServiceImpl implements BoardingService{
	
	private BoardingDAO boardingDAO;

	public void setBoardingDAO(BoardingDAO boardingDAO) {
		this.boardingDAO = boardingDAO;
	}

	@Override
	public void registBoarding(BoardingVO boarding, String up_time) throws SQLException {
		HashMap<String, Object> parameters = new HashMap<>();
		parameters.put("child_id", boarding.getChild_id());
		parameters.put("up_time", up_time);
		
		boardingDAO.deleteBoardingByToday(parameters);
		
		boardingDAO.insertBoarding(boarding);	
	}
	
	@Override
	public void updateBoardingOff(BoardingVO boarding) throws SQLException {
		boardingDAO.updateBoardingOff(boarding);
	}


	@Override
	public List<BoardingVO> getBoardingChild(PageMaker pageMaker) throws SQLException {
		
		List<BoardingVO> boardingList = boardingDAO.selectBoardingChild(pageMaker);
		
		int totalCount = boardingDAO.selectBoardingChildCount(pageMaker);
		pageMaker.setTotalCount(totalCount);
		
		return boardingList;
	}

	@Override
	public List<BoardingVO> getBoardingHistory(PageMaker pageMaker) throws SQLException {
		List<BoardingVO> boardingList = boardingDAO.selectBoardingHistory(pageMaker);
		
		int totalCount = boardingDAO.selectBoardingHistoryCount(pageMaker);
		pageMaker.setTotalCount(totalCount);
		
		return boardingList;
	}


}
