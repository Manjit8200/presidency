package com.ui.dao;

import java.util.List;

import com.ui.model.MasterClubName;

public interface MasterClubNameDAO {

	

	public String addMasterClubName(MasterClubName m);
	 List<MasterClubName> getAllMasterClubName();
}
