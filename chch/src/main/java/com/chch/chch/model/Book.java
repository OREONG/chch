package com.chch.chch.model;


import java.sql.Date;

import lombok.Data;

@Data
public class Book {
	private int book_no;
	private String book_title;
	private String book_image;
	private String book_imagedetail;
	private String book_author;
	private String book_publisher;
	private int book_count;
	private int book_price;
	private Date book_publish_date;
	private Date book_reg_date;
	private String book_content;
	private String book_kind;
	private String book_del;
//	�럹�씠吏뺤슜
	private int startRow;
	private int endRow;
}
