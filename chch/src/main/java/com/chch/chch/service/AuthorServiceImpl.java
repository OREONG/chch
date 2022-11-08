package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.AuthorDao;
import com.chch.chch.model.Author;
import com.chch.chch.model.Author_work;


@Service
public class AuthorServiceImpl implements AuthorService{
	@Autowired
	private AuthorDao ad;

	//작품 소개 모두 전체 불러오기(관심 수 정렬)
	public List<Author> allList() {
		return ad.allList();
	}
	//작품 소개 모두 전체 불러오기(날짜 순 정렬)
	public List<Author> allList_date() {
		return ad.allList_date();
	}
	//작품 (소개) 등록
	public int insert(Author author) {
		return ad.insert(author);
	}

	//작품 소개 한사람 전체 불러오기
	public List<Author> list(String id) {
		return ad.list(id);
	}
	
	//글 쓰기 입력
	public int insertWork(Author_work author_work) {
		return ad.insertWork(author_work);
	}
	//작품 한개 불러오기
	public Author select(int author_no) {
		return ad.select(author_no);
	}
	//회차 리스트 불러오기
	public List<Author_work> authorWork_list(int author_no) {
		return ad.authorWork_list(author_no);
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


}
