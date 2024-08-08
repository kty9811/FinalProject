package com.spring.command;

import com.spring.dto.GuestbookVO;

public class GuestbookModifyCommand extends GuestbookRegistCommand{
	
	
	private int pno;
	
	
	
   public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}


   @Override
   public GuestbookVO toGuestbookVO() {
	  GuestbookVO guestbook = super.toGuestbookVO();
	  guestbook.setPno(this.pno);
      
      return guestbook;
   }
	
}
