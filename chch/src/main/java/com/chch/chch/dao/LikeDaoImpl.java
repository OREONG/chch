package com.chch.chch.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Like_table;

@Repository
public class LikeDaoImpl implements LikeDao{

	@Autowired
	private SqlSessionTemplate sst;

	//작품 관심
	public int insertAuthor(Like_table like_table) {
		return sst.insert("like_tablens.insertAuthor", like_table);
	}

	//작품 관심 불러오기
	public Like_table selectAuthor(Map<String, Object> map) {
		return sst.selectOne("like_tablens.selectAuthor", map);
	}

	//작품 관심 삭제
	public int deleteAuthor(Map<String, Object> map) {
		return sst.delete("like_tablens.deleteAuthor", map);
	}

	//글 좋아요
	public int insertReview(Like_table like_table) {
		return sst.insert("like_tablens.insertReview", like_table);
	}

	//글 좋아요 취소
	public int deleteReview(Map<String, Object> map) {
		return sst.insert("like_tablens.deleteReview", map);
	}

	//댓글 좋아요 불러오기
	public Like_table selectReivew(Map<String, Object> map) {
		return sst.selectOne("like_tablens.selectReivew", map);
	}

	//댓글 좋아요 불러오기
	public Like_table selectLike_table(Map<String, Object> map) {
		return sst.selectOne("like_tablens.selectLike_table", map);
	}

	//댓글 좋아요 갯수
	public int updateReviewLike(int review_no) {
		return sst.update("like_tablens.updateReviewLike", review_no);
	}

}
