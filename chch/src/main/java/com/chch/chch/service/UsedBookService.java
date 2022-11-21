package com.chch.chch.service;

import java.util.List;
import java.util.Map;

import com.chch.chch.model.Book;
import com.chch.chch.model.Used;

public interface UsedBookService {

	List<Used> usedBookList(Used used);

	int getTotal(Used used);

	Used selectUsed(int used_no);

	List<Book> bookSearch(String searchText);

	int insertUsed(Used used);

	List<Used> searchList(String keyword);

	int updateStatus(Map<String, Object> map);
	
	// HYC
		//	중고 도서 예약시 예약중으로 상태 변경
		int update(int used_no);

		// 중고 도서 판매확정시 판매 완료로 상태 변경
		int update2(int used_no);

		// 거래 완료시 f로 상태 변경
		int update3(int used_no);

}
