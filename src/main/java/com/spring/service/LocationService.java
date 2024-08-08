package com.spring.service;

import java.sql.SQLException;
import com.spring.dto.LocationVO;

public interface LocationService {
    LocationVO getLocationByNo(int no) throws SQLException;
}