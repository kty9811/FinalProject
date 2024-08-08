package com.spring.dao;

import java.sql.SQLException;
import java.util.List;


import com.spring.dto.ParentsVO;

public interface ParentsDAO {
	List<ParentsVO> selectList() throws SQLException;
	ParentsVO selectParentsById(String parents_id) throws SQLException;
	void insertParents(ParentsVO parents) throws SQLException;
	void updateParents(ParentsVO parents) throws SQLException;
	void deleteParents(String parents_id) throws SQLException;
	void deleteParents2(String parents_id) throws SQLException;
	
	
	
}
