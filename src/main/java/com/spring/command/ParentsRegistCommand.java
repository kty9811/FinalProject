package com.spring.command;

import java.util.Date;
import java.util.List;

import com.spring.dto.ParentsVO;

public class ParentsRegistCommand {
	
	private String parents_id;  //아이디
	private String parents_pwd; //패스워드
	private String parents_name; //이름
	private String[] parents_phone; //전화번호
	private String parents_relation; //관계
	private List<String> authorities; // 권한
	
	public String getParents_id() {
		return parents_id;
	}

	public void setParents_id(String parents_id) {
		this.parents_id = parents_id;
	}

	public String getParents_pwd() {
		return parents_pwd;
	}

	public void setParents_pwd(String parents_pwd) {
		this.parents_pwd = parents_pwd;
	}


	public String getParents_name() {
		return parents_name;
	}

	public void setParents_name(String parents_name) {
		this.parents_name = parents_name;
	}

	public String[] getParents_phone() {
		return parents_phone;
	}

	public void setParents_phone(String[] parents_phone) {
		this.parents_phone = parents_phone;
	}

	public String getParents_relation() {
		return parents_relation;
	}

	public void setParents_relation(String parents_relation) {
		this.parents_relation = parents_relation;
	}

	public List<String> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<String> authorities) {
		this.authorities = authorities;
	}
	
	public ParentsVO toParentsVO() {
	    ParentsVO parents = new ParentsVO();
	    parents.setAuthorities(authorities);
	    parents.setParents_enabled(1);
	    parents.setParents_id(parents_id);
	    parents.setParents_name(parents_name);
	    parents.setParents_pwd(parents_pwd);
	    parents.setParents_relation(parents_relation);
	    parents.setParents_regDate(new Date());
	    String phoneTemp = "";
	    // parents_phone 배열이 null이 아닌 경우에만 순회
	    if (parents_phone != null) {
	        for (String p : parents_phone) {
	            phoneTemp += p;
	        }
	    }
	    parents.setParents_phone(phoneTemp);

	    return parents;
	}
}





