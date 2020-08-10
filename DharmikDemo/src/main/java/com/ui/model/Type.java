package com.ui.model;

public class Type {
	
	
	private int type_id;
	private int category_id;
	private int sub_category_id;
	private String type_name;
	private String type_code;
	private String type_desc;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	
	
	
	public int getType_id() {
		return type_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public int getSub_category_id() {
		return sub_category_id;
	}
	public String getType_name() {
		return type_name;
	}
	public String getType_code() {
		return type_code;
	}
	public String getType_desc() {
		return type_desc;
	}
	public String getStatus() {
		return status;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public void setSub_category_id(int sub_category_id) {
		this.sub_category_id = sub_category_id;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public void setType_code(String type_code) {
		this.type_code = type_code;
	}
	public void setType_desc(String type_desc) {
		this.type_desc = type_desc;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	
	
	
	

}
