package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.dto.ParentsVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdentityException;




public interface SearchParentsService {

	Map<String,Object> searchList(PageMaker pageMaker) throws SQLException;

	ParentsVO detail(String patents_id) throws SQLException;
	void regist(ParentsVO parents) throws SQLException;
	void modify(ParentsVO parents) throws SQLException;
	void remove(String parents_id) throws SQLException;

	ParentsVO findById(String parents_id) throws SQLException;
	
	ParentsVO login(String parents_id, String parents_pwd)throws NotFoundIdentityException,
																 InvalidPasswordException,
																 SQLException;

	ParentsVO changePassword(String parents_id, String currentPassword, String newPassword) throws SQLException;
	

}
