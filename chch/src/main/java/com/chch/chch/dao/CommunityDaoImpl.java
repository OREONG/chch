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
	
}
