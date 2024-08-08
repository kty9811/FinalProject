package com.spring.command;

import com.spring.dto.NoticeVO;

public class NoticeModifyCommand extends NoticeRegistCommand{
	
	
	private int nno;
	private int[] deleteFile;
	
	
   public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public int[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}


   @Override
   public NoticeVO toNoticeVO() {
      NoticeVO notice = super.toNoticeVO();
      notice.setNno(this.nno);
      
      return notice;
   }
	
}
