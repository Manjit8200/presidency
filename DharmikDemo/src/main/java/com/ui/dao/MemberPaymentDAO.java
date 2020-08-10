package com.ui.dao;

import java.util.List;

import com.ui.model.MemberPayment;

public interface MemberPaymentDAO {
	
	
	public String addMemberPayment(MemberPayment m);

	public String addMemberPaymentTaxData(MemberPayment m1);
	List<MemberPayment> getAllMemberPayment(int member_id);
	 MemberPayment getMemberPaymentById(int member_id);
	 String editMemberPayment(MemberPayment m);
	  void deleteMemberPayment(int member_payment_id);
	 
	  public int getLastPr();
	  public int getLastPaymentId();
	 MemberPayment getMemberPaymentTaxtById(int member_id);	 
	 List<MemberPayment> getAllMemberPaymentTax(int member_id);
	 void deleteMemberPaymenttTax(int member_tax_id);
	 

}
