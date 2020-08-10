package com.ui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.MasterChoiceDAO;
import com.ui.dao.MasterClubNameDAO;
import com.ui.model.MasterChoice;
import com.ui.model.MasterClubName;

@RestController
public class MasterClubNameController {

	

	@Autowired
	 MasterClubNameDAO masterClubNameDAO;
	
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
		@PostMapping("addMasterClubName")
	    public String addMasterPlan(@RequestBody  MasterClubName  masterClubName, HttpServletRequest request, HttpSession session)
	 
	    {
			 logger.info("***** addMasterClubName *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }

	        String s = "y";

	        masterClubName.setCreatedBy(userid);
	        masterClubName.setIpAddress(ip);
	        masterClubName.setStatus(s);

	        result = masterClubNameDAO.addMasterClubName(masterClubName);
	  
	        return result;
	    }
	
		
		 @GetMapping(value = "getAllMasterClubName")
		  public List<MasterClubName> getAllMasterClubName(HttpServletRequest request) {
		      logger.info("***** getAllMasterClubName*****");
		      return masterClubNameDAO.getAllMasterClubName();
		  }
}
