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
import com.ui.model.Location;
import com.ui.model.MasterChoice;

@RestController
public class MasterChoiceController {

	@Autowired
	MasterChoiceDAO masterChoiceDAO;
	
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
		@PostMapping("addMasterChoice")
	    public String addMasterPlan(@RequestBody MasterChoice masterChoice, HttpServletRequest request, HttpSession session)
	 
	    {
			 logger.info("***** Add addMasterChoice *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }

	        String s = "y";

	        masterChoice.setCreatedBy(userid);
	        masterChoice.setIpAddress(ip);
	        masterChoice.setStatus(s);

	        result = masterChoiceDAO.addMasterChoice(masterChoice);
	  
	        return result;
	    }
	
		
		 @GetMapping(value = "getAllMasterChoice")
		  public List<MasterChoice> getAllMasterChoice(HttpServletRequest request) {
		      logger.info("***** getAllMasterChoice*****");
		      return masterChoiceDAO.getAllMasterChoice();
		  }
	
	
}
