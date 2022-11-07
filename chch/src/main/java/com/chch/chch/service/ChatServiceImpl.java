package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.ChatDao;
import com.chch.chch.model.Chat;

@Service
public class ChatServiceImpl implements ChatService {
	@Autowired
	private ChatDao cd;

	public List<Chat> chatMemberList(String id) {
		return cd.chatMemberList(id);
	}

	public List<Chat> firstChatList(int room_no, String id) {
		return cd.firstChatList(room_no, id);
	}

	public int insertChat(Chat chat) {
		return cd.insertChat(chat);
		
	}

	public String lastMessage(int room_no) {
		return cd.lastMessage(room_no);
	}

	public String selectRoomName(int room_no, String id) {
		return cd.selectRoomName(room_no, id);
	}

	public List<Chat> roomList(int room_no, String id) {
		return cd.roomList(room_no, id);
	}

	@Override
	public int currentLastRoom() {
		return cd.currentLastRoom();
	}

	@Override
	public void insertRoom(Chat chat) {
		cd.insertRoom(chat);
	}
}
