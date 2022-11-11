package com.chch.chch.service;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> origin/SungBeen
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.ReviewDao;
import com.chch.chch.model.Review;

@Service
<<<<<<< HEAD
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
=======
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

>>>>>>> origin/SungBeen
}
