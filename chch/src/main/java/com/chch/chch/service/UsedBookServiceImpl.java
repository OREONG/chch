package com.chch.chch.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.UsedBookDao;
import com.chch.chch.model.Book;
import com.chch.chch.model.Used;

@Service
public class UsedBookServiceImpl implements UsedBookService {
	@Autowired
	private UsedBookDao ud;

	@Override
	public List<Used> usedBookList(Used used) {
		return ud.usedBookList(used);
	}

	@Override
	public int getTotal(Used used) {
		return ud.getTotal(used);
	}

	@Override
	public Used selectUsed(int used_no) {
		return ud.selectUsed(used_no);
	}

	@Override
	public List<Book> bookSearch(String searchText) {
		return ud.bookSearch(searchText);
	}

	@Override
	public int insertUsed(Used used) {
		return ud.insertUsed(used);
	}

	@Override
	public List<Used> searchList(String keyword) {
		return ud.searchList(keyword);
	}

	@Override
	public int updateStatus(Map<String, Object> map) {
		return ud.updateStatus(map);
	}
	
	// HYC
		//	중고 도서 예약시 예약중으로 상태 변경
		public int update(int used_no) {
			return ud.update(used_no);
		}

		// 중고 도서 판매확정시 판매 완료로 상태 변경
		public int update2(int used_no) {
			return ud.update2(used_no);
		}

		// 거래 완료시 f로 상태 변경
		public int update3(int used_no) {
			return ud.update3(used_no);
		}

}
