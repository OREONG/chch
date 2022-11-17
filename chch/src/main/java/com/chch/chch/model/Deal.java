package com.chch.chch.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Deal {
	private String book_title;
	private int deal_count;
	private Date deal_Date;
	private int deal_price;
	private String used_subject;
	private int deal_no;
	private String book_image;
	private String book_author;
	private String book_publisher;
	private int book_count;
	private String used_no;
	private int startRow;
	private int endRow;
	
}