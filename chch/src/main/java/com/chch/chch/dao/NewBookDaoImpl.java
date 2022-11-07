package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Book> bookListAll(Book book) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sst.selectList("bookns.bookListAll", book);
	}
	
	@Override
	public List<Book> bookListSelect(Book book) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sst.selectList("bookns.bookListSelect", book);
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
	public List<Review> reviewList(Review review) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sst.selectList("reviewns.reviewList", review);
	}

	@Override
	public int review_cnt(int book_no) {
		return sst.selectOne("reviewns.review_cnt", book_no);
	}

	@Override
	public int getTotal(Review review) {
		return sst.selectOne("reviewns.getTotal", review);
	}

	@Override
	public double star_avg(Review review) {
		return sst.selectOne("reviewns.star_avg", review);
	}

	@Override
	public int selectReview_cnt(int book_no) {
		return sst.selectOne("reviewns.review_cnt", book_no);
	}

	
}
