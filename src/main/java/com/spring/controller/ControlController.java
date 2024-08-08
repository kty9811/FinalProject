package com.spring.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.BoardingRegistCommand;
import com.spring.command.PageMaker;
import com.spring.command.PageMaker2;
import com.spring.dto.BoardingVO;
import com.spring.dto.ChildVO;
import com.spring.dto.LocationVO;
import com.spring.service.BoardingService;
import com.spring.service.LocationService;
import com.spring.service.SearchChildService;

@Controller
public class ControlController {

	@Autowired
	private SearchChildService childService;
	@Autowired
	private BoardingService boardingService;
	@Autowired
	private LocationService locationService;
	//private HttpSession httpSession;
	

	@GetMapping("/control/main")
	public ModelAndView main(@ModelAttribute PageMaker pageMaker,ModelAndView mnv) throws SQLException {
		String url = "/control/main"; // main.jsp 파일이 위치한 경로
		
		List<BoardingVO> boardingList = boardingService.getBoardingChild(pageMaker);
		LocationVO location = locationService.getLocationByNo(1);
	    
	    mnv.addObject("boardingList", boardingList);
	    mnv.addObject("location", location);

		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/control/live")
	public ModelAndView live(ModelAndView mnv) throws SQLException{
		String url="/control/live";
		
		LocationVO location = locationService.getLocationByNo(1);
		
		mnv.addObject("location", location);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/control/arlert")
	public ModelAndView arlert(ModelAndView mnv)throws SQLException{
		String url="/control/arlert";
		LocationVO location = locationService.getLocationByNo(1);
		
		mnv.addObject("location", location);
		
		mnv.setViewName(url);
		return mnv;
	}

	// 학부모, 메인관제화면
	@GetMapping("/control/parents")
	public ModelAndView controlParents(PageMaker pageMaker, ModelAndView mnv) throws SQLException {
		String url = "/control/parents";
		
		List<BoardingVO> boardingList = boardingService.getBoardingChild(pageMaker);
		LocationVO location = locationService.getLocationByNo(1);
		
		mnv.addObject("boardingList", boardingList);
		mnv.addObject("location", location);
		mnv.setViewName(url);
		return mnv;
	}
	

	@GetMapping("/control/boardingList")
	@ResponseBody
	public List<BoardingVO> getBoardingList(PageMaker pageMaker) throws SQLException {
		List<BoardingVO> boardingList = boardingService.getBoardingChild(pageMaker);
		return boardingList;
	}

	
	// 선생님, 승차관리, 승차리스트, 관제

	@GetMapping("/control/teacher")
	public ModelAndView controlTeacher(@ModelAttribute PageMaker2 pageMaker2, ModelAndView mnv) throws Exception {
		String url = "/control/teacher";

		List<ChildVO> childList = childService.getChildList(pageMaker2);

		mnv.addObject("childList", childList);
		mnv.setViewName(url);

		return mnv;
	}

	
	
	@PostMapping(value="/control/boardingRegist", produces="text/plain;charset=utf-8")
	public ModelAndView boardingRegist(ModelAndView mnv, BoardingRegistCommand regCommand) {
		String url = "redirect:/control/teacher";
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		String up_time = sdf.format(date);
		
		
		for(int i=0; i<regCommand.getRiding_people_name().size();i++) {
			BoardingVO boarding = new BoardingVO();
			
			boarding.setBelt_status(regCommand.getRiding_belt().get(i)+"");
			boarding.setBoarding_status(regCommand.getRiding_check().get(i)+"");
			boarding.setChild_name(regCommand.getRiding_people_name().get(i));
			boarding.setChild_id(regCommand.getRiding_people_num().get(i));
			boarding.setStation_num(regCommand.getRiding_station().get(i));
			
			if (("1").equals(regCommand.getRiding_belt().get(i)+"") && ("1").equals(regCommand.getRiding_check().get(i)+"")) {
				try {
					boardingService.registBoarding(boarding, up_time);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PostMapping("/control/boardingOff")
	public String boardingOff(BoardingVO boarding) throws SQLException{
		String url = "redirect:/control/teacher";
		
		boardingService.updateBoardingOff(boarding);
		
		return url;
	}


	@GetMapping("/getParentsPhone")
	@ResponseBody
	public String getParentsPhone(@RequestParam("childId") int childId) throws SQLException {
		String parentsPhone = childService.getParentPhoneByChildId(childId);
		return parentsPhone;
	}
	

	/*
	@PostMapping("/save-checkbox-state")
	@ResponseBody
	public void saveCheckboxState(@RequestParam("checkboxId") String checkboxId,
			@RequestParam("isChecked") boolean isChecked) {
		httpSession.setAttribute(checkboxId, isChecked);
	}

	@GetMapping("/get-checkbox-state")
	@ResponseBody
	public boolean getCheckboxState(@RequestParam("checkboxId") String checkboxId) {
		Boolean isChecked = (Boolean) httpSession.getAttribute(checkboxId);
		return isChecked != null && isChecked;
	}
	*/

	@GetMapping("/action")
	public String carAction(@RequestParam("go") String action) {
		String result = "";
		String url = "/action?go=" + action;
		String method = "GET";

		HttpURLConnection conn = getHttpURLConnection(url, method);

		result = getHttpResponse(conn);
		System.out.println(result);
		return result;
	}

	public HttpURLConnection getHttpURLConnection(String target_url, String method) {
		HttpURLConnection conn = null;
		URL url = null;

		String arduinoIP = "192.168.137.200";

		try {
			url = new URL("http://" + arduinoIP + target_url);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod(method);
			conn.setConnectTimeout(5000);
			conn.setRequestProperty("Content-Type", "text/html;charset=UTF-8");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return conn;
	}

	private String getHttpResponse(HttpURLConnection conn) {
		String result = null;

		try {
			if (conn.getResponseCode() == 200) { // 정상적으로 데이터를 받았을 경우
				System.out.println("http 200 OK");
				result = "http 200 OK";
			} else {
				result = conn.getResponseCode() + "\n";
				result += conn.getResponseMessage();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			conn.disconnect();
		}

		return result;
	}

}
