package com.chch.chch.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String id; //아이디
	private String email; //이메일
	private String password; //비밀번호(암호화)
	private String fileName; //사진
	private String name; //이름
	private String birth; //생년월일
	private String gender; //성별(1,2,3,4)
	private String phone; //휴대전화(01011112222)
	private Date reg_date; //가입일
	private String del; //탈퇴여부
}