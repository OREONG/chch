package com.chch.chch.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Used;

@Repository
public class UsedBookDaoImpl implements UsedBookDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Used> usedBookList() {
		return sst.selectList("usedns.bookList");
	}

	@Override
	public int getTotal(Used used) {
		return sst.selectOne("usedns.getTotal", used);
	}

	@Override
	public Used selectUsed(int used_no) {
		return sst.selectOne("usedns.selectUsed", used_no);
	}
}
