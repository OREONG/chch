package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.Like_listDao;
import com.chch.chch.model.Like_list;

@Service
public class Like_listServiceImpl implements Like_listService{
	@Autowired
	private Like_listDao ld;

	@Override
	public List<Like_list> Booklike_list(String id) {
		return ld.Booklike_list(id);
	}

	@Override
	public List<Like_list> Usedlike_list(String id) {
		return ld.Usedlike_list(id);
	}

	@Override
	public int delete(int like_no, String id) {
		return ld.delete(like_no,id);
	}

	@Override
	public int insert(Like_list like_list) {
		return ld.insert(like_list);
	}

	@Override
	public int insert_used(int used_no, Like_list like_list, String id) {
		return ld.insert_used(used_no,like_list,id);
	}

	@Override
	public int likeDelete(Like_list like_table) {
		return ld.likeDelete(like_table);
	}

	@Override
	public List<Like_list> newBookLike(String id, int book_no,Like_list like_list) {
		return ld.newBookLike(id,book_no,like_list);
	}

	@Override
	public int getTotal(Like_list like_list) {
		return ld.getTotal(like_list);
	}
	
}