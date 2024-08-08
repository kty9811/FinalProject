package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.PageMaker2;
import com.spring.dto.ChildVO;


public interface SearchChildService {

	Map<String,Object> searchList(PageMaker pageMaker) throws SQLException;
	ChildVO detail(int child_id) throws SQLException;
	void regist(ChildVO child) throws SQLException;
	void modify(ChildVO child) throws SQLException;
	void remove(int child_id) throws SQLException;
	public List<ChildVO> findByParentId(String parents_id)throws SQLException;

	List<ChildVO> getChildList(PageMaker2 pageMaker2) throws SQLException;

	//번호조회
	String getParentPhoneByChildId(int child_id) throws SQLException;
	
}
