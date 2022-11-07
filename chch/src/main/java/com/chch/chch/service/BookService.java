package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Book;

public interface BookService {

	int getTotal();

	List<Book> bookListAll(int startRow, int endRow);

	String delList(String book_no);

	int deleteBook(String delList, String selectDelete);

	Book select(int book_no);

	int insert(Book book);

	int update(Book book);

}
