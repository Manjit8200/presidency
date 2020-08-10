package com.ui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.LocationDAO;
import com.ui.model.Location;
import com.ui.model.MasterMemberPlan;

@RestController
public class LocationController {

	@Autowired
	LocationDAO locationDao;
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
	@PostMapping("addLocation")
    public String addMasterPlan(@RequestBody Location location, HttpServletRequest request, HttpSession session)
 
    {
		 logger.info("***** Add Location *****");
        String result = "";
        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
        System.out.println("============================================================="+userid);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = request.getRemoteAddr();
        }

        String s = "y";

        location.setCreatedBy(userid);
        location.setIpAddress(ip);
        location.setStatus(s);

        result = locationDao.addLocation(location);
  
        return result;
    }
	
	 @GetMapping(value = "getAllLocationName")
	  public List<Location> getAllLocationName(HttpServletRequest request) {
	      logger.info("***** GETgetAllLocationName*****");
	      return locationDao.getAllLocation();
	  }
	 
	 @GetMapping(value = "/getLocationById")
	  public Location getBatchTimingsById(int location_id, HttpServletRequest request) {
	      logger.info("***** GET getLocationById *****");
	      return locationDao.getLocationById(location_id);
	  }
	 
	 
	 @PostMapping(value = "editLocationName")
	  public String editBatch(@RequestBody Location location, HttpSession session, HttpServletRequest request,
	          HttpServletResponse response) {
	      logger.info("***** editLocationName *****");
	      String result = "";

	      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
	      String ipaddress = request.getHeader("X-FORWARDED-FOR");
	      
	      if (ipaddress == null) {
	          ipaddress = request.getRemoteAddr();
	      }
	      String s = "y";
	      location.setCreatedBy(id);
	      location.setIpAddress(ipaddress);
	        location.setStatus(s);

	    
	        result = locationDao.editLocation(location);
	      
	      return result;
	  }
	 @DeleteMapping(value = "deleteLocation")
	  public void delete(int location_id) {
	      logger.info("***** DELETE location Name *****");
	      locationDao.deleteLocation(location_id);
	  }
	  
}
