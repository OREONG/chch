package com.chch.chch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.MemberDao;
import com.chch.chch.model.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao md;

	//아이디 중복검사
	public Member select(String id) {
		return md.select(id);
	}
	//이메일 중복검사
	public Member selectEmail(String email) {
		return md.selectEmail(email);
	}

	//초기 회원가입
	public int insert(Member member) {
		return md.insert(member);
	}

}