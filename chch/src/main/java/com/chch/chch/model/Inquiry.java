package com.chch.chch.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Inquiry {
	private int inquiry_no;
	private String id;
	private int category_no;
	private String inquiry_subject;
	private String inquiry_content;
	private Date reg_time;
	private String reply;
	private String reply_content;
	private Date reply_time;
	
	private int inquiryNumber;
}
