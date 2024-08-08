package com.spring.dto;

import java.util.Date;

public class GuestbookVO {
	
	private int pno; //게시판번호
	private String gbcontent; //내용
	private String gbwriter; //작성자
	private Date gbregDate=new Date(); //등록날짜
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
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
	public Date getGbregDate() {
		return gbregDate;
	}
	public void setGbregDate(Date gbregDate) {
		this.gbregDate = gbregDate;
	}
	
	

}
