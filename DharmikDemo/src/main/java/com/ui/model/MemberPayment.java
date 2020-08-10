package com.ui.model;

public class MemberPayment {
	
	private int member_id;
	private int member_payment_id;
	private int member_plan_amount;
	private float member_discount;
	private int member_currency;
	private float member_total_amount;
	
	private int member_tax_id;
	private int tax_type;
	private float tax_value;
	
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	
	private String tax_type_name;
	
	private String date;
	
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getMember_payment_id() {
		return member_payment_id;
	}
	public void setMember_payment_id(int member_payment_id) {
		this.member_payment_id = member_payment_id;
	}
	public String getTax_type_name() {
		return tax_type_name;
	}
	public void setTax_type_name(String tax_type_name) {
		this.tax_type_name = tax_type_name;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getMember_plan_amount() {
		return member_plan_amount;
	}
	public void setMember_plan_amount(int member_plan_amount) {
		this.member_plan_amount = member_plan_amount;
	}
	public float getMember_discount() {
		return member_discount;
	}
	public void setMember_discount(float member_discount) {
		this.member_discount = member_discount;
	}
	public int getMember_currency() {
		return member_currency;
	}
	public void setMember_currency(int member_currency) {
		this.member_currency = member_currency;
	}
	public float getMember_total_amount() {
		return member_total_amount;
	}
	public void setMember_total_amount(float member_total_amount) {
		this.member_total_amount = member_total_amount;
	}
	public int getMember_tax_id() {
		return member_tax_id;
	}
	public void setMember_tax_id(int member_tax_id) {
		this.member_tax_id = member_tax_id;
	}
	public int getTax_type() {
		return tax_type;
	}
	public void setTax_type(int tax_type) {
		this.tax_type = tax_type;
	}
	public float getTax_value() {
		return tax_value;
	}
	public void setTax_value(float tax_value) {
		this.tax_value = tax_value;
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
