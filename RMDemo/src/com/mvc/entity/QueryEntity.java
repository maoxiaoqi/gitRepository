package com.mvc.entity;

import java.io.Serializable;

public class QueryEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	private String code_ ;
	private String desc_ ;
	public String getCode_() {
		return code_;
	}
	public void setCode_(String code_) {
		this.code_ = code_;
	}
	public String getDesc_() {
		return desc_;
	}
	public void setDesc_(String desc_) {
		this.desc_ = desc_;
	}
	
}
