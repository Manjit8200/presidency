package com.ui.model;

public class MasterChoice {

	
	private int choice_id;
	private String choice_name;
	
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	
	
	
	public int getChoice_id() {
		return choice_id;
	}
	public void setChoice_id(int choice_id) {
		this.choice_id = choice_id;
	}
	public String getChoice_name() {
		return choice_name;
	}
	public void setChoice_name(String choice_name) {
		this.choice_name = choice_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	
	
	
	
}
