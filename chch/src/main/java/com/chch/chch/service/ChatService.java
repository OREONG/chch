package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Chat;

public interface ChatService {

	List<Chat> chatMemberList(String id);

	List<Chat> firstChatList(int room_no, String id);

	int insertChat(Chat chat);

	Chat lastMessage(int room_no, String id);

	String selectRoomName(int room_no, String id);

	List<Chat> roomList(int room_no, String id);

	int currentLastRoom();

	void insertRoom(Chat chat);

	List<Chat> selectRoomMember(int room_no);

	List<Chat> selectMyRoom(String id);

	int chatCount(int room_no, String id);

	void checkRoom(int room_no, String id);

	int loadUnreadChat(String id, int room_no);

	String selectLastSender(int room_no, String id);

	void updateLastSender(int room_no, String id);

	int checkExistingChat(int used_no, String id);

}
