package com.bitcamp.mywebsite;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import BeanModel.MemberInfo;


@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public ModelAndView goLogin() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("loginForm");
		return mav;
	}
	@RequestMapping("/LoginAccess")
	public String LoginAction(MemberInfo info, 
			HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("password") String pw,
			HttpSession session) {
		String userid=request.getParameter("id");
		String userpw=request.getParameter("password");	
		System.out.println("Annotation : "+id+" - "+pw);
		System.out.println("HttpServlet : "+userid+" - "+userpw);
		System.out.println(info);
		session.setAttribute("id",id);
		return "index";
	}
	
	@RequestMapping("/Logout")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
}
