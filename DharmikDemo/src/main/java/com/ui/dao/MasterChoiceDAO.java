package com.ui.dao;

import java.util.List;

import com.ui.model.MasterChoice;

public interface MasterChoiceDAO {
	
	public String addMasterChoice(MasterChoice m);
	 List<MasterChoice> getAllMasterChoice();

}
