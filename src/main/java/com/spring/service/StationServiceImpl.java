package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dao.StationDAO;
import com.spring.dto.StationVO;

@Service
public class StationServiceImpl implements StationService{
   
   private StationDAO stationDAO;
   
   public void setStationDAO(StationDAO stationDAO) {
      this.stationDAO = stationDAO;
   }

   @Override
   public List<StationVO> getChild() throws SQLException {
      return stationDAO.selectChild();
   }
   
   @Override
   public List<StationVO> getChildById(int child_id) throws SQLException {
      return stationDAO.selectChildById(child_id);
   }
   
   @Override
   public String getChildNameById(int child_id) throws SQLException {
      return stationDAO.selectChildNameById(child_id);
   }
   
   @Override
   public List<StationVO> getChildByStationNum(int station_num) throws SQLException {
      return stationDAO.selectChildByStationNum(station_num);
   }
   
   @Override
   public void regist(StationVO station) throws SQLException {
      stationDAO.insertStation(station);
      
   }

   @Override
   public void modify(StationVO station) throws SQLException {
      stationDAO.updateStation(station);
      
   }

   @Override
   public void remove(int child_id) throws SQLException {
      stationDAO.deleteStation(child_id);
   }

   @Override
   public String getParentPhoneByChildId(int child_id) throws SQLException {
      return stationDAO.selectParentPhoneByChildId(child_id);
   }

}