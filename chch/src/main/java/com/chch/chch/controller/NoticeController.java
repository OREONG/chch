package com.chch.chch.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.service.ChatService;

@Controller
public class NoticeController {
	@SuppressWarnings("unused")
	@Autowired
	private ChatService cs;
	
	@RequestMapping("notice")
	public String notice (HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute(id);
		return "/notice/notice";
	}
}
