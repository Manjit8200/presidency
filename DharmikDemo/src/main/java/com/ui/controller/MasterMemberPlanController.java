
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

import com.ui.dao.MasterMemberPlanDAO;
import com.ui.model.MasterMemberPlan;


@RestController
public class MasterMemberPlanController {
	
	@Autowired
	MasterMemberPlanDAO masterMemberPlanDAO;
	
	  private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	  
	  @GetMapping(value = "/getMasterMemberPlanByPage")
	  public List<MasterMemberPlan> MasterMemberPlanByPage(int pagesize, int startindex, HttpServletRequest request) {
	      logger.info("***** GET getMasterMemberPlanByPage *****");
	      return masterMemberPlanDAO.getsMasterMemberPlanByPage(pagesize, startindex);
	  }
	  
	@PostMapping("addMasterPlan")
    public String addMasterPlan(@RequestBody MasterMemberPlan masterMemberPlan, HttpServletRequest request, HttpSession session)
 
    {
		 logger.info("***** Add Master Plan *****");
        String result = "";
        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
        System.out.println("============================================================="+userid);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = request.getRemoteAddr();
        }

        String s = "y";

        masterMemberPlan.setCreatedBy(userid);
        masterMemberPlan.setIpAddress(ip);
        masterMemberPlan.setStatus(s);

        result = masterMemberPlanDAO.addMasterMemberPlan(masterMemberPlan);
  
        return result;
    }
	  @GetMapping(value = "getAllMemberName")
	  public List<MasterMemberPlan> getAllMemberName(HttpServletRequest request) {
	      logger.info("***** GETgetAllMemberName*****");
	      return masterMemberPlanDAO.getAllMemberName();
	  }
	  @GetMapping(value = "/getAllMemberNameById")
	  public MasterMemberPlan getBatchTimingsById(int plan_id, HttpServletRequest request) {
	      logger.info("***** GET getAllMemberNameById *****");
	      return masterMemberPlanDAO.getMemberById(plan_id);
	  }
	  
	  @PostMapping(value = "editMasterMemberPlan")
	  public String editBatch(@RequestBody MasterMemberPlan masterMemberPlan, HttpSession session, HttpServletRequest request,
	          HttpServletResponse response) {
	      logger.info("***** EDIT Member *****");
	      String result = "";

	      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
	      String ipaddress = request.getHeader("X-FORWARDED-FOR");
	      
	      if (ipaddress == null) {
	          ipaddress = request.getRemoteAddr();
	      }
	      String s = "y";
	      	masterMemberPlan.setCreatedBy(id);
	        masterMemberPlan.setIpAddress(ipaddress);
	        masterMemberPlan.setStatus(s);

	    
	        result = masterMemberPlanDAO.editMasterMemberPlan(masterMemberPlan);
	      
	      return result;
	  }
	  
	  @DeleteMapping(value = "deleteMasterMemberPlan")
	  public void delete(int plan_id) {
	      logger.info("***** DELETE MasterMemberPlan *****");
	      masterMemberPlanDAO.deleteMasterMemberPlan(plan_id);
	  }
	
}
