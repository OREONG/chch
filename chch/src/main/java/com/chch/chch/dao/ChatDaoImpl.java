package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Chat;

@Repository
public class ChatDaoImpl implements ChatDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<Chat> chatMemberList(String id) {
		return sst.selectList("chatns.chatMemberList", id);
	}

	public List<Chat> firstChatList(int room_no, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("room_no", room_no);
		map.put("id", id);
		return sst.selectList("chatns.firstChatList", map);
	}

	public int insertChat(Chat chat) {
		return sst.insert("chatns.insertChat", chat);
	}

	public String lastMessage(int room_no) {
		return sst.selectOne("chatns.lastMessage", room_no);
	}

	public String selectRoomName(int room_no, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("room_no", room_no);
		map.put("id", id);
		return sst.selectOne("chatns.selectRoomName", map);
	}

	public List<Chat> roomList(int room_no, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("room_no", room_no);
		map.put("id", id);
		return sst.selectList("chatns.roomList", map);
	}

	@Override
	public int currentLastRoom() {
		return sst.selectOne("chatns.currentLastRoom");
	}

	@Override
	public void insertRoom(Chat chat) {
		sst.insert("chatns.insertRoom", chat);
	}
}
