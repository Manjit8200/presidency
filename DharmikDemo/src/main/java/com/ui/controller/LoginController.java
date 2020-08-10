package com.ui.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.LoginDAO;

import com.ui.model.User;

@RestController
public class LoginController {
    @Autowired
    LoginDAO loginDAO;

    User user;
    
     
    
  private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

  
  @PostMapping(value = "checkLogin")
  public String checkLogin(String email, String password, String loggedin, HttpSession session,
          HttpServletResponse response) {
      logger.info("***** CHECK LOGIN *****");

      User user = null;

      user = loginDAO.checkLogin(email, password);

    if (user != null && user.getUser_id() == 1) {
          session.setAttribute("adminuserid", user.getUser_id());
          session.setAttribute("adminusername", user.getUsername());
       
          return "Success";
      } else {
          return "Fail";
      }
  }

}
