package com.spring.command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.ChildVO;


public class ChildRegistCommand {
	
	
	private String parents_id; //학부모 아이디
	private int child_id;
	private String child_name; //원생 이름
	private Date child_birth; //생년월일
	private MultipartFile child_picture; // 사진파일 경로/파일명
	

	public Date getChild_birth() {
		return child_birth;
	}

	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setChild_birth(Date child_birth) {
		this.child_birth = child_birth;
	}

	

	public MultipartFile getChild_picture() {
		return child_picture;
	}


	public void setChild_picture(MultipartFile child_picture) {
		this.child_picture = child_picture;
	}


	public String getParents_id() {
		return parents_id;
	}


	public void setParents_id(String parents_id) {
		this.parents_id = parents_id;
	}


	public String getChild_name() {
		return child_name;
	}


	public void setChild_name(String child_name) {
		this.child_name = child_name;
	}
	
	
	public int getChild_id() {
		return child_id;
	}
	
	
	public void setChild_id(int child_id) {
		this.child_id = child_id;
	}
	

	public ChildVO toChildVO() {
		ChildVO child = new ChildVO();
		child.setChild_birth(child_birth);
		child.setChild_name(child_name);
		child.setParents_id(parents_id);
		child.setChild_id(child_id);

		return child;
	


}


	
}





