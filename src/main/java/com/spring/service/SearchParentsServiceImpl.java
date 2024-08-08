package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.dao.SearchParentsDAO;
import com.spring.dto.ParentsVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdentityException;

public class SearchParentsServiceImpl implements SearchParentsService {

	private SearchParentsDAO searchparentsDAO;

	public void setSearchParentsDAO(SearchParentsDAO searchparentsDAO) {
		this.searchparentsDAO = searchparentsDAO;
	}

	@Override
	public Map<String, Object> searchList(PageMaker pageMaker) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ParentsVO> parentsList = searchparentsDAO.selectSearchParentsList(pageMaker);

		int totalCount = searchparentsDAO.selectSearchParentsListCount(pageMaker);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("parentsList", parentsList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public ParentsVO detail(String parents_id) throws SQLException {
		return searchparentsDAO.selectParentsById(parents_id);
	}

	@Override
	public void regist(ParentsVO parents) throws SQLException {
		searchparentsDAO.insertParents(parents);
	}

	@Override
	public void modify(ParentsVO parents) throws SQLException {
		searchparentsDAO.updateParents(parents);

	}

	@Override
	public ParentsVO findById(String parents_id) throws SQLException {
		return searchparentsDAO.findByIdParents(parents_id);

	}

	@Override
	public void remove(String parents_id) throws SQLException {
		searchparentsDAO.deleteParents(parents_id);
		searchparentsDAO.deleteParents2(parents_id);
	}

	@Override
	public ParentsVO login(String parents_id, String parents_pwd)
			throws NotFoundIdentityException, InvalidPasswordException, SQLException {
		ParentsVO parents = searchparentsDAO.selectParentsById(parents_id);

		if (parents == null)
			throw new NotFoundIdentityException();
		if (!parents_pwd.equals(parents.getParents_pwd()))
			throw new InvalidPasswordException();

		List<String> authorities = searchparentsDAO.selectParentsAuthoritiesById(parents_id);
		parents.setAuthorities(authorities);

		return parents;
	}

	@Override
	public ParentsVO changePassword(String parents_id, String currentPassword, String newPassword) throws SQLException {
		searchparentsDAO.selectParentsById(parents_id);
		return null;
	}

}
