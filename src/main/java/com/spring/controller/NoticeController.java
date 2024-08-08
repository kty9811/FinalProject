package com.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.NoticeModifyCommand;
import com.spring.command.NoticeRegistCommand;
import com.spring.command.PageMaker;
import com.spring.dto.AttachVO;
import com.spring.dto.NoticeVO;
import com.spring.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	
	@GetMapping("/notice/list")
	public ModelAndView list(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception {
		String url="/notice/list";
		
		Map<String, Object> dataMap = noticeService.list(pageMaker);
		
		mnv.addObject("noticeList",dataMap.get("noticeList"));
		mnv.addObject("pageMaker",dataMap.get("pageMaker"));
		mnv.setViewName(url);
		return mnv;
		
		
	}
	@GetMapping("/notice/list_parents")
	public ModelAndView list_parents(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception {
		String url="/notice/list_parents";
		
		Map<String, Object> dataMap = noticeService.list(pageMaker);
		
		mnv.addObject("noticeList",dataMap.get("noticeList"));
		mnv.addObject("pageMaker",dataMap.get("pageMaker"));
		mnv.setViewName(url);
		return mnv;
		
		
	}
	
	@GetMapping("/notice/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws Exception {
		String url = "/notice/regist";
		mnv.setViewName(url);
		return mnv;
	}
	
	@Resource(name="noticeSavedFilePath")
	private String fileUploadPath;
	
	@PostMapping(value = "/notice/regist", produces = "text/plain;charset=utf-8")
	public ModelAndView regist(NoticeRegistCommand regCommand, ModelAndView mnv) throws Exception {
		String url="/notice/regist_success";
		
		List<MultipartFile> multiFiles = regCommand.getUploadFile();
		String savePath = this.fileUploadPath;	
		
		List<AttachVO> attachList = saveFileToAttaches(multiFiles,savePath);
		
		//DB 
		NoticeVO notice = regCommand.toNoticeVO();
		notice.setAttachList(attachList);
		
		noticeService.regist(notice);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	


	@GetMapping("/notice/detail")
	public ModelAndView detail(int nno, String from, ModelAndView mnv) throws Exception {
		String url = "/notice/detail";
		
		NoticeVO notice = null;
		if (from !=null && from.contentEquals("list")) {
			noticeService.increaseViewCnt(nno); //조회수 올리는부분
			url = "redirect:/notice/detail?nno="+nno;
		} else {
			notice =noticeService.getNotice(nno);
			
		}
		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/notice/detail_parents")
	public ModelAndView detail_parents(int nno, String from, ModelAndView mnv) throws Exception {
		String url = "/notice/detail_parents";
		
		NoticeVO notice = null;
		if (from !=null && from.contentEquals("list")) {
			noticeService.increaseViewCnt(nno); //조회수 올리는부분
			url = "redirect:/notice/detail_parents?nno="+nno;
		} else {
			notice =noticeService.getNotice(nno);
			
		}
		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/notice/modifyForm")
	public ModelAndView modifyForm(int nno, ModelAndView mnv)throws Exception{
		String url = "/notice/modify";
		
		NoticeVO notice = noticeService.getNotice(nno);
		
		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/notice/modify")
	public ModelAndView modify(NoticeModifyCommand modifyCommand, ModelAndView mnv)throws Exception{
		String url = "/notice/modify_success";
		
		//파일삭제
		if(modifyCommand.getDeleteFile() != null && modifyCommand.getDeleteFile().length > 0) {
			for(int ano : modifyCommand.getDeleteFile()) {
				AttachVO attach = noticeService.getAttachByAno(ano);
				
				String savedPath = attach.getUploadPath().replace("/", File.separator);
				
				File deleteFile = new File(savedPath, attach.getFileName());
				
				if(deleteFile.exists()) {
					deleteFile.delete(); //파일삭제
				}
				noticeService.removeAttachByAno(ano); //DB삭제
			}
		}
		
		//파일저장
		List<AttachVO> attachList 
		= saveFileToAttaches(modifyCommand.getUploadFile(), fileUploadPath);
		
		//PdsVO setting
		NoticeVO notice = modifyCommand.toNoticeVO();
		notice.setAttachList(attachList);
		
		//DB 저장
		noticeService.modify(notice);
		
		mnv.setViewName(url);
		return mnv;
	}
	@GetMapping("/notice/remove")
	public ModelAndView remove(int nno, ModelAndView mnv)throws Exception{
		String url="/notice/remove_success";
		
		//첨부파일 삭제
		List<AttachVO> attachList = noticeService.getNotice(nno).getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				File target = new File(attach.getUploadPath(), attach.getFileName());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		
		noticeService.remove(nno);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@GetMapping("/getFile")
	public ModelAndView getFile(int ano,  ModelAndView mnv)throws Exception{
		String url="download";
		
		AttachVO attach = noticeService.getAttachByAno(ano);
		

		mnv.addObject("savedPath", attach.getUploadPath());
		mnv.addObject("fileName", attach.getFileName());		
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	private List<AttachVO> saveFileToAttaches(List<MultipartFile> multiFiles,
			  String savePath )throws Exception{
		
		if (multiFiles == null) return null;
		
		//저장 -> attachVO -> list.add
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		for (MultipartFile multi : multiFiles) {
			String uuid = UUID.randomUUID().toString().replace("-", "");
			String fileName = uuid+"$$"+multi.getOriginalFilename();
			
			//파일저장
			File target = new File(savePath, fileName);
			target.mkdirs();
			multi.transferTo(target);
			
			//attachVO
			AttachVO attach = new AttachVO();
			attach.setUploadPath(savePath);
			attach.setFileName(fileName);
			attach.setFileType(fileName.substring(fileName.lastIndexOf('.') + 1)
					.toUpperCase());
			
			attachList.add(attach);
		}
		return attachList;
	}
}
	
