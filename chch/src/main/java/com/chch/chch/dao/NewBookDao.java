package com.chch.chch.dao;

import java.util.List;

import com.chch.chch.model.Book;
import com.chch.chch.model.Review;


public interface NewBookDao {

	List<Book> bookList();

	int getTotal(Book book);

	Book selectbook(int book_no);

	List<Review> reviewList(int book_no);

	int review_cnt(int book_no);

}
