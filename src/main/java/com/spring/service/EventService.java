package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker3;
import com.spring.dto.EventVO;


public interface EventService {
	Map<String,Object> eventList(PageMaker3 pageMaker) throws SQLException;
	List<EventVO> getEventList(PageMaker3 pageMaker) throws SQLException;	
}
