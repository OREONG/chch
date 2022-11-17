package com.chch.chch.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private String id; //아이디
	private String password; //비밀번호(암호화)
	private String email; //이메일
	private String fileName; //사진
	private String name; //이름
	private String address; //주소
	private String address_detail; //상세주소
	private Date birth; //생년월일
	private String gender; //성별
	private String phone; //휴대전화(01011112222)
	private Date reg_date; //가입일
	private String del; //탈퇴여부
	//upload용
	private MultipartFile file;
	
	private String targetPage;
}
