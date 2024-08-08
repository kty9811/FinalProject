package com.spring.command;

import org.springframework.web.multipart.MultipartFile;

public class ChildModifyCommand extends ChildRegistCommand{
	private String oldPicture;
	private MultipartFile inputFile;

	public String getOldPicture() {
		return oldPicture;
	}
	public void setOldPicture(String oldPicture) {
		this.oldPicture = oldPicture;
	}
	
	public MultipartFile getInputFile() {
		return inputFile;
	}
	public void setInputFile(MultipartFile inputFile) {
		this.inputFile = inputFile;
	}
	
	
}
