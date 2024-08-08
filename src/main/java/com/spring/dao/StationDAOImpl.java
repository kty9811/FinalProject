package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.StationVO;

public class StationDAOImpl implements StationDAO{
   
   private SqlSession sqlSession;
   public void setSqlSession(SqlSession session) {
      this.sqlSession = session;
   }
   @Override
   public List<StationVO> selectChild() throws SQLException {
      return sqlSession.selectList("Station-Mapper.selectChild");
   }
   
   @Override
   public List<StationVO> selectChildById(int child_id) throws SQLException {
      return sqlSession.selectList("Station-Mapper.selectChildById");
   }
   
   @Override
   public String selectChildNameById(int child_id) throws SQLException {
      return sqlSession.selectOne("Station-Mapper.selectChildNameById", child_id);
   }   

   @Override
   public List<StationVO> selectChildByStationNum(int station_num) throws SQLException {
      return sqlSession.selectList("Station-Mapper.selectChildByStationNum",station_num);
   }
   @Override
   public void insertStation(StationVO station) throws SQLException {
      sqlSession.insert("Station-Mapper.insertStation", station);
      
   }
   @Override
   public void updateStation(StationVO station) throws SQLException {
      sqlSession.update("Station-Mapper.updateStation", station);
      
   }
   @Override
   public void deleteStation(int child_id) throws SQLException {
      sqlSession.update("Station-Mapper.deleteStation", child_id);
      
   }
   @Override
   public String selectParentPhoneByChildId(int child_id) throws SQLException {
      return sqlSession.selectOne("Station-Mapper.selectParentPhoneByChildId", child_id);
   }

}