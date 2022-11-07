package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.BookDao;
import com.chch.chch.model.Book;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDao bd;

	public int getTotal() {
		return bd.getTotal();
	}

	public List<Book> bookListAll(int startRow, int endRow) {
		return bd.bookListAll(startRow, endRow);
	}

	public String delList(String book_no) {
		return bd.delList(book_no);
	}

	public int deleteBook(String delList, String selectDelete) {
		return bd.deleteBook(delList, selectDelete);
	}

	public Book select(int book_no) {
		return bd.select(book_no);
	}

	public int insert(Book book) {
		return bd.insert(book);
	}

	public int update(Book book) {
		return bd.update(book);
	}
}
