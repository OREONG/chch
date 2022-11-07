package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.MemberDao;
import com.chch.chch.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;

	public int getTotal() {
		return md.getTotal();
	}

	public List<Member> memberList(int startRow, int endRow) {
		return md.memberList(startRow, endRow);
	}

	public int adminDelete(String id, String del) {
		return md.adminDelete(id, del);
	}
	
	
}
