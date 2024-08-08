package com.spring.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.PageMaker;
import com.spring.dto.BoardingVO;
import com.spring.service.BoardingService;

@Controller
public class historyBoardingController {
	
	@Autowired
	private BoardingService boardingService;
	
	//승차내역, 탑승기록
		@GetMapping("/history/boarding")
		public ModelAndView boardingHistory(PageMaker pageMaker, ModelAndView mnv) throws SQLException {
			String url="/history/boarding";
			
			List<BoardingVO> boardingList = boardingService.getBoardingHistory(pageMaker);
			
			mnv.addObject("boardingList", boardingList);
			mnv.setViewName(url);
			return mnv;
		}

}
