package com.chch.chch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Review review) {
		return sst.insert("reviewns.insert", review);
	}

	@Override
	public int update(Review review) {
		return sst.update("reviewns.update", review);
	}

	@Override
	public int delete(Review review) {
		return sst.delete("reviewns.delete", review);
	}
	//작품 댓글 입력
	public int insertReview(Review review) {
		return sst.insert("authorns.insertReview", review);
	}

	//댓글 전체 가져오기
	public List<Review> selectAllReview(int author_work_no) {
		return sst.selectList("authorns.selectAllReview", author_work_no);
	}

}
