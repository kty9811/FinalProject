package com.spring.command;


import com.spring.dto.GuestbookVO;


public class GuestbookRegistCommand {
	private String gbcontent;
	private String gbwriter;
	
	
	public String getGbcontent() {
		return gbcontent;
	}


	public void setGbcontent(String gbcontent) {
		this.gbcontent = gbcontent;
	}


	public String getGbwriter() {
		return gbwriter;
	}


	public void setGbwriter(String gbwriter) {
		this.gbwriter = gbwriter;
	}


	public GuestbookVO toGuestbookVO(){
		GuestbookVO guestbook = new GuestbookVO();
		guestbook.setGbcontent(this.gbcontent);
		guestbook.setGbwriter(this.gbwriter);
		
		return guestbook;
	}

}
