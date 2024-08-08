package com.spring.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.BoardingVO;

public interface BoardingDAO {
	
	//boarding
	void insertBoarding(BoardingVO control) throws SQLException;
	void deleteBoardingByToday(HashMap<String, Object> parameters) throws SQLException;
	
	BoardingVO selectBoardingByChildId(int child_id)throws SQLException;
	void updateBoardingOff(BoardingVO boarding) throws SQLException;

	
	//main
	List<BoardingVO> selectBoardingChild(PageMaker pageMaker) throws SQLException;
	public int selectBoardingChildCount(PageMaker pageMaker) throws SQLException;
	
	//history
	List<BoardingVO> selectBoardingHistory(PageMaker pageMaker) throws SQLException;
	public int selectBoardingHistoryCount(PageMaker pageMaker) throws SQLException;
}
