package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

//import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.ChildModifyCommand;
import com.spring.command.ChildRegistCommand;
import com.spring.command.PageMaker;
import com.spring.command.ParentsRegistCommand;
import com.spring.dto.ChildVO;
import com.spring.dto.ParentsVO;
import com.spring.exception.NotExistPictureFileException;
import com.spring.service.SearchChildService;
import com.spring.service.SearchParentsService;

@Controller
public class FamilyController {

	
	private static final Logger logger = LoggerFactory.getLogger(FamilyController.class);
	@Autowired
	private SearchParentsService parentsService;

	@Autowired
	private SearchChildService childService;
	



    @PostConstruct
    public void init() {
        logger.info("Configured picture path: " + picturePath);
    }

	@GetMapping("/child/list")
	public ModelAndView list(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception {
		String url = "/child/list";

		Map<String, Object> dataMap = childService.searchList(pageMaker);

		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	
	@GetMapping("/parents/list")
	public ModelAndView parentslist(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception {
		String url = "/parents/list";

		Map<String, Object> dataMap = parentsService.searchList(pageMaker);

		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}



	@GetMapping("parents/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(String Parents_id) {
		try {
			ParentsVO parents = parentsService.detail(Parents_id);
			if (parents == null) {
				return new ResponseEntity<>("", HttpStatus.OK);
			} else {
				return new ResponseEntity<>("duplicated", HttpStatus.OK);
			}
		} catch (Exception e) {
			// 로깅을 추가하여 무엇이 문제인지 서버 로그에서 확인할 수 있도록 함
			Logger logger = LoggerFactory.getLogger(FamilyController.class);
			logger.error("Error during ID check", e);
			// 클라이언트에게 오류 메시지를 보내지 않고 상태 코드만 반환
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	

	@GetMapping("/child/regist")
	public ModelAndView childregistForm(@ModelAttribute(name="parents_id") String parents_id,ModelAndView mnv) {
		String url = "/child/regist";

		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping(value = "/child/regist", produces = "text/plain;charset=utf-8")
	public ModelAndView childregist(ChildRegistCommand regCommand, ModelAndView mnv) {
		String url = "/child/regist_success";

		try {
			MultipartFile multi = regCommand.getChild_picture();
			String fileName = savePicture(null, multi);

			// DB 저장
			ChildVO child = regCommand.toChildVO();
			child.setChild_picture(fileName);

			childService.regist(child);

		} catch (NotExistPictureFileException e) {
			url = "/error/400.jsp";
			e.printStackTrace();
		} catch (Exception e) {
			url = "/error/500.jsp";
			e.printStackTrace();
		}
		
		mnv.addObject("parents_id",regCommand.getParents_id());
		mnv.setViewName(url);

		return mnv;
	}
	
	@GetMapping("/parents/regist")
	public ModelAndView parentsregistForm(ModelAndView mnv) {
		String url = "/parents/regist";
		
		mnv.setViewName(url);
		return mnv;
	}

	@PostMapping(value = "/parents/regist", produces = "text/plain;charset=utf-8")
	public ModelAndView parentsregist(ParentsRegistCommand regCommand, ModelAndView mnv) {
		String url = "/parents/regist_success";

		try {
			ParentsVO parents = regCommand.toParentsVO();
			parentsService.regist(parents);
		} catch (Exception e) {
			e.printStackTrace(); 
			url = "redirect:/parents/regist"; // 실패 시 리다이렉트할 URL
			mnv.addObject("message", "등록 실패: " + e.getMessage()); // 실패 메시지 추가
		}

		mnv.setViewName(url);
		return mnv;
	}

	@Resource(name = "picturePath")
	private String picturePath;

	public String savePicture(String oldPicture, MultipartFile multi)
	        throws NotExistPictureFileException, IllegalStateException, IOException {

		final Logger logger = LoggerFactory.getLogger(FamilyController.class);
		logger.debug("MemberController : regist - saving picture file");
		
	    if (multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 1)
	        throw new NotExistPictureFileException();
	    
	    String fileName=null;
	    // 파일저장폴더설정
	    String uploadPath = this.picturePath;
	    
	 // 파일유무확인, 저장 파일명 결정

 		String uuid = UUID.randomUUID().toString().replace("-", "");
 		fileName = uuid + "$$" + multi.getOriginalFilename();
 		File storeFile = new File(uploadPath, fileName);

 		// 파일경로 생성
 		storeFile.mkdirs();

 		// local HDD 에 저장.
 		multi.transferTo(storeFile);

 		// 기존파일 삭제
 		if (oldPicture != null && !oldPicture.isEmpty()) {
 			File oldFile = new File(uploadPath, oldPicture);
 			if (oldFile.exists()) {
 				oldFile.delete();
 			}
 		}

 		return fileName;
	    
	    
	}


	@GetMapping("/getPicture")
	@ResponseBody
	public ResponseEntity<byte[]> getChild_picture(int child_id) throws Exception {
		@SuppressWarnings("rawtypes")
		ResponseEntity entity = null;

		ChildVO child = childService.detail(child_id);

		if (child == null)
			return new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		String picture = child.getChild_picture();
		String imgPath = this.picturePath;

		InputStream in = null;

		try {
			in = new FileInputStream(new File(imgPath, picture));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.OK);
			return entity;
		} finally {
			if (in != null)
				in.close();
		}

	}

	@GetMapping("/parents/detail")
	public ModelAndView detail(String parents_id, ModelAndView mnv) throws Exception {
		String url = "/parents/detail"; // JSP 페이지 경로

		// 부모 정보 조회
		ParentsVO parents = parentsService.detail(parents_id);

		// 연결된 원생 리스트 조회
		List<ChildVO> childList = childService.findByParentId(parents_id);

		// 모델에 부모 정보와 원생 리스트 추가
		mnv.addObject("parents", parents);
		mnv.addObject("childList", childList);
		mnv.setViewName(url);

		return mnv;
	}
	
	@GetMapping("/parents/detail_parents")
	public ModelAndView detail_parents(String parents_id, ModelAndView mnv) throws Exception {
		String url = "/parents/detail_parents"; // JSP 페이지 경로

		// 부모 정보 조회
		ParentsVO parents = parentsService.detail(parents_id);

		// 연결된 원생 리스트 조회
		List<ChildVO> childList = childService.findByParentId(parents_id);

		// 모델에 부모 정보와 원생 리스트 추가
		mnv.addObject("parents", parents);
		mnv.addObject("childList", childList);
		mnv.setViewName(url);

		return mnv;
	}


	
	 @GetMapping("/parents/passwordmodify")
	    public ModelAndView passwordModifyForm(@RequestParam("parents_id") String parents_id, ModelAndView mnv) throws Exception {
	        String url = "/parents/passwordmodify"; // JSP 경로

	        ParentsVO parents = parentsService.detail(parents_id);
	        mnv.addObject("parents", parents);
	        mnv.setViewName(url);
	        return mnv;
	    }

	    // 실제 비밀번호 변경 로직 처리
	  @PostMapping("/parents/passwordmodify")
	    public ModelAndView passwordUpdate(@RequestParam("parents_id") String parents_id, 
	                                       @RequestParam("currentPassword") String currentPassword, 
	                                       @RequestParam("newPassword") String newPassword,
	                                       ModelAndView mnv) throws Exception {
	        String url = "/parents/passwordUpdateSuccess"; // 비밀번호 변경 성공 후 리다이렉트할 URL

	        // 비밀번호 변경 시도
	        ParentsVO isUpdated = parentsService.changePassword(parents_id, currentPassword, newPassword);

	        if (isUpdated != null) {
	            // 비밀번호 변경 성공
	            mnv.addObject("message", "비밀번호가 성공적으로 변경되었습니다.");
	        } else {
	            // 비밀번호 변경 실패 (예: 현재 비밀번호 불일치)
	            url = "/parents/passwordmodify"; // 비밀번호 변경 실패 시 다시 비밀번호 변경 페이지로 이동
	            mnv.addObject("message", "비밀번호 변경에 실패하였습니다. 현재 비밀번호를 확인해주세요.");
	        }

	        mnv.setViewName(url);
	        return mnv;
	    }

	    
	
	@GetMapping("/child/modify")
	public ModelAndView childmodify(int child_id, ModelAndView mnv) throws Exception {
		String url = "/child/modify";

		ChildVO child = childService.detail(child_id);

		mnv.addObject("child", child);
		mnv.setViewName(url);
		return mnv;
	}


	@PostMapping(value = "/child/modify", produces = "text/plain;charset=utf-8")
	public ModelAndView childmodify(ChildModifyCommand modifyCommand, ModelAndView mnv) throws Exception {
	    String url = "/child/modify_success";
	    ChildVO child = modifyCommand.toChildVO();
	    String oldPicture = modifyCommand.getOldPicture();
	    MultipartFile multi = modifyCommand.getChild_picture();
	     
	    try {    
	        String fileName = savePicture(oldPicture, multi); 
	        child.setChild_picture(fileName);
	        
	    }catch(NotExistPictureFileException e) {
	    	child.setChild_picture(oldPicture);
	    }catch (Exception e) {
	        url = "/error/500.jsp";
	        e.printStackTrace();
	    }
	    
	    childService.modify(child);
	    
        mnv.addObject("child_id", child.getChild_id()); // 원생 ID 추가
        mnv.addObject("parents_id", child.getParents_id()); // 원생 ID 추가
	    mnv.setViewName(url);
	    return mnv;
	}
	
	@GetMapping("/parents/modify")
	public ModelAndView modify(String parents_id, ModelAndView mnv) throws Exception {
		String url = "/parents/modify";

		ParentsVO parents = parentsService.detail(parents_id);

		mnv.addObject("parents", parents);
		mnv.setViewName(url);
		return mnv;

	}
	
	@PostMapping(value = "/parents/modify", produces = "text/plain;charset=utf-8")
	public ModelAndView parentsmodify(ParentsRegistCommand modifyCommand, ModelAndView mnv) throws Exception{
		
		String url = "/parents/modify_success";
		ParentsVO parents=modifyCommand.toParentsVO();
		parentsService.modify(parents);
		mnv.setViewName(url);
		return mnv;
	}

	@GetMapping(value = "/child/remove")
	public ModelAndView childremove(int child_id, ModelAndView mnv) throws Exception {
		String url = "child/remove_success";

		// 이미지 파일을 삭제
		ChildVO child = childService.detail(child_id);
		String savePath = this.picturePath;
		File imageFile = new File(savePath, child.getChild_picture());
		if (imageFile.exists()) {
			imageFile.delete();
		}
		// db삭제
		childService.remove(child_id);

		mnv.setViewName(url);
		return mnv;
	}
	
	

	@GetMapping(value = "/parents/remove")
	public ModelAndView parentsremove(String parents_id, ModelAndView mnv) throws Exception{
		String url = "/parents/remove_success"; // 성공시 리디렉트 될 URL 초기화
		
		parentsService.remove(parents_id);

		mnv.setViewName(url);
		return mnv;
	}


}
