package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Like_list;

public interface Like_listService {

	List<Like_list> Booklike_list(String id);

	List<Like_list> Usedlike_list(String id);

	int delete(int like_no, String id);

	int insert(Like_list like_list);

	int insert_used(int used_no, Like_list like_list, String id);

	int likeDelete(Like_list like_table);

	List<Like_list> newBookLike(String id, int book_no, Like_list like_list);

	

}
