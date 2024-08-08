package com.spring.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.LocationVO;
import com.spring.service.LocationService;

@Controller
public class cctvController {
	@Autowired
	private LocationService locationService;
	
	@GetMapping("/cctv")
	public ModelAndView cctv(ModelAndView mnv) {
		String url="/cctv/cctv";
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/detect")
	public ModelAndView detect(ModelAndView mnv) throws SQLException {
		String url="/cctv/detect";
		
		LocationVO location = locationService.getLocationByNo(1);
		
		mnv.addObject("location", location);
		mnv.setViewName(url);
		return mnv;
	}
}
