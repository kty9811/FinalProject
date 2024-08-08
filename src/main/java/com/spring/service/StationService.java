package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.StationVO;

public interface StationService {
   
   //등록
   void regist(StationVO station) throws SQLException;
   
   //읽기
   List<StationVO> getChild() throws SQLException;
   String getChildNameById(int child_id) throws SQLException;
   List<StationVO> getChildById(int child_id) throws SQLException;
   List<StationVO> getChildByStationNum(int station_num) throws SQLException;
   
   //수정
   void modify(StationVO station) throws SQLException;
   
   //삭제
   void remove(int child_id) throws SQLException;
   
   //번호조회
   String getParentPhoneByChildId(int child_id) throws SQLException;
   

}