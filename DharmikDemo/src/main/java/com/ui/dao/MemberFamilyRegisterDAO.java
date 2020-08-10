package com.ui.dao;

import java.util.List;

import com.ui.model.MemberFamilyRegister;



public interface MemberFamilyRegisterDAO {

	

	  public String addMemberFamilyRegister(MemberFamilyRegister m);
	  
	  
	  List<MemberFamilyRegister> getMemberFamilyRelation();
	 
	  public int getMemberLastId();
	  
	  List<MemberFamilyRegister> getFamilyMemberId(int member_id);
	  
	  MemberFamilyRegister getFamilyMemberById(int members_family_id);
	  
	  public String EditUser(MemberFamilyRegister req);
	  
	  void deleteMemberFamily(int members_family_id);
		
}
