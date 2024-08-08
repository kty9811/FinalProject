package com.spring.dto;

import java.util.Date;
import java.util.List;

public class ParentsVO {
	
	private String parents_id;
	private String parents_pwd;
	private String parents_name="---";
	private String parents_phone;
	private String parents_relation;
	private Date parents_regDate;
	private List<String> parents_authorities; // 권한
	private int parents_enabled;
	private List<ChildVO> children;
	
	
	public List<String> getParents_authorities() {
		return parents_authorities;
	}
	public void setParents_authorities(List<String> parents_authorities) {
		this.parents_authorities = parents_authorities;
	}
	
	
	public List<ChildVO> getChildren() {
		return children;
	}
	public void setChildren(List<ChildVO> children) {
		this.children = children;
	}
	public int getParents_enabled() {
		return parents_enabled;
	}
	public void setParents_enabled(int parents_enabled) {
		this.parents_enabled = parents_enabled;
	}
	private List<String> authorities;
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
	public String getParents_phone() {
		return parents_phone;
	}
	public void setParents_phone(String parents_phone) {
		this.parents_phone = parents_phone;
	}
	public List<String> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(List<String> authorities) {
		this.authorities = authorities;
	}
	public String getParents_relation() {
		return parents_relation;
	}
	public void setParents_relation(String parents_relation) {
		this.parents_relation = parents_relation;
	}
	public Date getParents_regDate() {
		return parents_regDate;
	}
	public void setParents_regDate(Date parents_regDate) {
		this.parents_regDate = parents_regDate;
	}

	
}
