package com.ui.dao;

import java.util.List;

import com.ui.model.Location;


public interface LocationDAO {
	
	
	public String addLocation(Location m);
	 List<Location> getAllLocation();
	 Location getLocationById(int location_id);
	 String editLocation(Location m);
	  void deleteLocation(int location_id);
	  List<Location> getLocationByPage(int pagesize, int startindex);

}
