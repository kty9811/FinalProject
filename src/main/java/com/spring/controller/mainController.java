package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.EmployeeDAO;
import com.spring.dao.ParentsDAO;
import com.spring.dto.EmployeeVO;
import com.spring.dto.ParentsVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdentityException;
import com.spring.service.EmployeeService;
import com.spring.service.ParentsService;

@Controller
public class mainController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private EmployeeDAO employeeDAO;
	
	
	@Autowired
	private ParentsService parentsService;
	
	@Autowired
	private ParentsDAO parentsDAO;
	
	//유치원 로그인
	@GetMapping("/login_kinder")
	public ModelAndView login(ModelAndView mnv) {
		String url="/login_kinder";
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/login_kinder")
	public ModelAndView loginPost(String employee_id, String employee_pwd, String retUrl, HttpSession session, RedirectAttributes rttr, ModelAndView mnv) throws Exception{
		String url="redirect:/index";
		
		try {
			employeeService.login(employee_id, employee_pwd);
			
			EmployeeVO employee = employeeDAO.selectEmployeeById(employee_id);
			session.setAttribute("loginUser", employee);
			session.setMaxInactiveInterval(6*6000);
			
			session.getServletContext().setAttribute("loginUser", employee.getEmployee_id());
			if(retUrl != null && !retUrl.isEmpty() && !retUrl.equals("null")) {
			    url = "redirect:" + retUrl;
			}
		} catch(NotFoundIdentityException | InvalidPasswordException e) {
			url = "redirect:/login?retUrl="+retUrl;
			rttr.addFlashAttribute("message", e.getMessage());
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	//선생님 로그인
	@GetMapping("/login_teacher")
	public ModelAndView login_teacher(ModelAndView mnv) {
		String url="/login_teacher";
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/login_teacher")
	public ModelAndView login_teacherPost(String employee_id, String employee_pwd, String retUrl, HttpSession session, RedirectAttributes rttr, ModelAndView mnv) throws Exception{
	    String url="redirect:/control/teacher";
	    
	    try {
	        employeeService.login(employee_id, employee_pwd);
	        
	        EmployeeVO employee = employeeDAO.selectEmployeeById(employee_id);
	        session.setAttribute("loginUser", employee);
	        session.setMaxInactiveInterval(6*6000);
	        
	        session.getServletContext().setAttribute("loginUser", employee.getEmployee_id());
	        if(retUrl != null && !retUrl.isEmpty() && !retUrl.equals("null")) {
	            url = "redirect:" + retUrl;
	        }
	    } catch(NotFoundIdentityException | InvalidPasswordException e) {
	        url = "redirect:/login?retUrl="+retUrl;
	        rttr.addFlashAttribute("message", e.getMessage());
	    }
	    
	    mnv.setViewName(url);
	    return mnv;
	}
	//학부모 로그인
	@GetMapping("/login_parents")
	public ModelAndView login_parents(ModelAndView mnv) {
		String url="/login_parents";
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/login_parents")
	public ModelAndView login_parentsPost(String parents_id, String parents_pwd, String retUrl, HttpSession session, RedirectAttributes rttr, ModelAndView mnv) throws Exception{
		String url="redirect:/control/parents";
		
		try {
			parentsService.login(parents_id, parents_pwd);
			
			ParentsVO parents = parentsDAO.selectParentsById(parents_id);
			session.setAttribute("loginUser", parents);
			session.setMaxInactiveInterval(6*6000);
			
			session.getServletContext().setAttribute("loginUser", parents.getParents_id());
			if(retUrl != null && !retUrl.isEmpty() && !retUrl.equals("null")) {
			    url = "redirect:" + retUrl;
			}
		} catch(NotFoundIdentityException | InvalidPasswordException e) {
			rttr.addFlashAttribute("message", e.getMessage());
			url = "redirect:/login_parents?retUrl="+retUrl;
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	
	//로그아웃 기능
	@GetMapping("/logout")
	public ModelAndView logout(String employee_id, HttpSession session, ModelAndView mnv) throws Exception{
		String url = "redirect:/login";
		
		session.invalidate();
		
		mnv.setViewName(url);
		return mnv;
	}
	
	//상단바만 있는 메인화면
	@GetMapping("/index")
	public ModelAndView controlMain(ModelAndView mnv) throws Exception{
		String url="/index";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/login")
	public ModelAndView loginMain(ModelAndView mnv) throws Exception{
		String url="/login";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mnv) throws Exception{
		String url="/main";
		
		mnv.setViewName(url);
		return mnv;
	}
	
}
