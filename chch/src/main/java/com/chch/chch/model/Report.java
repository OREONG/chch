package com.chch.chch.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Report {
	private int report_no;//감상문 번호	
	private String id;//아이디 
	private Date report_date;//감상문 날짜	
	private String report_title;//감상문 제목		
	private String report_content;//감상문 내용		
	private String expose;//공개 여부
	private String del;//삭제여부 
	private int book_no;//책 번호
	
	//join용
	private String book_title;//		--제목
	private String book_image;//		--이미지
	private String book_author;//		--지은이
	private String book_publisher;//	--출판사
	private String book_kind;//		--분류
	
	//paging용
	private int startRow;
	private int endRow;
}
