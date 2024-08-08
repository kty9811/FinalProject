package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.ParentsVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdentityException;

public interface ParentsService {
	
	void login(String parents_id, String parents_pwd) throws NotFoundIdentityException,
    																 InvalidPasswordException,
    																 SQLException;
	
	List<ParentsVO> list() throws SQLException;
	ParentsVO detail(String parents_id) throws SQLException;
	void regist(ParentsVO parents) throws SQLException;
	void modify(ParentsVO parents) throws SQLException;
	void remove(String parents_id) throws SQLException;
	
}
