package com.ui.dao;

import java.util.List;


import com.ui.model.MasterMemberPlan;

public interface MasterMemberPlanDAO {
	 
	public String addMasterMemberPlan(MasterMemberPlan m);
	 List<MasterMemberPlan> getAllMemberName();
	 MasterMemberPlan getMemberById(int plan_id);
	 String editMasterMemberPlan(MasterMemberPlan masterMemberPlan);
	  void deleteMasterMemberPlan(int plan_id);
	  List<MasterMemberPlan> getsMasterMemberPlanByPage(int pagesize, int startindex);


}
