package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Author;
import com.chch.chch.model.Author_work;
import com.chch.chch.model.Like_table;

public interface AuthorService {

	//작품 소개 모두 전체 불러오기(관심 수 정렬)
	List<Author> allList();
	//작품 소개 모두 전체 불러오기(날짜 순 정렬)
	List<Author> allList_date();
	//작품 소개 입력
	int insert(Author author);
	//작품 소개 한사람 전체 불러오기
	List<Author> list(String id);
	//글 쓰기 입력
	int insertWork(Author_work author_work);
	//작품 한개 불러오기
	Author select(int author_no);
	//회차 리스트 불러오기
	List<Author_work> authorWork_list(int author_no);
	//글 상세 페이지(글 읽는 부분) 불러오기
	Author_work selectWork(int author_work_no);
	//조회수
	void updateReadCount(int author_work_no);
	//전체 관심 수
	void updateLikeCount(int author_no);
	
	//작품 정보 수정
	int authorUpdate(Author author);
	//작품 정보 삭제
	int authorDelete(int author_no);
	//글(회차)수정
	int author_workUpdate(Author_work author_work);
	//글(회사)삭제
	int author_workDelete(int author_work_no);
	


}
