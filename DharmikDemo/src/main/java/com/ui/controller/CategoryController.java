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

import com.ui.dao.CategoryDAO;
import com.ui.model.Category;
import com.ui.model.Location;


@RestController
public class CategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	
	 
	 @PostMapping("addCategory")
	    public String addCategory(@RequestBody Category category, HttpServletRequest request, HttpSession session)
	 
	    {
			 logger.info("***** Add addCategory  *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }

	        String s = "y";

	        category.setCreatedBy(userid);
	        category.setIpAddress(ip);
	        category.setStatus(s);

	        result = categoryDAO.addCategory(category);
	  
	        return result;
	    }
	 
	 @GetMapping(value = "getAllCategoryName")
	  public List<Category> getAllLocationName(HttpServletRequest request) {
	      logger.info("***** getAllCategoryName*****");
	      return categoryDAO.getAllCategory();
	  }
	 
	 @GetMapping(value = "/getCategoryById")
	  public Category getCategoryById(int category_id, HttpServletRequest request) {
	      logger.info("***** GET getCategoryById *****");
	      return categoryDAO.getCategoryById(category_id);
	  }
	 
	 @PostMapping(value = "editCategoryName")
	  public String editBatch(@RequestBody Category category, HttpSession session, HttpServletRequest request,
	          HttpServletResponse response) {
	      logger.info("***** editCategoryName *****");
	      String result = "";

	      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
	      String ipaddress = request.getHeader("X-FORWARDED-FOR");
	      
	      if (ipaddress == null) {
	          ipaddress = request.getRemoteAddr();
	      }
	      String s = "y";
	      category.setCreatedBy(id);
	      category.setIpAddress(ipaddress);
	      category.setStatus(s);

	    
	        result = categoryDAO.editCategory(category);
	      
	      return result;
	  }
	 
	 @DeleteMapping(value = "deleteCategory")
	  public void delete(int category_id) {
	      logger.info("***** DELETE Category Name *****");
	      categoryDAO.deleteCategory(category_id);
	  }
	 
}
