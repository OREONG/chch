package com.chch.chch.model;

import lombok.Data;

@Data
public class Cart {
	private int cart_no;
	private int book_no;
	private String id;
	private int cart_count;
	
	// book
	private String book_title;
	private String book_image;
	private String book_author;
	private String book_publisher;
	private int book_price;
	private String book_kind;
	private int book_count;
	
	private int startRow;
	private int endRow;
}
