package com.chch.chch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Book;
import com.chch.chch.model.Report;

@Repository
public class ReportDaoImpl implements ReportDao{

	@Autowired
	private SqlSessionTemplate sst;

	//책 검색
	public List<Book> bookSearch(String searchText) {
		return sst.selectList("reportns.bookSearch", searchText);
	}
	//독후감 등록
	public int insert(Report report) {
		return sst.insert("reportns.insert", report);
	}
	//독후감 리스트 불러오기
	public List<Report> selectList(Report report) {
		return sst.selectList("reportns.selectList", report);
	}
	//독후감 상세 페이지
	public Report select(int report_no) {
		return sst.selectOne("reportns.select", report_no);
	}
	//독후감 삭제 (del = 'y')
	public int delete(int report_no) {
		return sst.update("reportns.delete", report_no);
	}
	//독후감 수정
	public int update(Report report) {
		return sst.update("reportns.update", report);
	}
	//페이징 용 독서록 개수 불러오기
	public int getTotal(Report report) {
		return sst.selectOne("reportns.getTotal", report);
	}
}
