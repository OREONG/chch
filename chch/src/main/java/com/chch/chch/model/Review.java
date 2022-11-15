package com.chch.chch.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private int review_no;//댓글번호PK
	private int star_rate;//별점		
	private String review_content;//내용		
	private Date review_reg_date;//기입일시
	private String review_del;//삭제여부
	private String id;//아이디FK
	private int book_no;//책번호FK
	private int author_work_no;//글 번호
	private int review_like_count;//좋아요 개수
	
	
	//join용
	private int like_no;// 찜번호
	private int like_review_no;
	//private int  used_no;//	중고거래번호fk
	private int author_no;		//작가되기 번호fk
	private String del; //좋아요 여부
	
	//paging용
	private int startRow;
	private int endRow;
}
