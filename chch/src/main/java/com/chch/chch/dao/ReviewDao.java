package com.chch.chch.dao;

import com.chch.chch.model.Review;

public interface ReviewDao {

	int insert(Review review);

	int update(Review review);

	int delete(Review review);

}
