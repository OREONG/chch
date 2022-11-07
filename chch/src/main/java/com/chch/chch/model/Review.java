package com.chch.chch.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Review {
	
	private int review_no;
	private int star_rate;
	private String review_content;
	private Date review_reg_date;
	private String review_del;
	private String id;
	private int book_no;
//	리뷰 갯수 세기용
	private int review_cnt;
//	평균별점
	private double star_avg;
//	페이징용
	private int startRow;
	private int endRow;
}
