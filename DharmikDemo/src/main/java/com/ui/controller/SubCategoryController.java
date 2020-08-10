

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

import com.ui.dao.SubCategoryDAO;
import com.ui.model.Category;
import com.ui.model.Location;
import com.ui.model.SubCategory;

@RestController
public class SubCategoryController {

	
	@Autowired
	SubCategoryDAO subcategoryDAO;
	
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
	 @PostMapping("addSubCategory")
	    public String addSubCategory(@RequestBody SubCategory subcategory, HttpServletRequest request, HttpSession session)
	 
	    {
			 logger.info("***** addSubCategory *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }

	        String s = "y";

	        subcategory.setCreatedBy(userid);
	        subcategory.setIpAddress(ip);
	        subcategory.setStatus(s);

	        result = subcategoryDAO.addSubCategory(subcategory);
	  
	        return result;
	    }
	 
	 @GetMapping(value = "/getAllSubCategoryName")
	  public List<SubCategory> getSubCategory(HttpServletRequest request) {
	      logger.info("***** getAllSubCategoryName*****");
	      return subcategoryDAO.getAllSubCategory();
	  }
	 
	 @GetMapping(value = "/getSubCategoryById")
	  public SubCategory getSubCategoryById(int sub_category_id, HttpServletRequest request) {
	      logger.info("*****  getSubCategoryById *****");
	      return subcategoryDAO.getSubCategoryById(sub_category_id);
	  }
	 
	 @PostMapping(value = "editSubCategoryName")
	  public String editBatch(@RequestBody SubCategory subcategory, HttpSession session, HttpServletRequest request,
	          HttpServletResponse response) {
	      logger.info("***** editSubCategoryName *****");
	      String result = "";

	      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
	      String ipaddress = request.getHeader("X-FORWARDED-FOR");
	      
	      if (ipaddress == null) {
	          ipaddress = request.getRemoteAddr();
	      }
	      String s = "y";
	      subcategory.setCreatedBy(id);
	      subcategory.setIpAddress(ipaddress);
	      subcategory.setStatus(s);

	    
	        result = subcategoryDAO.editSubCategory(subcategory);
	      
	      return result;
	  }
	 @DeleteMapping(value = "deleteSubcategory")
	  public void delete(int sub_category_id) {
	      logger.info("***** deleteSubcategory *****");
	      subcategoryDAO.deleteSubCategory(sub_category_id);
	  }
	 

}
