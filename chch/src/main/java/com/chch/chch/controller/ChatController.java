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
import com.chch.chch.service.CommunityService;

@Controller
public class ChatController {

	@Autowired
	private ChatService cs;
	
	@Autowired
	private CommunityService coms;
	
//	SB 대화방 목록
	
	@RequestMapping("chatMemberList")
	public String chatList(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Chat> selectMyRoom = cs.selectMyRoom(id);

		int intRoom_no = 0;
		Chat lastMessage = new Chat();
		String room_name = "";
		
		for (int i = 0; i < selectMyRoom.size(); i++) {
			intRoom_no = Integer.parseInt(selectMyRoom.get(i).getRoom_no());
			lastMessage = cs.lastMessage(intRoom_no, id);
			String lastMessageText = lastMessage.getChat_content();
			List<Chat> roomList = cs.roomList(intRoom_no, id);
			room_name = cs.selectRoomName(intRoom_no, id);
			
			if (room_name == null || room_name == "") {
				room_name = roomList.get(0).getId();
				for (int j = 1; j < roomList.size(); j++) {
					room_name = room_name + ", " + roomList.get(j).getId();
				}
			}
			
			room_name = subStrByte(room_name, 50);
			lastMessageText = subStrByte(lastMessageText, 50);
			selectMyRoom.get(i).setRoom_name(room_name);
			selectMyRoom.get(i).setChat_content(lastMessageText);
			selectMyRoom.get(i).setSend_time(lastMessage.getSend_time());
			
			Date date = new Date();
			Calendar calToday = Calendar.getInstance();
			calToday.setTime(date);
			Calendar calSendDay = Calendar.getInstance();
			calSendDay.setTime(lastMessage.getSend_time());
			int diffDays = calToday.get(Calendar.DAY_OF_YEAR)-calSendDay.get(Calendar.DAY_OF_YEAR);
			selectMyRoom.get(i).setDiffDays(diffDays);
			
			selectMyRoom.get(i).setUnread(cs.loadUnreadChat(id, intRoom_no));
			
		}
		
		model.addAttribute("selectMyRoom", selectMyRoom);
		return "/chat/chatMemberList";
	}
	
//	SB 대화 화면
	@RequestMapping("chat")
	public String chat(Model model, HttpSession session, String room_no, String room_name) {
		String id = (String) session.getAttribute("id");
		session.setAttribute("room_no", room_no);
		
		int intRoom_no = Integer.parseInt(room_no);
		
		
		int chatCount = cs.chatCount(intRoom_no, id);
		if (chatCount==0) {
			Chat chat = new Chat();
			chat.setRoom_no(room_no);
			chat.setId(id);
			chat.setChat_content(id+"님이 입장하였습니다");
			
			cs.insertChat(chat);
		}
		
		cs.checkRoom(intRoom_no, id);
		
		int communityCheck = coms.communityCheck(intRoom_no);
		int community_no=0;
		String roomType="";
		if (communityCheck > 0) {
			community_no = coms.selectByRoomNo(intRoom_no);
			roomType="community";
		} else {
			roomType="used";
		}
		
		
		List<Chat> firstChatList = cs.firstChatList(intRoom_no, id);
		Date date = new Date();
		model.addAttribute("room_name", room_name);
		model.addAttribute("firstChatList", firstChatList);
		model.addAttribute("room_no", room_no);
		model.addAttribute("id", id);
		model.addAttribute("date", date);
		model.addAttribute("community_no", community_no);
		model.addAttribute("roomType", roomType);
		
		return "/chat/chat";
	}

//	SB 메세지 보내기
	@RequestMapping(value = "saveMessage", produces = "text/html;charset=utf-8")
	public String saveMessage(@RequestParam("id") String id, @RequestParam("msg") String msg,
			@RequestParam("room_no") String room_no, HttpSession session, Chat chat, Model model) {

		chat.setId(id);
		chat.setChat_content(msg);
		chat.setRoom_no(room_no);

		int result = cs.insertChat(chat);

		model.addAttribute("result", result);

		return "/chat/chat";
	}
	
	@RequestMapping(value = "checkRoom", produces = "text/html;charset=utf-8")
	public String checkRoom(@RequestParam("id") String id, @RequestParam("room_no") String room_no,
			HttpSession session, Chat chat, Model model) {
		int intRoom_no = Integer.parseInt(room_no); 
		cs.checkRoom(intRoom_no, id);
		
		return "/header";
	}
	
	@RequestMapping("usedChat")
	public String usedChat(Model model, HttpSession session, int used_no) {
		String id = (String) session.getAttribute("id");
		int checkExistingChat = cs.checkExistingChat(used_no, id);
		
		if (checkExistingChat == 0 ) {
//			새로운 채팅방 생성
//			생성된 채팅방 번호 확인
		}
		
		return "/chat/usedChat";
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
