package com.chch.chch.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String email;
	private String password;
	private String fileName;
	private String name;
	private Date birth;
	private String gender;
	private String phone;
	private Date reg_date;
	private String del;
}
