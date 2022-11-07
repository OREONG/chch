package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.ReviewDao;
import com.chch.chch.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao rd;

	//작품 댓글 입력
	public int insertReview(Review review) {
		return rd.insertReview(review);
	}

	//댓글 전체 가져오기
	public List<Review> selectAllReview(int author_work_no) {
		return rd.selectAllReview(author_work_no);
	}

}
