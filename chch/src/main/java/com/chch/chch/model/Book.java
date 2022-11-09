package com.chch.chch.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Book {
	private int book_no;//				--책번호
	private String book_title;//		--제목
	private String book_image;//		--이미지
	private String book_imagedetail;//	--책설명 이미지
	private String book_author;//		--지은이
	private String book_publisher;//	--출판사
	private int book_count;//			--재고
	private int book_price;//			--가격
	private Date book_publish_date;//	--출판일
	private Date book_reg_date;//		--등록일
	private String book_content;//		--내용
	private String book_kind;//			--분류
	private String book_del;//			--삭제여부
	
	
//	KSB
//	책 정보 수정에 필요한 기존 파일 정보
	private String currentFile;//		--기존 책 이미지
	private String currentFile2;//		--기존 책설명 이미지
	private String currentKind;//		--기존 책 분류
//	upload용
	private MultipartFile file;
	private MultipartFile file2;
	
}
