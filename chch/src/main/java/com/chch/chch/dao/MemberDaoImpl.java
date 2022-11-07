package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal() {
		return sst.selectOne("memberns.getTotal");
	}

	public List<Member> memberList(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("memberns.memberList", map);
	}

	public int adminDelete(String id, String del) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("del", del);
		return sst.update("memberns.adminDelete", map);
	}
}
