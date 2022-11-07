package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Member;

public interface MemberService {

	int getTotal();

	List<Member> memberList(int startRow, int endRow);

	int adminDelete(String id, String del);

}
