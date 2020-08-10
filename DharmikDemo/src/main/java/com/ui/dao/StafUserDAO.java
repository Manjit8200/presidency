package com.ui.dao;

import java.util.List;

import com.ui.model.Product;
import com.ui.model.StafUser;

public interface StafUserDAO {
	
	
	
	public String addStafUser(StafUser m);
	
	 List<StafUser> getAllStafUser();

	 
	 StafUser getStafUserById(int stafuser_id);
	 String editStafUser(StafUser m);
	  void deleteStafUser(int stafuser_id);
}
