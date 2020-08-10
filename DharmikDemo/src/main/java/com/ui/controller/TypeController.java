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

import com.ui.dao.TypeDAO;
import com.ui.model.SubCategory;
import com.ui.model.Type;

@RestController
public class TypeController {
	

	@Autowired
	TypeDAO typeDAO;
	
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
	 @PostMapping("addType")
	    public String addSubCategory(@RequestBody Type type, HttpServletRequest request, HttpSession session)
	 
	    {
			 logger.info("***** addType *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }

	        String s = "y";

	        type.setCreatedBy(userid);
	        type.setIpAddress(ip);
	        type.setStatus(s);

	        result = typeDAO.addType(type);
	  
	        return result;
	    }
	 
	 
	 @GetMapping(value = "/getAllTypeName")
	  public List<Type> getType(HttpServletRequest request) {
	      logger.info("***** getAllTypeName*****");
	      return typeDAO.getAllType();
	  }
	 
	 @GetMapping(value = "/getTypeById")
	  public Type getTypeById(int type_id, HttpServletRequest request) {
	      logger.info("*****  getTypeById *****");
	      return typeDAO.getTypeById(type_id);
	  }
	 
	 
	 @PostMapping(value = "editTypeName")
	  public String editBatch(@RequestBody Type type, HttpSession session, HttpServletRequest request,
	          HttpServletResponse response) {
	      logger.info("***** editTypeName *****");
	      String result = "";

	      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
	      String ipaddress = request.getHeader("X-FORWARDED-FOR");
	      
	      if (ipaddress == null) {
	          ipaddress = request.getRemoteAddr();
	      }
	      String s = "y";
	      type.setCreatedBy(id);
	      type.setIpAddress(ipaddress);
	      type.setStatus(s);

	    
	        result = typeDAO.editType(type);
	      
	      return result;
	  }
	 
	 @DeleteMapping(value = "deleteType")
	  public void delete(int type_id) {
	      logger.info("***** DELETE Type Name *****");
	      typeDAO.deleteTypey(type_id);
	  }
}
