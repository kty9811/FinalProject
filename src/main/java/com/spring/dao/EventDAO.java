package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker3;
import com.spring.dto.EventVO;

public interface EventDAO {
	
	
	List<EventVO> selectEventList(PageMaker3 pageMaker) throws SQLException;
	int selectEventListCount(PageMaker3 pageMaker) throws SQLException;
	EventVO selectEventById(int num)throws SQLException;

}











