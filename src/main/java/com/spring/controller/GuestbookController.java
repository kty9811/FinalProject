package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.GuestbookModifyCommand;
import com.spring.command.GuestbookRegistCommand;
import com.spring.command.PageMaker;
import com.spring.dto.GuestbookVO;
import com.spring.service.GuestbookService;

@Controller
public class GuestbookController {
	
	@Autowired
	private GuestbookService guestbookService;
	

	
	@GetMapping("/guestbook/list")
	public ModelAndView list(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception {
		String url="/guestbook/list";
		
		Map<String, Object> dataMap = guestbookService.list(pageMaker);
		
		mnv.addObject("guestbookList",dataMap.get("guestbookList"));
		mnv.addObject("pageMaker", dataMap.get("pageMaker"));
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@GetMapping("/guestbook/list_parents")
	public ModelAndView list_parents(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception {
		String url="/guestbook/list_parents";
		
		Map<String, Object> dataMap = guestbookService.list(pageMaker);
		
		mnv.addObject("guestbookList",dataMap.get("guestbookList"));
		mnv.addObject("pageMaker", dataMap.get("pageMaker"));
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@GetMapping("/guestbook/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws Exception {
		String url = "/guestbook/regist";
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping(value = "/guestbook/regist", produces = "text/plain;charset=utf-8")
	public ModelAndView regist(GuestbookRegistCommand regCommand, ModelAndView mnv) throws Exception {
		String url="/guestbook/regist_success";
		
		//DB
		GuestbookVO guestbook = regCommand.toGuestbookVO();
		
		guestbookService.regist(guestbook);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/guestbook/detail")
	public ModelAndView detail(int pno, String from, ModelAndView mnv) throws Exception {
		String url="/guestbook/detail";
		
		GuestbookVO guestbook = guestbookService.detail(pno);
		
		mnv.addObject("guestbook",guestbook);
		mnv.addObject(url);
		return mnv;

	}
	
	@GetMapping("/guestbook/detail_parents")
	public ModelAndView detail_parents(int pno, String from, ModelAndView mnv) throws Exception {
		String url="/guestbook/detail_parents";
		
		GuestbookVO guestbook = guestbookService.detail(pno);
		
		mnv.addObject("guestbook",guestbook);
		mnv.addObject(url);
		return mnv;
		
		
	}
	
	@GetMapping("/guestbook/modifyForm")
	public ModelAndView modifyForm(int pno, ModelAndView mnv) throws Exception {
		String url = "/guestbook/modify";
		
		GuestbookVO guestbook = guestbookService.getGuestbook(pno);
		
		mnv.addObject("guestbook",guestbook);
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/guestbook/modify")
	public ModelAndView modify(GuestbookModifyCommand modifyCommand, ModelAndView mnv) throws Exception {
		String url = "/guestbook/modify_success";
		
		GuestbookVO guestbook = modifyCommand.toGuestbookVO();
		
		//DB 저장
		guestbookService.modify(guestbook);
		
		mnv.setViewName(url);
		return mnv;	
	}
	
	@GetMapping("/guestbook/remove")
	public ModelAndView remove(int pno, ModelAndView mnv)throws Exception{
		String url="/guestbook/remove_success";
		
		guestbookService.remove(pno);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	

	
}
	
	
