package com.chch.chch.service;

import java.sql.Date;

import lombok.Data;

@Data
public class Book implements Comparable<Book> {
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
//	페이징용
	private int startRow;
	private int endRow;
//	리뷰 갯수 세기용
	private int review_cnt;
//	평균별점
	private double star_avg;
//	도서리스트 정렬
	private String order;

	
	@Override
	public int compareTo(Book book) {

		if (book.review_cnt > review_cnt) {
			return 1;
		} else if (book.review_cnt < review_cnt) {
			return -1;
		}
		return 0;
	}
}