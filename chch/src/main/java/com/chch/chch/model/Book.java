package com.chch.chch.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

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
	
	private String currentFile;
	private String currentFile2;
	private String currentKind;
	
	// upload용
	private MultipartFile file;
	private MultipartFile file2;
}
