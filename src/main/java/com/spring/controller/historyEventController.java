package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.PageMaker3;
import com.spring.service.EventService;

@Controller
public class historyEventController {

	@Autowired
	private EventService eventService;
	// 감지자료, 이벤트 기록
	@GetMapping("/history/event")
	public ModelAndView eventHistory(@ModelAttribute PageMaker3 pageMaker,ModelAndView mnv) throws Exception {
		String url = "/history/event";
		Map<String, Object> dataMap=eventService.eventList(pageMaker);
		mnv.addObject("eventList",dataMap.get("eventList"));
		mnv.addObject("pageMaker",dataMap.get("pageMaker"));
		mnv.setViewName(url);
		return mnv;
	}
	
	

	// 이벤트 기록영상1
	@GetMapping("/history/video1")
	public ModelAndView video1(ModelAndView mnv) {
		String url = "/history/video1";
		mnv.setViewName(url);
		return mnv;
	}

	// 이벤트 기록영상2
	@GetMapping("/history/video2")
	public ModelAndView video2(ModelAndView mnv) {
		String url = "/history/video2";
		mnv.setViewName(url);
		return mnv;
	}

	// 이벤트 기록영상3
	@GetMapping("/history/video3")
	public ModelAndView video3(ModelAndView mnv) {
		String url = "/history/video3";
		mnv.setViewName(url);
		return mnv;
	}

	// 이벤트 기록영상4
	@GetMapping("/history/video4")
	public ModelAndView video4(ModelAndView mnv) {
		String url = "/history/video4";
		mnv.setViewName(url);
		return mnv;
	}

	// 이벤트 기록영상5
	@GetMapping("/history/video5")
	public ModelAndView video5(ModelAndView mnv) {
		String url = "/history/video5";
		mnv.setViewName(url);
		return mnv;
	}

	
}
