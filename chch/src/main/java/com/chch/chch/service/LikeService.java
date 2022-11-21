package com.chch.chch.service;

import java.util.Map;

import com.chch.chch.model.Like_table;

public interface LikeService {

	//작품 관심
	int insertAuthor(Like_table like_table);

	//작품 관심 불러오기
	Like_table selectAuthor(Map<String, Object> map);

	//작품 관심 취소
	int deleteAuthor(Map<String, Object> map);

	//글 좋아요
	int insertReview(Like_table like_table);

	//글 좋아요 취소
	int deleteReview(Map<String, Object> map);

	//댓글 좋아요 불러오기
	Like_table selectReview(Map<String, Object> map);

	//댓글 좋아요 불러오기
	Like_table selectLike_table(Map<String, Object> map);

	//댓글 좋아요 갯수
	int updateReviewLike(int review_no);



}
