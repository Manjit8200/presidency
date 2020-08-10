package com.ui.dao;

import java.util.List;

import com.ui.model.MemberPersonalInformation;
import com.ui.model.Product;


public interface MemberPersonalInformationDAO {
	
	public String addMemberPersonalChoice(MemberPersonalInformation m);
	
	public String addMemberPersonalInformation1(MemberPersonalInformation m1);
	
	
	 List<MemberPersonalInformation> getAllMemberPersonalInformation(int member_id);
	 
	 MemberPersonalInformation getMemberPersonalInfo(int member_id);

	 
	 String editMemberPersonalInformation(MemberPersonalInformation m1);
	 
}
