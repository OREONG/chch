package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.CommunityDao;
import com.chch.chch.model.Community;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDao comd;

	public int insert(Community community) {
		return comd.insert(community);
	}

	public Community select(int community_no) {
		return comd.select(community_no);
	}

	public int selectByRoomNo(int room_no) {
		return comd.selectByRoomNo(room_no);
	}

	public List<Community> communityMyList(String id) {
		return comd.communityMyList(id);
	}

	public int currentMember(int room_no) {
		return comd.currentMember(room_no);
	}

	public List<Community> communityAllList() {
		return comd.communityAllList();
	}

	public int participation(int room_no, String id) {
		return comd.participation(room_no, id);
	}

	public String selectRoomName(int room_no) {
		return comd.selectRoomName(room_no);
	}

	@Override
	public int joinRoom(int room_no, String id, String room_name) {
		return comd.joinRoom(room_no,id,room_name);
	}

	@Override
	public int leaveRoom(String id, int room_no) {
		return comd.leaveRoom(id, room_no);
	}

	@Override
	public int leaveHistoryChk(int room_no, String id) {
		return comd.leaveHistoryChk(id, room_no);
	}

	@Override
	public int rejoinRoom(int room_no, String id) {
		return comd.rejoinRoom(room_no, id);
	}

	@Override
	public int communityLeave(String id, int community_no) {
		return comd.communityLeave(id, community_no);
		
	}

	@Override
	public int communityDelete(String id, int community_no) {
		return comd.communityDelete(id, community_no);
	}

	@Override
	public void banRoom(int room_no) {
		comd.banRoom(room_no);
	}

}
