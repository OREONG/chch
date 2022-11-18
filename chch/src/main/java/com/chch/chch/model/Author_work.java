package com.chch.chch.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Author_work {
	private int author_work_no;//작가되기 컨텐츠 번호
	private String author_work_subject; //작가되기 컨텐츠 제목		
	private String author_work_content; //작가되기 컨텐츠 내용		
	private String author_work_comment;	//작가되기 컨텐츠 작가의 말			
	private int author_work_count; //조회수	
	private Date author_work_date; //작품 등록 날짜	
	private int author_no; //작가되기 번호
	private String id;//아이디
	
	//paging용
	private int startRow;
	private int endRow;
}
