package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Book;
import com.chch.chch.model.Report;
import com.chch.chch.model.Review;

public interface NewBookService {

	List<Book> bookListAll(Book book);

	List<Book> bookListSelect(Book book);

	int getTotal(Book book);

	Book selectbook(int book_no);

	List<Review> reviewList(Review review);

	int review_cnt(int book_no);

	int getTotal(Review review);

	double star_avg(Review review);

	int selectReview_cnt(int book_no);

	List<Book> searchList(Book book);

	List<Report> reportList(Report report);

	int getTotal1(Report report);


}
