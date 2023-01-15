package com.chch.chch.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.model.Book;
import com.chch.chch.model.Report;
import com.chch.chch.model.Review;
import com.chch.chch.model.Used;
import com.chch.chch.service.NewBookService;
import com.chch.chch.service.PagingBean;
import com.chch.chch.service.PagingBean1;
import com.chch.chch.service.ReportService;
import com.chch.chch.service.UsedBookService;

@Controller
public class NewBookController {
	@Autowired
	private NewBookService ns;
	@Autowired
	private UsedBookService us;
	
	
//	by현서. 신작도서 리스트
	@RequestMapping("newList")
	public String newList(String order, String book_kind, Model model, Book book, String pageNum) {
		
		// 신작도서 페이징
		int rowPerPage = 12; // 페이지 당 게시글 갯수
		// 페이지 이동 or새로고침 시 1페이지로 지정
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		// String타입의 pageNum을 Integer타입으로 형변환 후 currentPage에 저장
		int currentPage = Integer.parseInt(pageNum);
		// 도서 갯수 전부를 가져옴
		int total = ns.getTotal(book);
		// 해당 페이지의 첫 글 번호
		int startRow = (currentPage - 1) * rowPerPage + 1;
		// 해당 페이지의 마지막 글 번호
		int endRow = startRow + rowPerPage -1;
		
		book.setStartRow(startRow);
		book.setEndRow(endRow);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		// 신작도서 리스트
		List<Book> bookList = new ArrayList<Book>();
		// 정렬순서 저장
		book.setOrder(order);
		// 신작도서 눌렀을 때
		if(book_kind.equals("all")) { 
			bookList = ns.bookListAll(book);
		}
		else { //카테고리 눌렀을 때
			book.setBook_kind(book_kind);
			bookList = ns.bookListSelect(book);
		}
		
		//리스트 책마다 리뷰갯수 평균별점 표시
		int review_cnt = 0;
		double star_avg = 0;
		Review review = new Review();
		
		for (Book book1 : bookList) { // 주소를 복사하기때문에 bookList에도 들어감
			// 해당 book_no의 리뷰 갯수를 review_cnt에 저장
			review_cnt = ns.review_cnt(book1.getBook_no());
			// 해당 book_no를 review객체에 저장
			review.setBook_no(book1.getBook_no());
			// 해당 review의 평균별점을 star_avg에 저장
			star_avg = ns.star_avg(review);
			// 계산된 review_cnt와 star_avg를 book1에 저장
			book1.setReview_cnt(review_cnt);
			book1.setStar_avg(star_avg);
		}
		// 리뷰 많은순 정렬
		if (order.equals("review")) {
			Collections.sort(bookList);
		}
		
		model.addAttribute("order", order);
		model.addAttribute("book_kind", book_kind);
		model.addAttribute("bookList", bookList);
		model.addAttribute("pb", pb);
		return "/newBook/newList";
	}
	
//	by현서. 신작도서 상세페이지
	@RequestMapping("newDetail")
	public String newDetail(int book_no, Model model, Book book, Review review, String pageNum, Report report, String pageNum1) {
		// 리뷰 페이징
		int rowPerPage = 5; // 페이지 당 게시글 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		review.setBook_no(book_no);
		int total = ns.getTotal(review);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		
		review.setStartRow(startRow);
		review.setEndRow(endRow);
		review.setBook_no(book_no);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		//책정보 불러오기
		book = ns.selectbook(book_no);
		//리뷰리스트 불러오기
		List<Review> reviewList = ns.reviewList(review);
		//리뷰 갯수
		int review_cnt = ns.review_cnt(book_no);
		//별점 평균
		double star_avg = ns.star_avg(review);
		//할인 전 가격
		int finalprice = (int)(book.getBook_price() * 1.1);
		book.setFinalprice(finalprice);
		
		// 감상문 페이징
		int rowPerPage1 = 5; // 페이지 당 게시글 갯수
		if (pageNum1 == null || pageNum1.equals("")) pageNum1 = "1";
		int currentPage1 = Integer.parseInt(pageNum1);
		report.setBook_no(book_no);
		int total1 = ns.getTotal1(report);
		System.out.println(total1);
		int startRow1 = (currentPage1 - 1) * rowPerPage1 + 1;
		int endRow1 = startRow1 + rowPerPage1 -1;
		int num1 = total - startRow1 + 1;
		PagingBean1 pb1 = new PagingBean1(currentPage1, rowPerPage1, total1);

		report.setBook_no(book_no);
		report.setStartRow(startRow1);
		report.setEndRow(endRow1);
		//감상문 리스트
		List<Report> reportList = ns.reportList(report);
		
		model.addAttribute("review_cnt", review_cnt);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reportList", reportList);
		model.addAttribute("review", review);
		model.addAttribute("book", book);
		model.addAttribute("pb", pb);
		model.addAttribute("pb1", pb1);
		model.addAttribute("num1", num1);
		model.addAttribute("star_avg", star_avg);
		return "/newBook/newDetail";
	}
	
//	by현서. 검색
	@RequestMapping("searchBook")
	public String search(String keyword, Model model, Book book) {
		// 신작도서 검색
		// keyword를 book객체에 저장
		book.setKeyword(keyword);
		// keyword로 검색한 결과를 searchList에 저장
		List<Book> searchList = ns.searchList(book);
		
		//리스트 책마다 리뷰갯수 평균별점 표시
		int review_cnt = 0;
		double star_avg = 0;
		Review review = new Review();
		for (Book book1 : searchList) { // 주소를 복사하기때문에 bookList에도 들어감
			review_cnt = ns.review_cnt(book1.getBook_no());
			review.setBook_no(book1.getBook_no());
			star_avg = ns.star_avg(review);
			book1.setReview_cnt(review_cnt);
			book1.setStar_avg(star_avg);
		}
		// 중고도서 검색
		List<Used> usedSearchList = us.searchList(keyword);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchList", searchList);
		model.addAttribute("usedSearchList", usedSearchList);
		return "/newBook/searchResult";
	}
}









