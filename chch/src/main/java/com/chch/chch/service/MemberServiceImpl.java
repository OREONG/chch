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
<<<<<<< HEAD
	}

	//초기 회원가입
	public int insert(Member member) {
		return md.insert(member);
	}

}
=======
	}

	//초기 회원가입
	public int insert(Member member) {
		return md.insert(member);
	}
	//회원 정보 수정
	public int update(Member member) {
		return md.update(member);
	}
	//회원 탈퇴(del 수정)
	public int delete(String id) {
		return md.delete(id);
	}
	
	//비밀번호 찾기 비밀번호 재설정
	public int updatePassword(Member member) {
		return md.updatePassword(member);
	}
	
	
	// KSB
	// 전체 회원 수 조회
	public int getTotal() {
		return md.getTotal();
	}
	
	// 전체 멤버 리스트 (페이징)
	public List<Member> memberList(int startRow, int endRow) {
		return md.memberList(startRow, endRow);
	}
	
	// 멤버 삭제 y/n 수정
	public int adminDelete(String id, String del) {
		return md.adminDelete(id, del);
	}
	
}
>>>>>>> origin/SungBeen
