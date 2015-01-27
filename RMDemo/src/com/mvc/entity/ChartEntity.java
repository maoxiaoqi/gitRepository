package com.mvc.entity;

import java.io.Serializable;

public class ChartEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	 private int epo_value ;
	 private String epo_finding ;
	 private String epo_date ;
	public int getEpo_value() {
		if(this.epo_finding==null||this.epo_finding.equals("")) return epo_value;
		if(this.getEpo_finding().equals("OK")){
			return -10 ;
		}
		if(this.getEpo_finding().equals("BAD")){
			return -20 ;
		}
		return epo_value;
	}
	public void setEpo_value(int epo_value) {
		this.epo_value = epo_value;
	}
	public String getEpo_finding() {
		return epo_finding;
	}
	
	public void setEpo_finding(String epo_finding) {
		this.epo_finding = epo_finding;
	}
	public String getEpo_date() {
		return epo_date;
	}
	public void setEpo_date(String epo_date) {
		this.epo_date = epo_date;
	}
	 
}
