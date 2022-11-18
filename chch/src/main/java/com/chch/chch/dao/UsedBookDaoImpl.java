package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Book;
import com.chch.chch.model.Used;

@Repository
public class UsedBookDaoImpl implements UsedBookDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Used> usedBookList(Used used) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		return sst.selectList("usedns.usedList", used);
	}

	@Override
	public int getTotal(Used used) {
		return sst.selectOne("usedns.getTotal", used);
	}

	@Override
	public Used selectUsed(int used_no) {
		return sst.selectOne("usedns.selectUsed", used_no);
	}

	@Override
	public List<Book> bookSearch(String searchText) {
		return sst.selectList("bookns.bookSearch", searchText);
	}

	@Override
	public int insertUsed(Used used) {
		return sst.insert("usedns.insertUsed", used);
	}

	@Override
	public List<Used> searchList(String keyword) {
		return sst.selectList("usedns.searchList", keyword);
	}

	@Override
	public int updateStatus(Map<String, Object> map) {
		return sst.update("usedns.updateStatus", map);
	}
	
	// HYC
		//	중고 도서 예약시 예약중으로 상태 변경
		public int update(int used_no) {
			return sst.update("usedns.update", used_no);
		}

		// 중고 도서 판매확정시 판매 완료로 상태 변경
		public int update2(int used_no) {
			return sst.update("usedns.update2", used_no);
		}

		// 거래 완료시 f로 상태 변경
		public int update3(int used_no) {
			return sst.update("usedns.update3", used_no);
		}
}
