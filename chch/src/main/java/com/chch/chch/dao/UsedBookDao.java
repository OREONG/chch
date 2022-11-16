package com.chch.chch.dao;

import java.util.List;
import java.util.Map;

import com.chch.chch.model.Book;
import com.chch.chch.model.Used;

public interface UsedBookDao {

	List<Used> usedBookList(Used used);

	int getTotal(Used used);

	Used selectUsed(int used_no);

	List<Book> bookSearch(String searchText);

	int insertUsed(Used used);

	List<Used> searchList(String keyword);

	int updateStatus(Map<String, Object> map);

}
