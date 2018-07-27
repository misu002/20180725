package com.bitcamp.mywebsite;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import BeanModel.MemberInfo;
import Services.GetIdService;
import Services.ServiceException;


@Controller
public class LoginController {
	@Autowired
    GetIdService getIdService;
	
	@RequestMapping("/login")
	public ModelAndView goLogin() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("loginForm");
		return mav;
	}
	
	@RequestMapping("/LoginAccess")
	public String LoginAction(MemberInfo info, HttpSession session) throws ServiceException {
        String id=info.getId();
        String pw=info.getPassword();        
        String DBpw=getIdService.findPw(id);		
		if(pw.equals(DBpw)) {
		session.setAttribute("id",info.getId());
		}else {
			
		}
		return "index";
	}
	
	@RequestMapping("/Logout")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
}
