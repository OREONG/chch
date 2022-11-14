package com.chch.chch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.model.Member;
import com.chch.chch.service.MemberService;

@Controller
public class MypageController {
	
	//서비스
	@Autowired
	private MemberService ms;
	
	@RequestMapping("mypageMain")
	   public String mypageMain(HttpSession session, Model model) {
		String id= (String)session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
	    return "/myPage/mypageMain";
	   }
}
