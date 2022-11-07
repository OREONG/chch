package com.chch.chch.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chch.chch.model.Chat;
import com.chch.chch.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService cs;
	
//	SB 대화방 목록
	@RequestMapping("chatMemberList")
	public String chatList(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Chat> chatMemberList = cs.chatMemberList(id);

		int room_no = 0;
		String lastMessage = "";
		String room_name = "";
		
		for (int i = 0; i < chatMemberList.size(); i++) {
			room_no = chatMemberList.get(i).getRoom_no();
			lastMessage = cs.lastMessage(room_no);
			List<Chat> roomList = cs.roomList(room_no, id);
			room_name = cs.selectRoomName(room_no, id);
			
			if (room_name == null || room_name == "") {
				room_name = roomList.get(0).getId();
				for (int j = 1; j < roomList.size(); j++) {
					room_name = room_name + ", " + roomList.get(j).getId();
				}
			}
			room_name = subStrByte(room_name, 50);
			lastMessage = subStrByte(lastMessage, 50);
			chatMemberList.get(i).setRoom_name(room_name);
			chatMemberList.get(i).setChat_content(lastMessage);
			
			Date date = new Date();
			Calendar calToday = Calendar.getInstance();
			calToday.setTime(date);
			Calendar calSendDay = Calendar.getInstance();
			calSendDay.setTime(chatMemberList.get(i).getSend_time());
			int diffDays = calToday.get(Calendar.DAY_OF_YEAR)-calSendDay.get(Calendar.DAY_OF_YEAR);
			chatMemberList.get(i).setDiffDays(diffDays);
		}
		
		model.addAttribute("chatMemberList", chatMemberList);
		return "/chat/chatMemberList";
	}
	
//	SB 대화 화면
	@RequestMapping("chat")
	public String chat(Model model, HttpSession session, int room_no, String room_name) {
		String id = (String) session.getAttribute("id");
		session.setAttribute("room_no", room_no);
		List<Chat> firstChatList = cs.firstChatList(room_no, id);
		Date date = new Date();
		model.addAttribute("room_name", room_name);
		model.addAttribute("firstChatList", firstChatList);
		model.addAttribute("room_no", room_no);
		model.addAttribute("id", id);
		model.addAttribute("date", date);

		return "/chat/chat";
	}

//	SB 메세지 보내기
	@RequestMapping(value = "saveMessage", produces = "text/html;charset=utf-8")
	public String saveMessage(@RequestParam("id") String id, @RequestParam("msg") String msg,
			@RequestParam("room_no") String room_no, HttpSession session, Chat chat, Model model) {

		chat.setId(id);
		chat.setChat_content(msg);
		chat.setRoom_no(Integer.parseInt(room_no));

		int result = cs.insertChat(chat);

		model.addAttribute("result", result);

		return "/chat/chat";
	}
	
//	SB 한글 string을 cutlen 길이만큼 2byte 단위로 끊고 뒤에 '...' 붙이기
	public static String subStrByte(String str, int cutlen) {
		if (!str.isEmpty()) {
			str = str.trim();
			if (str.getBytes().length <= cutlen) {
				return str;
			} else {
				StringBuffer sbStr = new StringBuffer(cutlen);
				int nCnt = 0;
				for (char ch : str.toCharArray()) {
					nCnt += String.valueOf(ch).getBytes().length;
					if (nCnt > cutlen)
						break;
					sbStr.append(ch);
				}
				return sbStr.toString() + "...";
			}
		} else {
			return "";
		}
	}

}
