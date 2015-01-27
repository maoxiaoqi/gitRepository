package com.mvc.entity;

import java.io.Serializable;

public class CheckEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	private String epo_code ;
	 private String obj_mrc ;
	 private String epo_aspect ;
	 private String asp_desc ;
	 private String epo_object ;
	 private String obj_desc ;
	 private String poi_point;
	 private String poi_desc ;
	 private String mth_desc ;
	 private String epo_event ;
	 private String epo_date ;
	 private String epo_uom ;
	 private int epo_value ;
	 private String epo_finding ;
	 private int apo_nominal ;
	 private int epo_min ;
	 private int epo_max ;
	 private String epo_comment ;
	 
	
	public String getEpo_aspect() {
		return epo_aspect;
	}
	public void setEpo_aspect(String epo_aspect) {
		this.epo_aspect = epo_aspect;
	}
	public String getPoi_point() {
		return poi_point;
	}
	public void setPoi_point(String poi_point) {
		this.poi_point = poi_point;
	}
	public String getEpo_code() {
		return epo_code;
	}
	public void setEpo_code(String epo_code) {
		this.epo_code = epo_code;
	}
	public String getObj_mrc() {
		return obj_mrc;
	}
	public void setObj_mrc(String obj_mrc) {
		this.obj_mrc = obj_mrc;
	}
	public String getAsp_desc() {
		return asp_desc;
	}
	public void setAsp_desc(String asp_desc) {
		this.asp_desc = asp_desc;
	}
	public String getEpo_object() {
		return epo_object;
	}
	public void setEpo_object(String epo_object) {
		this.epo_object = epo_object;
	}
	public String getObj_desc() {
		return obj_desc;
	}
	public void setObj_desc(String obj_desc) {
		this.obj_desc = obj_desc;
	}
	public String getPoi_desc() {
		return poi_desc;
	}
	public void setPoi_desc(String poi_desc) {
		this.poi_desc = poi_desc;
	}
	public String getMth_desc() {
		return mth_desc;
	}
	public void setMth_desc(String mth_desc) {
		this.mth_desc = mth_desc;
	}
	public String getEpo_event() {
		return epo_event;
	}
	public void setEpo_event(String epo_event) {
		this.epo_event = epo_event;
	}
	public String getEpo_date() {
		return epo_date;
	}
	public void setEpo_date(String epo_date) {
		this.epo_date = epo_date;
	}
	public String getEpo_uom() {
		return epo_uom;
	}
	public void setEpo_uom(String epo_uom) {
		this.epo_uom = epo_uom;
	}
	public int getEpo_value() {
		return epo_value;
	}
	public void setEpo_value(int epo_value) {
		this.epo_value = epo_value;
	}
	public String getEpo_finding() {
		if(this.epo_finding==null||"".equals(this.epo_finding)){
			return String.valueOf(this.epo_value) ;
		}
		if(this.epo_finding.endsWith("OK")){
			return "-10";
		}
		if(this.epo_finding.endsWith("BAD")){
			return "-20";
		}
		return "0";
	}
	public void setEpo_finding(String epo_finding) {
		this.epo_finding = epo_finding;
	}
	public int getApo_nominal() {
		return apo_nominal;
	}
	public void setApo_nominal(int apo_nominal) {
		this.apo_nominal = apo_nominal;
	}
	public int getEpo_min() {
		return epo_min;
	}
	public void setEpo_min(int epo_min) {
		this.epo_min = epo_min;
	}
	public int getEpo_max() {
		return epo_max;
	}
	public void setEpo_max(int epo_max) {
		this.epo_max = epo_max;
	}
	public String getEpo_comment() {
		return epo_comment;
	}
	public void setEpo_comment(String epo_comment) {
		this.epo_comment = epo_comment;
	}
	 

}
