package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.ReportDao;
import com.chch.chch.model.Book;
import com.chch.chch.model.Report;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDao rd;

	//책 검색
	public List<Book> bookSearch(String searchText) {
		return rd.bookSearch(searchText);
	}
	//독후감 등록
	public int insert(Report report) {
		return rd.insert(report);
	}
	//독후감 리스트 불러오기
	public List<Report> selectList(Report report) {
		return rd.selectList(report);
	}
	//독후감 상세 페이지
	public Report select(int report_no) {
		return rd.select(report_no);
	}
	//독후감 삭제 (del = 'y')
	public int delete(int report_no) {
		return rd.delete(report_no);
	}
	//독후감 수정
	public int update(Report report) {
		return rd.update(report);
	}
	//페이징 용 독서록 개수 불러오기
	public int getTotal(Report report) {
		return rd.getTotal(report);
	}
}
