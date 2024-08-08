package com.spring.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.StationModifyCommand;
import com.spring.dto.StationVO;
import com.spring.service.StationService;

@Controller
public class stationController {

	@Autowired
	private StationService stationService;
	
	@GetMapping("/station/list")
	public ModelAndView list(ModelAndView mnv) {
		String url = "/station/list";
		
		List<StationVO> childList = null;
		try {
			childList = stationService.getChild();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (childList == null) {
			childList = new ArrayList<>();
		}
		
		mnv.setViewName(url);
		mnv.addObject("childList", childList);
		
		return mnv;
	}

	@GetMapping("/station/registForm")
	public ModelAndView registForm(ModelAndView mnv) {
		String url = "/station/regist";
		
		try {
	        List<StationVO> childList = stationService.getChild();
	        mnv.addObject("childList", childList);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping(value = "/station/regist")
	public String regist(@RequestParam("station_num") int stationNum, @RequestParam("child_id") int childId, Model model) {
	    
		String url = "/station/regist_success";
		try {
	        // 새로운 정류소 등록
	        StationVO station = new StationVO();
	        station.setStation_num(stationNum);
	        station.setChild_id(childId);
	        stationService.regist(station);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	   
	    return url;
	}
	


	@GetMapping("/station/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv, int station_num) throws SQLException{
		String url="/station/modify";
		
		List<StationVO> childList = stationService.getChildByStationNum(station_num);
		
		mnv.addObject("childList", childList);
		mnv.setViewName(url);

		return mnv;
	}
	
	@PostMapping("/station/modify")
	public String modify(StationModifyCommand command) throws SQLException {
	    String url = "station/modify_success";
	    	    
	        
	    if (command.getChild_id()!=null) {
	        // 각 원생의 station_num을 설정하고 업데이트 수행
	        for ( int i=0; i<command.getChild_id().size(); i++ ) {
	        	
	        	int child_id = command.getChild_id().get(i);
	        	int station_num = command.getStation_num().get(i);
	        	
	            StationVO childStation = new StationVO();
	            childStation.setStation_num(station_num);
	            childStation.setChild_id(child_id);
	            
	            stationService.modify(childStation);
	        }
	    }
	    
	    return url;
	}

	
	@PostMapping("/station/remove")
	public String remove(Integer child_id, Model model) throws Exception {
		String url = "/station/remove_success";
		
		String child_name = stationService.getChildNameById(child_id);
		stationService.remove(child_id);
	
		model.addAttribute("child_name", child_name);

		return url;
	}
	
	
}
