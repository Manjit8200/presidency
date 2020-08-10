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

import com.ui.dao.MemberFamilyRegisterDAO;
import com.ui.dao.MemberNomineeDetailsDAO;
import com.ui.model.Location;
import com.ui.model.MasterMemberRegister;
import com.ui.model.MemberNomineeDetails;
import com.ui.model.Product;

@RestController
public class MemberNomineeDetailsController {
	
	@Autowired
	MemberFamilyRegisterDAO memberFamilyRegisterDAO;
	
	@Autowired
	MemberNomineeDetailsDAO memberNomineeDetailsDAO;
	
	
	  private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanRegisterController.class);

	@PostMapping("addNomineeDetails")
    public String addMasterPlan(@RequestBody MemberNomineeDetails memberNomineeDetails, HttpServletRequest request, HttpSession session)
 
    {
		 logger.info("***** Add  MemberNomineeDetails Register  *****");
        String result = "";
        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
        System.out.println("============================================================="+userid);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = request.getRemoteAddr();
        }

        String s = "y";
        
        int member_id = memberFamilyRegisterDAO.getMemberLastId();
       
        memberNomineeDetails.setMember_id(member_id);
        System.out.println("////////////////////////Controller////////////"+member_id);
        memberNomineeDetails.setCreatedBy(userid);
        memberNomineeDetails.setIpAddress(ip);
        memberNomineeDetails.setStatus(s);
    	session.setAttribute("member_id", String.valueOf(member_id));
        
        result = memberNomineeDetailsDAO.addMemberNomineeDetails(memberNomineeDetails);
        
		return result;
        
        
    }
	
	
	@GetMapping(value = "getNomineeMemberId")
	public MemberNomineeDetails getMember(int nominee_id, HttpServletRequest request) {
		logger.info("***** getNomineeMemberId*****");
		return memberNomineeDetailsDAO.getMemberNomineeById(nominee_id);
	}
	
	@GetMapping(value = "getAllNomineeMember")
	  public List<MemberNomineeDetails> getAllNomineeMemberId(int member_id,HttpServletRequest request) {
	      logger.info("***** getAllProductName*****");
	      return memberNomineeDetailsDAO.NomineeDetails(member_id);
	  }
	
	 @PostMapping(value = "editNomineeMember")
	  public String editBatch(@RequestBody MemberNomineeDetails memberNomineeDetails, HttpSession session, HttpServletRequest request,
	          HttpServletResponse response) {
	      logger.info("***** EDIT MemberNomineeDetails *****");
	      String result = "";

	      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
	      String ipaddress = request.getHeader("X-FORWARDED-FOR");
	      
	      if (ipaddress == null) {
	          ipaddress = request.getRemoteAddr();
	      }
	      String s = "y";
	      memberNomineeDetails.setCreatedBy(id);
	      memberNomineeDetails.setIpAddress(ipaddress);
	      memberNomineeDetails.setStatus(s);

	    
	        result = memberNomineeDetailsDAO.editMemberNomineeDetails(memberNomineeDetails);
	      
	      return result;
	  }
	 @DeleteMapping(value = "deleteNomineeMember")
	  public void delete(int nominee_id) {
	      logger.info("***** deleteNomineeMember *****");
	      memberNomineeDetailsDAO.deleteMemberNomineeDetails(nominee_id);
	  }
	 
		@PostMapping("addNomineeDetailsUpdate")
	    public String addember(@RequestBody MemberNomineeDetails memberNomineeDetails, HttpServletRequest request, HttpSession session)
	 
	    {
			 logger.info("***** Add  MemberNomineeDetails Register  *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }

	        String s = "y";
	        
	       
	       
	    
	        memberNomineeDetails.setCreatedBy(userid);
	        memberNomineeDetails.setIpAddress(ip);
	        memberNomineeDetails.setStatus(s);
	    
	        
	        result = memberNomineeDetailsDAO.addMemberNomineeDetails(memberNomineeDetails);
	        
			return result;
	        
	        
	    }
		
	

}
