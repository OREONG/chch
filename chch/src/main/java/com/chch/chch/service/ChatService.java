package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Chat;

public interface ChatService {

	List<Chat> chatMemberList(String id);

	List<Chat> firstChatList(int room_no, String id);

	int insertChat(Chat chat);

	String lastMessage(int room_no);

	String selectRoomName(int room_no, String id);

	List<Chat> roomList(int room_no, String id);

	int currentLastRoom();

	void insertRoom(Chat chat);

	List<Chat> selectRoomMember(int room_no);

}
