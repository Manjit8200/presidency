package com.ui.dao;


import java.util.List;


import com.ui.model.MemberNomineeDetails;

public interface MemberNomineeDetailsDAO {
	
	public String addMemberNomineeDetails(MemberNomineeDetails m);
	
	MemberNomineeDetails getMemberNomineeById(int nominee_id);
	 String editMemberNomineeDetails(MemberNomineeDetails m);
	  void deleteMemberNomineeDetails(int nominee_id);
	  
	  List<MemberNomineeDetails> NomineeDetails(int member_id);

}
