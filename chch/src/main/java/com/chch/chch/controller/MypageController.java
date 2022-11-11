package com.chch.chch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping("mypageMain")
	   public String mypageMain() {
	      return "/myPage/mypageMain";
	   }
}
