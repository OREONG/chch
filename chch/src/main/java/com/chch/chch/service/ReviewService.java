package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Review;

public interface ReviewService {
	
	//작품 댓글 입력
	int insertReview(Review review);

	//댓글 전체 가져오기
	List<Review> selectAllReview(int author_work_no);
	
	

}
