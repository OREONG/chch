package com.chch.chch.dao;

import java.util.List;

import com.chch.chch.model.Member;

public interface MemberDao {

	int getTotal();

	List<Member> memberList(int startRow, int endRow);

	int adminDelete(String id, String del);

}
