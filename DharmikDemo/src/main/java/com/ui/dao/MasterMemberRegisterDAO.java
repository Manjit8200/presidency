package com.ui.dao;

import java.util.List;


import com.ui.model.MasterMemberRegister;

public interface MasterMemberRegisterDAO {
	
	
	 
	
	  public String addMasterMemberRegister(MasterMemberRegister m);
	  String addMasterMemberRegister1(MasterMemberRegister m);
		 MasterMemberRegister getMemberPlanSequence(int plan_id);
		 List<MasterMemberRegister> getAllMemberRegisterName();
		 
		 MasterMemberRegister getRegisterMemberById(int member_id);
		 
		 

		 String editRegisterMember(MasterMemberRegister m);
		  void deleteRegisterMember(int member_id);
		  List<MasterMemberRegister> getRegisterMemberByPage(int pagesize, int startindex);
		  MasterMemberRegister getRegisterMember(int member_id);
		  
		  MasterMemberRegister getRegisterMemberAmount(int member_id);
		


}
