package com.chch.chch.model;

import lombok.Data;

@Data
public class Like_list {
	private int like_no;
	private int book_no;
	private int used_no;
	private String 	id;
	private int like_count;
	private String book_image;
	private String book_title;
	private int book_price;
	private String used_image;
	private String used_subject;
	private int used_price;
	
	
	private int startRow;
	private int endRow;
}