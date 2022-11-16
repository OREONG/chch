package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Book;

@Repository
public class BookDaoImpl implements BookDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal() {
		return sst.selectOne("bookns.getTotal");
	}

	public List<Book> bookListAll(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("bookns.bookListAll", map);
	}

	public String delList(String book_no) {
		return sst.selectOne("bookns.delList", book_no);
	}

	public int deleteBook(String delList, String selectDelete) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("delList", delList);
		map.put("selectDelete", selectDelete);
		return sst.update("bookns.deleteBook", map);
	}

	public Book select(int book_no) {
		return sst.selectOne("bookns.select", book_no);
	}

	public int insert(Book book) {
		return sst.insert("bookns.insert", book);
	}

	public int update(Book book) {
		return sst.update("bookns.update", book);
	}
}