package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker3;
import com.spring.dao.EventDAO;
import com.spring.dto.EventVO;

public class EventServiceImpl implements EventService{
	
	private EventDAO eventDAO;
	public void setEventDAO(EventDAO eventDAO) {
		this.eventDAO = eventDAO;
	}
	
	@Override
	public List<EventVO> getEventList(PageMaker3 pageMaker) throws SQLException {
		List<EventVO> eventList = eventDAO.selectEventList(pageMaker);
		int totalCount=eventDAO.selectEventListCount(pageMaker);
		pageMaker.setTotalCount(totalCount);
		return eventList;
	}

	@Override
	public Map<String, Object> eventList(PageMaker3 pageMaker) throws SQLException {
		List<EventVO> eventList = eventDAO.selectEventList(pageMaker);

		int totalCount = eventDAO.selectEventListCount(pageMaker);

		pageMaker.setTotalCount(totalCount);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("eventList", eventList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
}
