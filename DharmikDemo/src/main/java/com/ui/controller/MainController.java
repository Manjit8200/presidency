package com.ui.controller;

import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ui.dao.MasterMemberRegisterDAO;

import com.ui.model.MasterMemberRegister;


@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	

	@GetMapping(value = "/")
	public String login(Locale locale, Model model, HttpSession session) {
		logger.info("LOGIN PAGE");

		return "index";
	}

	@GetMapping(value = "/managePrc")
	public String Adminlogin(Locale locale, Model model, HttpSession session) {
		logger.info("Admin LOGIN PAGE");
		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/index";
		}
		return "Admin/dashboard";
	}

	@GetMapping(value = "/managePrc/dashboard")
	public String admindashboard(Locale locale, Model model, HttpSession session) {
		logger.info("Admin Dashboard");
		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/index";
		}
		return "Admin/dashboard";
	}

	@RequestMapping(value = "/managePrc/logoutadmin", method = RequestMethod.GET)
	public String logoutadmin(Locale locale, Model model, HttpSession session) {
		logger.info("##### ADMIN LOGOUT #####");
		try {
			if (session.getAttribute("adminuserid") != null
					|| Integer.parseInt(session.getAttribute("adminuserid").toString()) != 0) {
				session.setAttribute("adminuserid", null);
				session.setAttribute("adminusername", null);
				session.setAttribute("adminusertypeid", null);
				session.setAttribute("adminemailid", null);
				session.setAttribute("adminmobileno", null);
				return "Admin/index";
			}
		} catch (Exception e) {
			return "Admin/index";
		}
		return "Admin/index";
	}

	@GetMapping(value = "/managePrc/addUser")
	public String adminAddUser(Locale locale, Model model, HttpSession session) {
		logger.info("Admin add user");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/index";
		}

		return "Admin/addUser";
	}

	@GetMapping(value = "/managePrc/plan_master")
	public String MasterPlan(Locale locale, Model model, HttpSession session) {
		logger.info("Admin add Master Plan");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/index";
		}

		return "Admin/plan_master";
	}

	@GetMapping(value = "/managePrc/pos")
	public String pos(Locale locale, Model model, HttpSession session) {
		logger.info("Admin POS");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/index";
		}

		return "Admin/pos";
	}

	@GetMapping(value = "/managePrc/category")
	public String category(Locale locale, Model model, HttpSession session) {
		logger.info("Admin add category");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/index";
		}

		return "Admin/category";
	}

	@GetMapping(value = "/managePrc/sub_category")
	public String subcategory(Locale locale, Model model, HttpSession session) {
		logger.info("Admin add product");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/index";
		}

		return "Admin/sub_category";
	}

	@GetMapping(value = "/managePrc/product")
	public String product(Locale locale, Model model, HttpSession session) {
		logger.info("Admin add product");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/index";
		}

		return "Admin/product";
	}

	@GetMapping(value = "/managePrc/type")
	public String type(Locale locale, Model model, HttpSession session) {
		logger.info("Admin add type");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/type";
		}

		return "Admin/type";
	}

	@GetMapping(value = "/managePrc/EditUser")
	public String EditUser(Locale locale, Model model, HttpSession session) {
		logger.info("EditUser add ");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/type";
		}

		return "Admin/EditUser";
	}

	@GetMapping(value = "/managePrc/generateCard")
	public String generateCard(Locale locale, Model model, HttpSession session) {
		logger.info("generateCard add ");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/type";
		}

		return "Admin/generateCard";
	}

	@GetMapping(value = "/managePrc/location")
	public String location(Locale locale, Model model, HttpSession session) {
		logger.info("location add ");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/location";
		}

		return "Admin/location";
	}

	@GetMapping(value = "/managePrc/slider")
	public String slider(Locale locale, Model model, HttpSession session) {
		logger.info("slider add ");

		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/location";
		}

		return "Admin/slider";
	}
	@GetMapping(value = "/managePrc/stafuser")
	public String stafUser(Locale locale, Model model, HttpSession session) {
		logger.info("Staf add ");
		if (session.getAttribute("adminuserid") == null
				|| Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
			return "Admin/stafuser";
		}
	
		return "Admin/stafuser";
	}
}
