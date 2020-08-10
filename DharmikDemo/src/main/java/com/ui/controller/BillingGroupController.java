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

import com.ui.dao.BillingGroupDAO;
import com.ui.model.BillingGroup;


@RestController
public class BillingGroupController {
	
	
	@Autowired
	BillingGroupDAO billingGroupDAO;
	
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
	@PostMapping("addBillingGroup")
    public String addMasterPlan(@RequestBody BillingGroup billingGroup, HttpServletRequest request, HttpSession session)
 
    {
		 logger.info("***** Add billingGroup *****");
        String result = "";
        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
        System.out.println("============================================================="+userid);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = request.getRemoteAddr();
        }

        String s = "y";

        billingGroup.setCreatedBy(userid);
        billingGroup.setIpAddress(ip);
        billingGroup.setStatus(s);

        result = billingGroupDAO.addBillingGroup(billingGroup);
  
        return result;
    }

	
	 @GetMapping(value = "getAllBillingGroup")
	  public List<BillingGroup> getAllBillingGroup(HttpServletRequest request) {
	      logger.info("***** GETgetAllLocationName*****");
	      return billingGroupDAO.getAllBillingGroupe();
	  }


}
