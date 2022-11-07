package com.chch.chch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.ReviewDao;
import com.chch.chch.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao rd;

	@Override
	public int insert(Review review) {
		return rd.insert(review);
	}

	@Override
	public int update(Review review) {
		return rd.update(review);
	}

	@Override
	public int delete(Review review) {
		return rd.delete(review);
	}
}
