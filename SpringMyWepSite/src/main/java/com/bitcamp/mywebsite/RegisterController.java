package com.bitcamp.mywebsite;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import BeanModel.userinfo;
import Services.RegisterInsertService;
import Services.ServiceException;

@Controller
public class RegisterController {
	
	@RequestMapping("/GoRegister")
	public String goRegister() {
		return "registerForm";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String Register(userinfo info) throws ServiceException {
		int resultCnt = 0;
		RegisterInsertService register = RegisterInsertService.getInstance();
		resultCnt=register.register(info);
		return "index";
	}
}
