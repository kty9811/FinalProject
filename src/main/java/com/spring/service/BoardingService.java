package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.BoardingVO;

public interface BoardingService {

	//boarding
	void registBoarding(BoardingVO boarding, String up_time) throws SQLException;
	void updateBoardingOff(BoardingVO boarding) throws SQLException;
	
	//main
	List<BoardingVO> getBoardingChild(PageMaker pageMaker) throws SQLException;
	
	//history
	List<BoardingVO> getBoardingHistory(PageMaker pageMaker) throws SQLException;
}
