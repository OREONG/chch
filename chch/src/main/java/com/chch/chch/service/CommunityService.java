package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Community;

public interface CommunityService {

	int insert(Community community);

	Community select(int community_no);

	int selectByRoomNo(int room_no);

	List<Community> communityMyList(String id);

	int currentMember(int room_no);

	List<Community> communityAllList();

	int participation(int room_no, String id);

	String selectRoomName(int room_no);

	int joinRoom(int room_no, String id, String room_name);

}
