package com.chch.chch.dao;

import com.chch.chch.model.Member;

public interface MemberDao {

	//아이디 중복검사
	Member select(String id);
	//이메일 중복검사
	Member selectEmail(String email);

	//초기 회원가입
	int insert(Member member);


}
