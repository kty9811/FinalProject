package com.spring.dao;

import java.sql.SQLException;

import com.spring.dto.LocationVO;

public interface LocationDAO {
	
	LocationVO selectLocationByNo(int no) throws SQLException;

}











