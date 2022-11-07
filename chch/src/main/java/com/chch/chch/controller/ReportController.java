package com.chch.chch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.model.Book;
import com.chch.chch.model.Report;
import com.chch.chch.service.PagingBean;
import com.chch.chch.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService rs;
	
	//독후감 list
	@RequestMapping("/myPage/reportList")
	public String reportForm(Report report, HttpSession session, Model model, String pageNum) {
		String id = (String)session.getAttribute("id");
		//List<Report> reportList = rs.selectList();
		report.setId(id);
		
		//페이징
		int rowPerPage = 4; //한 화면에 보여주는 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = rs.getTotal(report);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		report.setStartRow(startRow);
		report.setEndRow(endRow);
		List<Report> reportList = rs.selectList(report);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		model.addAttribute("id", id);
		model.addAttribute("reportList", reportList);
		
		model.addAttribute("report", report); 
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		return "/myPage/reportList";
	}
	
	//책 검색
	@RequestMapping(value = "search", produces = "text/html;charset=utf-8")
	public String search(String searchText, Model model) {
		List<Book> bookList = rs.bookSearch(searchText);
		model.addAttribute("bookList", bookList);
		return "/myPage/search";
	}
	
	//독후감 등록 여부
	@RequestMapping("/myPage/reportConfirm")
	public String reportConfirm(Report report, Model model) {
		int result = 0;
		result = rs.insert(report);
		model.addAttribute("result", result);
		return "/myPage/reportConfirm";
	}
	
	//독후감 상세 페이지
	@RequestMapping("/myPage/reportDetail")
	public String reportDetail(int report_no, Model model) {
		Report report = rs.select(report_no);
		model.addAttribute("report", report);
		return "/myPage/reportDetail";
	}
	
	//독후감 삭제 (del = 'y')
	@RequestMapping("/myPage/reportDelete")
	public String reportDelete(int report_no, Model model) {
		int result = 0;
		result = rs.delete(report_no);
		model.addAttribute("result", result);
		return "/myPage/reportDelete";
	}
	
	//독후감 수정 폼
	@RequestMapping("/myPage/reportUpdate")
	public String reportUpdate(int report_no, Model model) {
		Report report = rs.select(report_no);
		model.addAttribute("report", report);
		return "/myPage/reportUpdate";
	}
	
	@RequestMapping("/myPage/reportUpdateConfirm")
	public String reportUpdateConfirm(Report report, Model model) {
		int result = 0;
		System.out.println(report.getReport_no());
		System.out.println(report.getReport_title());
		System.out.println(report.getReport_content());
		System.out.println(report.getExpose());
		result = rs.update(report);
		model.addAttribute("result", result);
		return "/myPage/reportUpdateConfirm";
	}
}
