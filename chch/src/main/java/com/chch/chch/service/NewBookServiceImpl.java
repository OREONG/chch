package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.NewBookDao;
import com.chch.chch.model.Book;
import com.chch.chch.model.Report;
import com.chch.chch.model.Review;

@Service
public class NewBookServiceImpl implements NewBookService {
	@Autowired
	private NewBookDao nd;

	@Override
	public List<Book> bookListAll(Book book) {
		return nd.bookListAll(book);
	}

	@Override
	public List<Book> bookListSelect(Book book) {
		return nd.bookListSelect(book);
	}

	@Override
	public int getTotal(Book book) {
		return nd.getTotal(book);
	}

	@Override
	public Book selectbook(int book_no) {
		return nd.selectbook(book_no);
	}

	@Override
	public List<Review> reviewList(Review review) {
		return nd.reviewList(review);
	}

	@Override
	public int review_cnt(int book_no) {
		return nd.review_cnt(book_no);
	}

	@Override
	public int getTotal(Review review) {
		return nd.getTotal(review);
	}

	@Override
	public double star_avg(Review review) {
		return nd.star_avg(review);
	}

	@Override
	public int selectReview_cnt(int book_no) {
		return nd.selectReview_cnt(book_no);
	}

	@Override
	public List<Book> searchList(Book book) {
		return nd.searchList(book);
	}

	@Override
	public List<Report> reportList(Report report) {
		return nd.reportList(report);
	}

	@Override
	public int getTotal1(Report report) {
		return nd.getTotal1(report);
	}

	// HYC
		// 책 번호로 책 리스트 불러오기
		public Book list(int book_no) {
			return nd.list(book_no);
		}
		
		// 책 구매시 수량 변경
		public int update2(Book book) {
			return nd.update2(book);
		}

}
