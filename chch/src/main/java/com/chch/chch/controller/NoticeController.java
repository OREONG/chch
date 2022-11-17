package com.chch.chch.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chch.chch.model.Chat;
import com.chch.chch.service.ChatService;
import com.chch.chch.service.InquiryService;

@Controller
public class NoticeController {
	@Autowired
	private ChatService cs;
	
	@Autowired
	private InquiryService ins;
	
	@RequestMapping("notice")
	public String notice (HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute(id);
		return "/notice/nolay/notice";
	}
	
	@RequestMapping(value = "loadUnreadChat", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String loadUnreadChat(String id, HttpSession session, Model model) {
		
//		unread 카운트 가져오기
		List<Chat> myRoom = cs.selectMyRoom(id);
		
		System.out.println("myRoom : "+myRoom);
		
		int sum1 = 0;
		
		for (int i = 0; i < myRoom.size(); i++) {
			sum1 += cs.loadUnreadChat(id, myRoom.get(i).getRoom_no());
		}
		
		String sum = String.valueOf(sum1);
		
		return sum;
	}
	
	@RequestMapping(value = "loadUnread", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String loadUnread(String id, HttpSession session, Model model) {
		
		List<Chat> myRoom = cs.selectMyRoom(id);
		
		int unreadChatCount = 0;
		for (int i = 0; i < myRoom.size(); i++) {
			unreadChatCount += cs.loadUnreadChat(id, myRoom.get(i).getRoom_no());
		}
		
		int unreadInquiryCount = ins.unreadInquiryCount(id);
		
		int result = unreadChatCount + unreadInquiryCount;
		
		String totalCount = String.valueOf(result);
		
		return totalCount;
	}
	
	
	@RequestMapping("noticeMain")
	public String noticeMain (HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		model.addAttribute(id);
		return "/notice/noticeMain";
	}
}
