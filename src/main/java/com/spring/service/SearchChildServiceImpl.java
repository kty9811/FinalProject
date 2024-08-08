package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.PageMaker2;
import com.spring.dao.BoardingDAO;
import com.spring.dao.SearchChildDAO;
import com.spring.dto.BoardingVO;
import com.spring.dto.ChildVO;


public class SearchChildServiceImpl implements SearchChildService {

	private SearchChildDAO searchchildDAO;
	public void setSearchChildDAO(SearchChildDAO searchchildDAO) {
		this.searchchildDAO = searchchildDAO;
	}
	private BoardingDAO boardingDAO;
	public void setBoardingDAO(BoardingDAO boardingDAO) {
		this.boardingDAO = boardingDAO;
	}

	
	@Override
	public List<ChildVO> getChildList(PageMaker2 pageMaker2) throws SQLException {
		List<ChildVO> childList = searchchildDAO.selectChildList(pageMaker2);
		int totalCount = searchchildDAO.selectChildListCount(pageMaker2);
		pageMaker2.setTotalCount(totalCount);
		
		if(childList !=null )for(ChildVO child : childList) {
			int child_id = child.getChild_id();
			BoardingVO boarding = boardingDAO.selectBoardingByChildId(child_id);
			
			if(boarding!=null) {
				child.setBelt_status(boarding.getBelt_status());
				child.setBoarding_status(boarding.getBoarding_status());
			}
			
		}
		
		return childList;
	}


	@Override
	public String getParentPhoneByChildId(int child_id) throws SQLException {
		return searchchildDAO.selectParentPhoneByChildId(child_id);
	}
	@Override
	public Map<String,Object> searchList(PageMaker pageMaker) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ChildVO> childList = searchchildDAO.selectSearchChildList(pageMaker);
		
		int totalCount = searchchildDAO.selectSearchChildListCount(pageMaker);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("childList", childList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	
	@Override
	public ChildVO detail(int child_id) throws SQLException {
		return searchchildDAO.selectChildById(child_id);
	}
	@Override
	public void regist(ChildVO child) throws SQLException {
		child.setChild_id(searchchildDAO.selectChildIdSeqNextVal());
		
		searchchildDAO.insertChild(child);
		
	}
	@Override
	public void modify(ChildVO child) throws SQLException {
		searchchildDAO.updateChild(child);
		
	}
	@Override
	public void remove(int child_id) throws SQLException {
		searchchildDAO.deleteChild(child_id);
		
	}

	@Override
	public List<ChildVO> findByParentId(String parent_id) throws SQLException {
		return searchchildDAO.findByParentId(parent_id);
	}



}
