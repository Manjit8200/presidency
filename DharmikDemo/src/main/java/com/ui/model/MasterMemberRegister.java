package com.ui.model;

import org.springframework.web.multipart.MultipartFile;

public class MasterMemberRegister {
	
	
	private int member_id;
	private int plan_id;
	private int tenure_year;
	private String membership_number;
	private String membership_barcode;
	private String membership_qrcode;
	private String start_date;
	private String end_date;
	private String member_firstname;
	private String member_middlename;
	private String member_lastname;	
	private int address_id;
	private int member_country_id;
	private int member_state_id;
	private String member_city;
	private int pincode;
	private String member_image;
	private String member_mobile_no;
	private String member_phone;
	private String member_email;
	private String member_password;
	
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	
	/* ========== Address Column=============== */
	private String address_type_name;
	private String address_line_1;
	private String address_line_2;
	private String address_line_3;
	private int sequence;
	private String plan_type;
	private String plan_name;
	

	private float plan_amount;
	private float redemption_amount;
	
	private int valuex;
	private int valuey;
	private int valuew;
	private int valueh;
	
	
	private String image;
	
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getValuex() {
		return valuex;
	}
	public void setValuex(int valuex) {
		this.valuex = valuex;
	}
	public int getValuey() {
		return valuey;
	}
	public void setValuey(int valuey) {
		this.valuey = valuey;
	}
	public int getValuew() {
		return valuew;
	}
	public void setValuew(int valuew) {
		this.valuew = valuew;
	}
	public int getValueh() {
		return valueh;
	}
	public void setValueh(int valueh) {
		this.valueh = valueh;
	}
	public float getPlan_amount() {
		return plan_amount;
	}
	public void setPlan_amount(float plan_amount) {
		this.plan_amount = plan_amount;
	}
	public float getRedemption_amount() {
		return redemption_amount;
	}
	public void setRedemption_amount(float redemption_amount) {
		this.redemption_amount = redemption_amount;
	}
	public String getPlan_name() {
		return plan_name;
	}
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}
	public String getPlan_type() {
		return plan_type;
	}
	public void setPlan_type(String plan_type) {
		this.plan_type = plan_type;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	public int getTenure_year() {
		return tenure_year;
	}
	public void setTenure_year(int tenure_year) {
		this.tenure_year = tenure_year;
	}
	public String getMembership_number() {
		return membership_number;
	}
	public void setMembership_number(String membership_number) {
		this.membership_number = membership_number;
	}
	public String getMembership_barcode() {
		return membership_barcode;
	}
	public void setMembership_barcode(String membership_barcode) {
		this.membership_barcode = membership_barcode;
	}
	public String getMembership_qrcode() {
		return membership_qrcode;
	}
	public void setMembership_qrcode(String membership_qrcode) {
		this.membership_qrcode = membership_qrcode;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getMember_firstname() {
		return member_firstname;
	}
	public void setMember_firstname(String member_firstname) {
		this.member_firstname = member_firstname;
	}
	public String getMember_middlename() {
		return member_middlename;
	}
	public void setMember_middlename(String member_middlename) {
		this.member_middlename = member_middlename;
	}
	public String getMember_lastname() {
		return member_lastname;
	}
	public void setMember_lastname(String member_lastname) {
		this.member_lastname = member_lastname;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getMember_country_id() {
		return member_country_id;
	}
	public void setMember_country_id(int member_country_id) {
		this.member_country_id = member_country_id;
	}
	public int getMember_state_id() {
		return member_state_id;
	}
	public void setMember_state_id(int member_state_id) {
		this.member_state_id = member_state_id;
	}
	public String getMember_city() {
		return member_city;
	}
	public void setMember_city(String member_city) {
		this.member_city = member_city;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public String getMember_mobile_no() {
		return member_mobile_no;
	}
	public void setMember_mobile_no(String member_mobile_no) {
		this.member_mobile_no = member_mobile_no;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getAddress_type_name() {
		return address_type_name;
	}
	public void setAddress_type_name(String address_type_name) {
		this.address_type_name = address_type_name;
	}
	public String getAddress_line_1() {
		return address_line_1;
	}
	public void setAddress_line_1(String address_line_1) {
		this.address_line_1 = address_line_1;
	}
	public String getAddress_line_2() {
		return address_line_2;
	}
	public void setAddress_line_2(String address_line_2) {
		this.address_line_2 = address_line_2;
	}
	public String getAddress_line_3() {
		return address_line_3;
	}
	public void setAddress_line_3(String address_line_3) {
		this.address_line_3 = address_line_3;
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
