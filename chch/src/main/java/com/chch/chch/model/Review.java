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
	//由щ럭 媛��닔 �꽭湲곗슜
	private int review_cnt;
//	�럹�씠吏뺤슜
	private int startRow;
	private int endRow;
}
