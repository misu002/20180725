package com.bitcamp.mywebsite;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping("Mypage")
	public String getMypage() {
		return "mypage";
	}
}
