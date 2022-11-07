package com.chch.chch.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.model.Book;
import com.chch.chch.model.Review;
import com.chch.chch.service.NewBookService;
import com.chch.chch.service.PagingBean;

@Controller
public class NewBookController {
	@Autowired
	private NewBookService ns;
	
	@RequestMapping("/newBook/newList")
	public String newList(String order, String book_kind, Model model, Book book, String pageNum) {
		
		//신작도서 페이징
		int rowPerPage = 12; // 페이지 당 게시글 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ns.getTotal(book);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		book.setStartRow(startRow);
		book.setEndRow(endRow);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		//신작도서 리스트
		List<Book> bookList = new ArrayList<Book>();
		//정렬순서 저장
		book.setOrder(order);
		if(book_kind.equals("all")) { //신작도서 눌렀을 때
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
			review_cnt = ns.review_cnt(book1.getBook_no());
			review.setBook_no(book1.getBook_no());
			star_avg = ns.star_avg(review);
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
		model.addAttribute("num", num);
		return "/newBook/newList";
	}
	
	@RequestMapping("/newBook/newDetail")
	public String newDetail(int book_no, Model model, Book book, Review review, String pageNum) {
		// 리뷰 페이징
		int rowPerPage = 5; // 페이지 당 게시글 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ns.getTotal(review);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		review.setStartRow(startRow);
		review.setEndRow(endRow);
		review.setBook_no(book_no);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		//책정보 불러오기
		book = ns.selectbook(book_no);
		//리뷰리스트 불러오기
		List<Review> list = ns.reviewList(review);
		//리뷰 갯수
		int review_cnt = ns.review_cnt(book_no);
		//별점 평균
		double star_avg = ns.star_avg(review);
		
		model.addAttribute("review_cnt", review_cnt);
		model.addAttribute("list", list);
		model.addAttribute("review", review);
		model.addAttribute("book", book);
		model.addAttribute("pb", pb);
		model.addAttribute("num", num);
		model.addAttribute("star_avg", star_avg);
		return "newBook/newDetail";
	}
	
}
