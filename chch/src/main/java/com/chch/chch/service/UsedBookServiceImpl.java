package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.UsedBookDao;
import com.chch.chch.model.Used;

@Service
public class UsedBookServiceImpl implements UsedBookService {
	@Autowired
	private UsedBookDao ud;

	@Override
	public List<Used> usedBookList() {
		return ud.usedBookList();
	}

	@Override
	public int getTotal(Used used) {
		return ud.getTotal(used);
	}

	@Override
	public Used selectUsed(int used_no) {
		return ud.selectUsed(used_no);
	}
}
