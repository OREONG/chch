package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.NewBookDao;
import com.chch.chch.model.Book;
import com.chch.chch.model.Review;

@Service
public class NewBookServiceImpl implements NewBookService {
	@Autowired
	private NewBookDao nd;

	@Override
	public List<Book> bookList() {
		return nd.bookList();
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
	public List<Review> reviewList(int book_no) {
		return nd.reviewList(book_no);
	}

	@Override
	public int review_cnt(int book_no) {
		return nd.review_cnt(book_no);
	}
}
