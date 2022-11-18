package com.chch.chch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Author;
import com.chch.chch.model.Author_work;
import com.chch.chch.model.Review;

@Repository
public class AuthorDaoImpl implements AuthorDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	//작품 소개 모두 전체 불러오기(관심 수 정렬)
	public List<Author> allList() {
		return sst.selectList("authorns.authorAllList");
	}
	//작품 소개 모두 전체 불러오기(날짜 순 정렬)
	public List<Author> allList_date(Author author2) {
		return sst.selectList("authorns.allList_date", author2);
	}
	//작품 (소개) 등록
	public int insert(Author author) {
		return sst.insert("authorns.insert", author);
	}

	//작품 소개 한사람 전체 불러오기
	public List<Author> list(Author author) {
		return sst.selectList("authorns.authorList", author);
	}
	
	//글 쓰기 입력
	public int insertWork(Author_work author_work) {
		return sst.insert("authorns.workInsert", author_work);
	}
	//작품 한개 불러오기
	public Author select(int author_no) {
		return sst.selectOne("authorns.select", author_no);
	}
	//작품 댓글 입력
	public int insertReview(Review review) {
		return sst.insert("authorns.insertReview", review);
	}

	//댓글 전체 가져오기
	public List<Review> selectAllReview(Review review2) {
		return sst.selectList("authorns.selectAllReview", review2);
	}
	//회차 리스트 불러오기
	public List<Author_work> authorWork_list(Author_work author_work) {
		return sst.selectList("authorns.authorWork_list", author_work);
	}
	//글 상세 페이지(글 읽는 부분)
	public Author_work selectWork(int author_work_no) {
		return sst.selectOne("authorns.selectWork", author_work_no);
	}
	//조회수
	public void updateReadCount(int author_work_no) {
		sst.update("authorns.updateReadCount", author_work_no);
		
	}
	//전체 관심 수
	public void updateLikeCount(int author_no) {
		sst.update("authorns.updateLikeCount", author_no);
		
	}
	//작품 정보 수정
	public int authorUpdate(Author author) {
		return sst.update("authorns.authorUpdate", author);
	}
	//작품 정보 삭제
	public int authorDelete(int author_no) {
		return sst.update("authorns.authorDelete", author_no);
	}
	//글(회차)수정
	public int author_workUpdate(Author_work author_work) {
		return sst.update("authorns.author_workUpdate", author_work);
	}
	//글(회차)삭제
	public int author_workDelete(int author_work_no) {
		return sst.delete("authorns.author_workDelete", author_work_no);
	}
	//리뷰 수정
	public int reviewUpdate(Review review) {
		return sst.update("authorns.reviewUpdate", review);
	}
	//리뷰 삭제 del='y'
	public int reviewDelete(int review_no) {
		return sst.update("authorns.reviewDelete", review_no);
	}
	//페이징 용 댓글 갯수
	public int getTotalReview(int author_work_no) {
		return sst.selectOne("authorns.getTotalReview", author_work_no);
	}
	//페이징 없이 댓글 가져오기
	public List<Review> selectAllReviewOri(int author_work_no) {
		return sst.selectList("authorns.selectAllReviewOri", author_work_no);
	}
	//이전화, 다음화 -> author 모델안에 author_work join
	public List<Author> authorAll(Author_work author_work2) {
		return sst.selectList("authorns.authorAll", author_work2);
	}
	//글 리스트 개수
	public int getTotalAuthor(int author_no) {
		return sst.selectOne("authorns.getTotalAuthor", author_no);
	}
	//작품 불러오기 날짜 순 - 개수
	public int getTotalAuthor_date(Author author2) {
		return sst.selectOne("authorns.getTotalAuthor_date", author2);
	}
	//내 작품 리스트 페이징 용 갯수
	public int getTotalAuthor_list(Author author) {
		return sst.selectOne("authorns.getTotalAuthor_list", author);
	}



}
