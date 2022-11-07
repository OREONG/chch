package com.chch.chch.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Book;
import com.chch.chch.model.Review;


@Repository
public class NewBookDaoImpl implements NewBookDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Book> bookList() {
		return sst.selectList("bookns.select");
	}

	@Override
	public int getTotal(Book book) {
		return sst.selectOne("bookns.getTotal", book);
	}

	@Override
	public Book selectbook(int book_no) {
		return sst.selectOne("bookns.selectbook", book_no);
	}

	@Override
	public List<Review> reviewList(int book_no) {
		return sst.selectList("reviewns.selectList", book_no);
	}

	@Override
	public int review_cnt(int book_no) {
		return sst.selectOne("reviewns.review_cnt", book_no);
	}
}
