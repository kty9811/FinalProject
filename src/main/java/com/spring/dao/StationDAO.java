package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.StationVO;

public interface StationDAO {

   List<StationVO> selectChild() throws SQLException;
   String selectChildNameById(int child_id) throws SQLException;
   List<StationVO> selectChildById(int child_id) throws SQLException;
   List<StationVO> selectChildByStationNum(int station_num) throws SQLException;
   
   void insertStation(StationVO station) throws SQLException;
   void updateStation(StationVO station) throws SQLException;
   void deleteStation(int child_id) throws SQLException;
   
   String selectParentPhoneByChildId(int child_id) throws SQLException;
}