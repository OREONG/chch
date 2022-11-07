package com.chch.chch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.service.MemberService;

@Controller
public class MemberController {
	
	@SuppressWarnings("unused")
	@Autowired
	private MemberService ms;
	
//	SB 간이 로그인 화면
	@RequestMapping("loginForm")
	public String loginForm() {
		return "/loginForm";
	}
	
//	SB 간이 로그인 실행
	@RequestMapping("login")
	public String login(Model model, HttpSession session, String id) {
		session.setAttribute("id", id);
		return "/login";
	}
	
//	SB 간이 메인 화면
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		return "/main";
	}
	
	
}
