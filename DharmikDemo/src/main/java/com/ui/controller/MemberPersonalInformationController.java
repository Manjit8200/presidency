package com.ui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.MemberFamilyRegisterDAO;
import com.ui.dao.MemberPersonalInformationDAO;
import com.ui.model.MemberNomineeDetails;
import com.ui.model.MemberPayment;
import com.ui.model.MemberPersonalInformation;
@RestController
public class MemberPersonalInformationController {

	  private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanRegisterController.class);
		
	  	@Autowired
	  	MemberPersonalInformationDAO memberPersonalInformationDAO;
	  	
		@Autowired
		MemberFamilyRegisterDAO memberFamilyRegisterDAO;
	  
	@PostMapping("/addMemberPersonalChoice")
  public String addMasterPlan(int members_family_id,int member_family_type_of_relation, String member_family_choices,
			String status,String createdDate,
 		String ipAddress, HttpServletRequest request, HttpSession session)

  {
		 logger.info("***** Add addMemberPersonalChoice  *****");
      String result = "";
      int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
      System.out.println("============================================================="+userid);
      String ip = request.getHeader("X-FORWARDED-FOR");
      if (ip == null) {
          ip = request.getRemoteAddr();
      }
      String s = "y";
      int member_id = memberFamilyRegisterDAO.getMemberLastId();
     
      MemberPersonalInformation m = new MemberPersonalInformation();
    
      m.setMember_id(member_id);
      m.setMembers_family_id(members_family_id);
        m.setMember_family_type_of_relation(member_family_type_of_relation);
        m.setMember_family_choices(member_family_choices);
      
        m.setCreatedBy(userid);
        m.setIpAddress(ip);
        m.setStatus(s);
        
		session.setAttribute("member_id", String.valueOf(member_id));
		//System.out.println("//////////////////////memberPersonalChoicecontroller//////////////////////////////////"+member_id);
      result = memberPersonalInformationDAO.addMemberPersonalChoice(m);
     
     

      return result;
  }
	
	
	
	@PostMapping("/addMemberPersonalInformation1")
	 public String addMasterPlan1(int member_profession,int
			  member_other_Club_membership, String member_club_name,String
			  member_marriage_anniversary, int
			  member_house_owend, String status,String createdDate, String ipAddress,
			  HttpServletRequest request, HttpSession session) {
				
		 logger.info("*****  addMemberPersonalInformation1  *****");
	      String result1 = "";
	      int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	      System.out.println("============================================================="+userid);
	      String ip = request.getHeader("X-FORWARDED-FOR");
	      if (ip == null) {
	          ip = request.getRemoteAddr();
	      }
	      String s = "y";
	      int member_id = memberFamilyRegisterDAO.getMemberLastId();
	      MemberPersonalInformation m1 = new MemberPersonalInformation();
	        m1.setMember_profession(member_profession);
	        m1.setMember_other_Club_membership(member_other_Club_membership);
	        m1.setMember_club_name(member_club_name);
	        m1.setMember_house_owend(member_house_owend);
	        m1.setMember_marriage_anniversary(member_marriage_anniversary);
	        m1.setMember_id(member_id);
	      	m1.setCreatedBy(userid);
	        m1.setIpAddress(ip);
	        m1.setStatus(s);
	        
			session.setAttribute("member_id", String.valueOf(member_id));
		result1=memberPersonalInformationDAO.addMemberPersonalInformation1(m1);
			
		 return result1;
		 
		 
		 
	 }
	@GetMapping(value = "getAllMemberChoice")
	  public List<MemberPersonalInformation> getAllMemberChoice(int member_id,HttpServletRequest request) {
	      logger.info("***** getAllMemberChoice*****");
	      return memberPersonalInformationDAO.getAllMemberPersonalInformation(member_id);
	  }

	@GetMapping(value = "getAllMemberInfo")
	  public MemberPersonalInformation getAllMemberInfo(int member_id,HttpServletRequest request) {
	      logger.info("***** getAllMemberChoice*****");
	      return memberPersonalInformationDAO.getMemberPersonalInfo(member_id);
	  }

	 @PostMapping(value = "editMemberInfo")
	  public String editBatch(@RequestBody MemberPersonalInformation memberInfo, HttpSession session, HttpServletRequest request,
	          HttpServletResponse response) {
	      logger.info("***** EDIT memberInfo *****");
	      String result = "";

	      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
	      String ipaddress = request.getHeader("X-FORWARDED-FOR");
	      
	      if (ipaddress == null) {
	          ipaddress = request.getRemoteAddr();
	      }
	      String s = "y";
	      memberInfo.setCreatedBy(id);
	      memberInfo.setIpAddress(ipaddress);
	      memberInfo.setStatus(s);

	    
	        result = memberPersonalInformationDAO.editMemberPersonalInformation(memberInfo);
	      
	      return result;
	  }
}
