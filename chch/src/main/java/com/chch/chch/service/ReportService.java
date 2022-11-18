package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Book;
import com.chch.chch.model.Report;

public interface ReportService {

	//책 검색
	List<Book> bookSearch(String searchText);
	
	//독후감 등록
	int insert(Report report);
	//독후감 리스트 불러오기
	List<Report> selectList(Report report);
	//독후감 상세페이지
	Report select(int report_no);
	//독후감 삭제 (del = 'y')
	int delete(int report_no);
	//독후감 수정
	int update(Report report);

	//페이징 용 독서록 개수 불러오기
	int getTotal(Report report);

}
