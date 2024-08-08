package com.spring.service;

import java.sql.SQLException;
import com.spring.dao.LocationDAO;
import com.spring.dto.LocationVO;

public class LocationServiceImpl implements LocationService {

    private LocationDAO locationDAO;

    public LocationDAO getLocationDAO() {
        return locationDAO;
    }

    public void setLocationDAO(LocationDAO locationDAO) {
        this.locationDAO = locationDAO;
    }

    @Override
    public LocationVO getLocationByNo(int no) throws SQLException {
        return locationDAO.selectLocationByNo(no);
    }
}
	

