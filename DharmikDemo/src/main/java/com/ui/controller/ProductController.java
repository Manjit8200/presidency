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

import com.ui.dao.ProductDAO;
import com.ui.model.Location;
import com.ui.model.MemberPersonalInformation;
import com.ui.model.Product;

@RestController
public class ProductController {
	
	@Autowired
	ProductDAO productnDao;
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
	
	
	@PostMapping("addProduct")
    public int addProduct(@RequestBody Product product, HttpServletRequest request, HttpSession session)
 
    {
		
	 logger.info("***** Add Product  *****");
        String result = "";
        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
        System.out.println("============================================================="+userid);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = request.getRemoteAddr();
        }

        String s = "y";

        product.setCreatedBy(userid);
        product.setIpAddress(ip);
        product.setStatus(s);
        result = productnDao.addProduct(product);
    	int id = 0;
    	
        if (result.equals("Success")) {

			logger.info("***** Last Member Id Id Got it in PRODUCT *****");

			id = productnDao.getLastPr();

		}
		return id;
       
    }
	@PostMapping("/addProductTax")
	 public String addProductTax(int product_id,int tax_type,float tax_value, String status,String createdDate, String ipAddress,
			  HttpServletRequest request, HttpSession session) {
				
		 logger.info("*****  addProductTax  *****");
	      String result1 = "";
	      int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	      System.out.println("============================================================="+userid);
	      String ip = request.getHeader("X-FORWARDED-FOR");
	      if (ip == null) {
	          ip = request.getRemoteAddr();
	      }
	      String s = "y";
	      
	      Product m1 = new Product();
	      	
	       	m1.setTax_type(tax_type);
	       	m1.setTax_value(tax_value);
	       	m1.setProduct_id(product_id);
	      	m1.setCreatedBy(userid);
	        m1.setIpAddress(ip);
	        m1.setStatus(s);
	        
			
		result1=productnDao.addProductTaxData(m1);
			
		 return result1;
		 
	}
	
	@GetMapping(value = "getAllProductName")
	  public List<Product> getAllProductName(HttpServletRequest request) {
	      logger.info("***** getAllProductName*****");
	      return productnDao.getAllProduct();
	  }
	
	@GetMapping(value = "getAllProductTaxName")
	  public List<Product> getAllProductTaxName(int product_id,HttpServletRequest request) {
	      logger.info("***** getAllProductName*****");
	      return productnDao.getAllProductTax(product_id);
	  }
	
	
	 @GetMapping(value = "/getProductById")
	  public Product getProductById(int product_id, HttpServletRequest request) {
	      logger.info("*****  getProductById *****");
	      return productnDao.getProductById(product_id);
	  }
	 
	 
	 @GetMapping(value = "/getProductTaxById")
	  public Product getProductTaxById(int product_id, HttpServletRequest request) {
	      logger.info("***** GET getProductTaxById *****");
	      return productnDao.getProducTaxtById(product_id);
	  }
	 
	 
	 @PostMapping(value = "editProductName")
	  public String editBatch(@RequestBody Product product, HttpSession session, HttpServletRequest request,
	          HttpServletResponse response) {
	      logger.info("***** EDIT Product *****");
	      String result = "";

	      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
	      String ipaddress = request.getHeader("X-FORWARDED-FOR");
	      
	      if (ipaddress == null) {
	          ipaddress = request.getRemoteAddr();
	      }
	      String s = "y";
	    // System.out.println("//////////////////////////////___++++"+product.getProduct_id()); 
	      product.setCreatedBy(id);
	      product.setIpAddress(ipaddress);
	      product.setStatus(s);

	    
	        result = productnDao.editProduct(product);
	      
	      return result;
	  }
	 
	 
	 @DeleteMapping(value = "deleteProduct")
	  public void delete(int product_id) {
	      logger.info("***** DELETE location Name *****");
	      productnDao.deleteProduct(product_id);
	  }
	 
	 @PostMapping("/InsertProductTax")
	 public String addProductTax1(int product_id,int tax_type,float tax_value, String status,String createdDate, String ipAddress,
			  HttpServletRequest request, HttpSession session) {
				
		 logger.info("*****  addProductTax  *****");
	      String result1 = "";
	      int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	      System.out.println("============================================================="+userid);
	      String ip = request.getHeader("X-FORWARDED-FOR");
	      if (ip == null) {
	          ip = request.getRemoteAddr();
	      }
	      String s = "y";
	      
	      Product m1 = new Product();
	      	
	       	m1.setTax_type(tax_type);
	       	m1.setTax_value(tax_value);
	       	m1.setProduct_id(product_id);
	      	m1.setCreatedBy(userid);
	        m1.setIpAddress(ip);
	        m1.setStatus(s);
	        
			
		result1=productnDao.addProductTaxData(m1);
			
		 return result1;
		 
	}
	 
	 @DeleteMapping(value = "deleteProductTax")
	  public void deleteTax(int product_tax_id) {
	      logger.info("***** DELETE TAx Name *****");
	      productnDao.deleteProductTax(product_tax_id);
	  }
}
