package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.command.PageMaker2;
import com.spring.dto.ChildVO;


public interface SearchChildDAO {

	List<ChildVO> selectSearchChildList(PageMaker pageMaker) throws SQLException;
	
	List<ChildVO> selectChildList(PageMaker2 pageMaker2) throws SQLException;
	int selectChildListCount(PageMaker2 pageMaker2) throws SQLException;
	
	String selectParentPhoneByChildId(int child_id) throws SQLException;
	int selectSearchChildListCount(PageMaker pageMaker) throws SQLException;

	ChildVO selectChildById(int child_id)throws SQLException;
	int selectChildIdSeqNextVal()throws SQLException;
	
	void insertChild(ChildVO child)throws SQLException;
	void updateChild(ChildVO child)throws SQLException;
	void deleteChild(int child_id)throws SQLException;

	List<ChildVO> findByParentId(String parents_id)throws SQLException;
}
