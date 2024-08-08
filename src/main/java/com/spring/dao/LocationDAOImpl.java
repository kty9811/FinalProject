package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.LocationVO;

@Repository
public class LocationDAOImpl implements LocationDAO{

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    
    @Override
    public LocationVO selectLocationByNo(int no) throws SQLException {
        return sqlSession.selectOne("Location-Mapper.selectLocationByNo", no);
    }
}