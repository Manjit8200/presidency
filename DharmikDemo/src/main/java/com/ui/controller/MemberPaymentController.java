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

import com.ui.dao.MemberPaymentDAO;
import com.ui.model.MemberPayment;
import com.ui.model.Product;

@RestController
public class MemberPaymentController {

	
	@Autowired
	MemberPaymentDAO memberPaymentDAO;

	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
	 

		@PostMapping("addMemberPayment")
	    public int addProduct(@RequestBody  MemberPayment  memberPayment, HttpServletRequest request, HttpSession session)
	 
	    {
			 logger.info("***** addMemberPayment  *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }

	        String s = "y";

	        memberPayment.setCreatedBy(userid);
	        memberPayment.setIpAddress(ip);
	        memberPayment.setStatus(s);
	        int member_id = memberPaymentDAO.getLastPr();
	        memberPayment.setMember_id(member_id);
	
	        result = memberPaymentDAO.addMemberPayment(memberPayment);
	    	int id = 0;
	    	
	 
	        if (result.equals("Success")) {

				logger.info("***** Last Member Id Id Got it inpayment*****");

				id = memberPaymentDAO.getLastPr();		
			}
			return id;
	       
	    }
		

		@PostMapping("addMemberPaymentUpdatetime")
	    public String addProduct1(@RequestBody  MemberPayment  memberPayment, HttpServletRequest request, HttpSession session)
	 
	    {
			 logger.info("***** addMemberPaymentUpdatetime  *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }

	        String s = "y";

	        memberPayment.setCreatedBy(userid);
	        memberPayment.setIpAddress(ip);
	        memberPayment.setStatus(s);

	
	        result = memberPaymentDAO.addMemberPayment(memberPayment);
	    
	        
	        return result;
	       
	    }
		
		@PostMapping("/addMemberPaymentTax")
		 public String addProductTax(int member_id,int tax_type,float tax_value, String status,String createdDate, String ipAddress,
				  HttpServletRequest request, HttpSession session) {
					
			 logger.info("*****  addMemberPaymentTax  *****");
		      String result1 = "";
		      int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
		      System.out.println("============================================================="+userid);
		      String ip = request.getHeader("X-FORWARDED-FOR");
		      if (ip == null) {
		          ip = request.getRemoteAddr();
		      }
		      String s = "y";
		      
		      MemberPayment m1 = new MemberPayment();
		      	
		       	m1.setTax_type(tax_type);
		       	m1.setTax_value(tax_value);
		       	m1.setMember_id(member_id);
		      	m1.setCreatedBy(userid);
		        m1.setIpAddress(ip);
		        m1.setStatus(s);
		        m1.setMember_payment_id(memberPaymentDAO.getLastPaymentId());
				
			result1=memberPaymentDAO.addMemberPaymentTaxData(m1);
	
	        
	     
	       	
			 return result1;
			 
		}
		
		 
		 @PostMapping(value = "editMemberPayment")
		  public String editBatch(@RequestBody MemberPayment memberPayment, HttpSession session, HttpServletRequest request,
		          HttpServletResponse response) {
		      logger.info("*****editMemberPayment *****");
		      String result = "";

		      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
		      String ipaddress = request.getHeader("X-FORWARDED-FOR");
		      
		      if (ipaddress == null) {
		          ipaddress = request.getRemoteAddr();
		      }
		      String s = "y";
		   //  System.out.println("//////////////////////////////___++++"+memberPayment.getMember_id()); 
		     memberPayment.setCreatedBy(id);
		     memberPayment.setIpAddress(ipaddress);
		     memberPayment.setStatus(s);

		    
		        result = memberPaymentDAO.editMemberPayment(memberPayment);
		      
		      return result;
		  }
		 
		 @DeleteMapping(value = "deleteMemberTax")
		  public void deleteTax(int member_tax_id) {
		      logger.info("***** DELETE Member TAx Name *****");
		      memberPaymentDAO.deleteMemberPaymenttTax(member_tax_id);
		  }
		 
			@GetMapping(value = "getAllMemberTaxName")
			  public List<MemberPayment> getAllMemberPaymentTaxName(int member_id,HttpServletRequest request) {
			      logger.info("***** getAllMemberPaymentTaxName*****");
			      return memberPaymentDAO.getAllMemberPaymentTax(member_id);
			  }
			
	
			
			@GetMapping(value = "getAllMemberPaymentID")
			  public List<MemberPayment> getAllMemberPayment(int member_id,HttpServletRequest request) {
			      logger.info("***** getAllMemberPayment*****");
			      return memberPaymentDAO.getAllMemberPayment(member_id);
			  }
			
			
			@GetMapping(value = "getAllMemberPaymentById")
			  public MemberPayment getAllMemberPaymentById(int member_payment_id,HttpServletRequest request) {
			      logger.info("***** getAllMemberPaymentById*****");
			      return memberPaymentDAO.getMemberPaymentById(member_payment_id);
			  }
			
			 @DeleteMapping(value = "deleteMemberPayment")
			  public void deleteMemberPayment(int member_payment_id) {
			      logger.info("***** DELETE member_payment_*****");
			      memberPaymentDAO.deleteMemberPayment(member_payment_id);
			  }
}
