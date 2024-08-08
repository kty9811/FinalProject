package com.spring.command;

public class PageMaker {
	private int page=1;	// 화면에 출력되는 페이지, 페이지 번호
	private int perPageNum=10; // 화면에 한번에 출력할 페이지 갯수, 리스트 갯수
	private String searchType="";
	private String keyword="";
	
	private int totalCount; //전체 행의 개수
	private int startPage = 1; // 시작 페이지 번호
	private int endPage = 1; // 마지막 페이지 번호
	private int realEndPage; // 끝 페이지 번호
	private boolean prev; // 이전 페이지 버튼 유무
	private boolean next; // 다음 페이지 버튼 유무
	private int displayPageNum = 10; // 한 페이지에 보여줄 페이지 번호 갯수
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public int getRealEndPage() {
		return realEndPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	public int getStartRow() {
		return (this.page-1) * this.perPageNum;
	}
	
	private void calcData() {
		endPage = (int) (Math.ceil(page/(double)displayPageNum)*displayPageNum);
		startPage = (endPage - displayPageNum)+1;
		realEndPage=(int)(Math.ceil(totalCount/(double)perPageNum));
		
		if(startPage<0) {
			startPage=1;
		}
		if(endPage>realEndPage) {
			endPage=realEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage < realEndPage ? true : false;
	}
	
}
