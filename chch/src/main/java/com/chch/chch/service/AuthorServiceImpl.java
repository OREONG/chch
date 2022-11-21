package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.AuthorDao;
import com.chch.chch.model.Author;
import com.chch.chch.model.Author_work;
import com.chch.chch.model.Review;


@Service
public class AuthorServiceImpl implements AuthorService{
	@Autowired
	private AuthorDao ad;

	//작품 소개 모두 전체 불러오기(관심 수 정렬)
	public List<Author> allList() {
		return ad.allList();
	}
	//작품 소개 모두 전체 불러오기(날짜 순 정렬)
	public List<Author> allList_date(Author author2) {
		return ad.allList_date(author2);
	}
	//작품 (소개) 등록
	public int insert(Author author) {
		return ad.insert(author);
	}

	//작품 소개 한사람 전체 불러오기
	public List<Author> list(Author author) {
		return ad.list(author);
	}
	
	//글 쓰기 입력
	public int insertWork(Author_work author_work) {
		return ad.insertWork(author_work);
	}
	//작품 한개 불러오기
	public Author select(int author_no) {
		return ad.select(author_no);
	}
	
	//작품 댓글 입력
	public int insertReview(Review review) {
		return ad.insertReview(review);
	}

	//댓글 전체 가져오기
	public List<Review> selectAllReview(Review review2) {
		return ad.selectAllReview(review2);
	}
	
	//회차 리스트 불러오기
	public List<Author_work> authorWork_list(Author_work author_work) {
		return ad.authorWork_list(author_work);
	}
	//글 상세 페이지(글 읽는 부분)
	public Author_work selectWork(int author_work_no) {
		return ad.selectWork(author_work_no);
	}
	//조회수
	public void updateReadCount(int author_work_no) {
		ad.updateReadCount(author_work_no);
		
	}
	//전체 관심 수
	public void updateLikeCount(int author_no) {
		ad.updateLikeCount(author_no);
		
	}
	//작품 정보 수정
	public int authorUpdate(Author author) {
		return ad.authorUpdate(author);
	}
	//작품 정보 삭제
	public int authorDelete(int author_no) {
		return ad.authorDelete(author_no);
	}
	//글(회차)수정
	public int author_workUpdate(Author_work author_work) {
		return ad.author_workUpdate(author_work);
	}
	//글(회차)삭제
	public int author_workDelete(int author_work_no) {
		return ad.author_workDelete(author_work_no);
	}
	//리뷰 수정
	public int reviewUpdate(Review review) {
		return ad.reviewUpdate(review);
	}
	//리뷰 삭제
	public int reviewDelete(int review_no) {
		return ad.reviewDelete(review_no);
	}
	//페이징 용 댓글 갯수
	public int getTotalReview(int author_work_no) {
		return ad.getTotalReview(author_work_no);
	}
	//페이징 없이 댓글 가져오기
	public List<Review> selectAllReviewOri(int author_work_no) {
		return ad.selectAllReviewOri(author_work_no);
	}
	//이전화, 다음화 -> author 모델안에 author_work join
	public List<Author> authorAll(Author_work author_work2) {
		return ad.authorAll(author_work2);
	}
	//글 리스트 갯수
	public int getTotalAuthor(int author_no) {
		return ad.getTotalAuthor(author_no);
	}
	//작품 불러오기 날짜순 - 갯수
	public int getTotalAuthor_date(Author author2) {
		return ad.getTotalAuthor_date(author2);
	}
	//내 작품 리스트 페이징 용 갯수
	public int getTotalAuthor_list(Author author) {
		return ad.getTotalAuthor_list(author);
	}


}
