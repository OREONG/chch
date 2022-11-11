package com.chch.chch.dao;

import java.util.List;

import com.chch.chch.model.Community;

public interface CommunityDao {

	int insert(Community community);

	Community select(int community_no);

	int selectByRoomNo(int room_no);

	List<Community> communityMyList(String id);

	int currentMember(int room_no);

	List<Community> communityAllList();

	int participation(int room_no, String id);

	String selectRoomName(int room_no);

	int joinRoom(int room_no, String id, String room_name);

	int leaveRoom(String id, int room_no);

	int leaveHistoryChk(String id, int room_no);

	int rejoinRoom(int room_no, String id);

	int communityLeave(String id, int community_no);

	int communityDelete(String id, int community_no);

	void banRoom(int room_no);

}
