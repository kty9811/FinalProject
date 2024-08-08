package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.EmployeeRegistCommand;
import com.spring.command.PageMaker;
import com.spring.dto.EmployeeVO;
import com.spring.service.SearchEmployeeService;

@Controller
public class employeeController {
	
	@Autowired
	private SearchEmployeeService employeeService;

	@GetMapping("/employee/list")
	public ModelAndView list(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception {
		String url="/employee/list";
		
		List<EmployeeVO> employeeList = employeeService.searchList(pageMaker);
		
		mnv.addObject("employeeList", employeeList);
		mnv.setViewName(url);
		return mnv; 
	}
	
	@GetMapping("/employee/regist")
	public ModelAndView regist(ModelAndView mnv) throws Exception{
		String url="employee/regist";
		
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@GetMapping("employee/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(String Employee_id){
		try {
			EmployeeVO employee = employeeService.detail(Employee_id);
			if (employee == null) {
				return new ResponseEntity<>("", HttpStatus.OK);
			} else {
				return new ResponseEntity<>("duplicated", HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PostMapping(value = "/employee/regist", produces = "text/plain;charset=utf-8")
	public ModelAndView employeeregist(EmployeeRegistCommand regCommand, ModelAndView mnv) {
		String url = "/employee/regist_success";
		
		try {
			EmployeeVO employee = regCommand.toEmployeeVO();
			employeeService.regist(employee);
		} catch(Exception e) {
			e.printStackTrace();
			url = "redirect:/employee/regist";
		}
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@GetMapping("/employee/detail")
	public ModelAndView employeeDetail(String employee_id, ModelAndView mnv) throws Exception{
		String url = "/employee/detail";
		
		EmployeeVO employee = employeeService.detail(employee_id);
		
		mnv.addObject("employee", employee);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/employee/modify")
	public ModelAndView employeeModify(String employee_id, ModelAndView mnv) throws Exception{
		String url = "/employee/modify";
		
		EmployeeVO employee = employeeService.detail(employee_id);
		
		mnv.addObject("employee", employee);
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping(value="/employee/modify",produces="text/plain;charset=utf-8")
	public ModelAndView employeeModify(EmployeeRegistCommand modifyCommand, ModelAndView mnv) throws Exception{
	
		String url="/employee/modify_success";
		EmployeeVO employee=modifyCommand.toEmployeeVO();
		employeeService.modify(employee);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/employee/remove")
	public ModelAndView employeeRemove(String employee_id, ModelAndView mnv) throws Exception {
		String url = "/employee/remove_success";
		
		employeeService.remove(employee_id);
		
		mnv.addObject("message", "성공적으로 삭제되었습니다.");
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
}
