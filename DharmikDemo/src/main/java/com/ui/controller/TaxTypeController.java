package com.ui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.TaxTypeDAO;

import com.ui.model.TaxType;

@RestController
public class TaxTypeController {

	@Autowired
	TaxTypeDAO taxTypeDAO;
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
			
	
	@GetMapping(value = "getMasterTaxName")
	  public List<TaxType> getMasterTaxName(HttpServletRequest request) {
	      logger.info("***** getMasterTaxName*****");
	      return taxTypeDAO.getAllTaxType();
	  }
	
	
	
}
