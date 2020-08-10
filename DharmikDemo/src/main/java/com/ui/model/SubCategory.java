package com.ui.model;

public class SubCategory {

	
	private int sub_category_id;
	private int category_id;
	private String category_name;
	private String sub_category_name;
	private String sub_category_code;
	private String sub_category_desc;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	
	
	
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getSub_category_id() {
		return sub_category_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public String getSub_category_name() {
		return sub_category_name;
	}
	public String getSub_category_code() {
		return sub_category_code;
	}
	public String getSub_category_desc() {
		return sub_category_desc;
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
	public void setSub_category_id(int sub_category_id) {
		this.sub_category_id = sub_category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}
	public void setSub_category_code(String sub_category_code) {
		this.sub_category_code = sub_category_code;
	}
	public void setSub_category_desc(String sub_category_desc) {
		this.sub_category_desc = sub_category_desc;
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
