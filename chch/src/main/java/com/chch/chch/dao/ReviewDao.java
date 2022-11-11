package com.chch.chch.dao;

<<<<<<< HEAD
=======

import java.util.List;

>>>>>>> origin/SungBeen
import com.chch.chch.model.Review;

public interface ReviewDao {

<<<<<<< HEAD
	int insert(Review review);

	int update(Review review);

	int delete(Review review);
=======
	//작품 댓글 입력
	int insertReview(Review review);

	//댓글 전체 가져오기
	List<Review> selectAllReview(int author_work_no);

>>>>>>> origin/SungBeen

}
