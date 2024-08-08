package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.ParentsDAO;
import com.spring.dto.ParentsVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdentityException;

public class ParentsServiceImpl implements ParentsService{

	private ParentsDAO parentsDAO;
	public void setParentsDAO(ParentsDAO parentsDAO) {
		this.parentsDAO = parentsDAO;
	}
	
	@Override
	public void login(String parents_id, String parents_pwd)
			throws NotFoundIdentityException, InvalidPasswordException, SQLException {
		ParentsVO parents = parentsDAO.selectParentsById(parents_id);
		
		if(parents == null) throw new NotFoundIdentityException();
		if(!parents_pwd.equals(parents.getParents_pwd())) throw new InvalidPasswordException();

		
	}

	@Override
	public List<ParentsVO> list() throws SQLException {
		return parentsDAO.selectList();
	}

	@Override
	public ParentsVO detail(String parents_id) throws SQLException {
		return parentsDAO.selectParentsById(parents_id);
	}

	@Override
	public void regist(ParentsVO parents) throws SQLException {
		parentsDAO.insertParents(parents);
		
	}

	@Override
	public void modify(ParentsVO parents) throws SQLException {
		parentsDAO.updateParents(parents);
		
	}

	@Override
	public void remove(String parents_id) throws SQLException {
		parentsDAO.deleteParents(parents_id);
		parentsDAO.deleteParents2(parents_id);
		
	}


	

}
