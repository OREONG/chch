package com.chch.chch.model;

import lombok.Data;

@Data
public class Like_table {
	private int like_no;// 찜번호
	private int book_no; //			책번호 fk
	private String id;//	아이디fk
	//private int  used_no;//	중고거래번호fk
	private int author_no;		//작가되기 번호fk
	private int author_work_no;//작가되기 컨텐츠 번호fk
	private int review_no;
	private String del; //좋아요 여부
}
