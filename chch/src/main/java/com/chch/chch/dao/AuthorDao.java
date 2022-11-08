package com.chch.chch.dao;

import java.util.List;

import com.chch.chch.model.Author;
import com.chch.chch.model.Author_work;

public interface AuthorDao {
	
	//작품 소개 모두 전체 불러오기(관심 수 정렬)
	List<Author> allList();
	//작품 소개 모두 전체 불러오기(날짜 순 정렬)
	List<Author> allList_date();
	
	//작품 (소개) 등록
	int insert(Author author);
	
	//작품 소개 한사람 전체 불러오기
	List<Author> list(String id);
	
	//글 쓰기 입력
	int insertWork(Author_work author_work);
	//작품 한개 불러오기
	Author select(int author_no);
	//회차 리스트 불러오기
	List<Author_work> authorWork_list(int author_no);
	//글 상세 페이지(글 읽는 부분)
	Author_work selectWork(int author_work_no);
	//조회수
	void updateReadCount(int author_work_no);
	//전체 관심 수
	void updateLikeCount(int author_no);


	

}
