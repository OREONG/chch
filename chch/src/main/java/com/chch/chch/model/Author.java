package com.chch.chch.model;

import java.sql.Date;


import lombok.Data;

@Data
public class Author {
	private int author_no;//작가되기 번호
	private String author_subject;//작품 제목
	private String author_class;//작품 분류
	private String author_introduce;//작품 소개
	private String id;//아이디
	private String del;//삭제여부
	private Date reg_date;//등록일
	private int like_count; //관심 합계

	//조인용
	private int author_work_no;//작가되기 컨텐츠 번호
	private String author_work_subject; //작가되기 컨텐츠 제목		
	private String author_work_content; //작가되기 컨텐츠 내용		
	private String author_work_comment;	//작가되기 컨텐츠 작가의 말			
	private int author_work_count; //조회수	
	private Date author_work_date; //작품 등록 날짜	
	private String author_work_del; //삭제여부
	
	//paging용
	private int startRow;
	private int endRow;
}
