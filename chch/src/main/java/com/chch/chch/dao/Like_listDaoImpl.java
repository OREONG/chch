package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Like_list;

@Repository
public class Like_listDaoImpl implements Like_listDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Like_list> Booklike_list(String id) {
		return sst.selectList("likens.Booklike_list", id);
	}

	@Override
	public List<Like_list> Usedlike_list(String id) {
		return sst.selectList("likens.Usedlike_list", id);
	}

	@Override
	public int delete(int like_no, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("like_no", like_no);
		return sst.delete("likens.delete" ,map);
	}

	@Override
	public int insert(Like_list like_table) {
		
		return sst.insert("likens.insert",like_table);
	}

	@Override
	public int insert_used(int used_no, Like_list like_list, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("used_no", used_no);
		map.put("like_list", like_list);
		return sst.insert("likens.insert_used",map);
	}

	@Override
	public int likeDelete(Like_list like_table) {
		return sst.delete("likens.likeDelete",like_table);
	}

	@Override
	public List<Like_list> newBookLike(String id, int book_no,Like_list like_list) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("book_no", book_no);
		map.put("like_list", like_list);
		return sst.selectList("likens.select",map);
	}

}
