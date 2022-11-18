package com.chch.chch.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.LikeDao;
import com.chch.chch.model.Like_table;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeDao ld;

	//작품 관심
	public int insertAuthor(Like_table like_table) {
		return ld.insertAuthor(like_table);
	}

	//작품 관심 불러오기
	public Like_table selectAuthor(Map<String, Object> map) {
		return ld.selectAuthor(map);
	}

	//작품 관심 취소
	public int deleteAuthor(Map<String, Object> map) {
		return ld.deleteAuthor(map);
	}

	// 글 좋아요
	public int insertReview(Like_table like_table) {
		return ld.insertReview(like_table);
	}

	//글 좋아요 취소
	public int deleteReview(Map<String, Object> map) {
		return ld.deleteReview(map);
	}



	//댓글 좋아요 불러오기
	public Like_table selectReview(Map<String, Object> map) {
		return ld.selectReivew(map);
		
	}

	//댓글 좋아요 불러오기
	public Like_table selectLike_table(Map<String, Object> map) {
		return ld.selectLike_table(map);
	}

	//댓글 좋아요 갯수
	public int updateReviewLike(int review_no) {
		return ld.updateReviewLike(review_no);
	}

}
