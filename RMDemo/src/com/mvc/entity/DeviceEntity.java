package com.mvc.entity;

import java.io.Serializable;

public class DeviceEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id ;
	private Integer status ;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
