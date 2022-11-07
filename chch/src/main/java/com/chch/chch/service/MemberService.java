package com.chch.chch.service;

import com.chch.chch.model.Member;

public interface MemberService {
	
	//아이디 중복검사
	Member select(String id);
	//이메일 중복검사
	Member selectEmail(String email);

	//초기 회원가입
	int insert(Member member);
	
	//회원 정보 수정
	int update(Member member);
	//회원 탈퇴(del 수정)
	int delete(String id);
	//비밀번호 찾기 비밀번호 재설정
	int updatePassword(Member member);
	

}
