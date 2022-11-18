package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Community;

@Repository
public class CommunityDaoImpl implements CommunityDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int insert(Community community) {
		return sst.insert("communityns.insert", community);
	}

	public Community select(int community_no) {
		return sst.selectOne("communityns.select", community_no);
	}

	public int selectByRoomNo(int room_no) {
		return sst.selectOne("communityns.selectByRoomNo", room_no);
	}

	public List<Community> communityMyList(String id) {
		return sst.selectList("communityns.communityMyList", id);
	}

	public int currentMember(int room_no) {
		return sst.selectOne("communityns.currentMember", room_no);
	}

	public List<Community> communityAllList() {
		return sst.selectList("communityns.communityAllList");
	}

	public int participation(int room_no, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("room_no", room_no);
		map.put("id", id);
		return sst.selectOne("communityns.participation", map);
	}

	public String selectRoomName(int room_no) {
		return sst.selectOne("communityns.selectRoomName", room_no);
	}

	public int joinRoom(int room_no, String id, String room_name) {
		Map<String, Object> map = new HashMap<>();
		map.put("room_no", room_no);
		map.put("id", id);
		map.put("room_name", room_name);
		return sst.insert("communityns.joinRoom", map);
	}

	@Override
	public int leaveRoom(String id, int room_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("room_no", room_no);
		map.put("id", id);
		return sst.update("communityns.leaveRoom", map);
	}

	@Override
	public int leaveHistoryChk(String id, int room_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("room_no", room_no);
		map.put("id", id);
		return sst.selectOne("communityns.leaveHistoryChk", map);
		
	}

	@Override
	public int rejoinRoom(int room_no, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("room_no", room_no);
		map.put("id", id);
		return sst.update("communityns.rejoinRoom", map);
	}

	@Override
	public int communityLeave(String id, int community_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("community_no", community_no);
		map.put("id", id);
		return sst.update("communityns.communityLeave", map);
	}

	@Override
	public int communityDelete(String id, int community_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("community_no", community_no);
		map.put("id", id);
		return sst.update("communityns.communityDelete", map);
	}

	@Override
	public void banRoom(int room_no) {
		sst.update("communityns.banRoom", room_no);
	}

}
