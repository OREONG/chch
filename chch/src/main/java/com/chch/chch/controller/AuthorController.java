package com.chch.chch.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.chch.chch.service.PagingBean;
import com.chch.chch.model.Author;
import com.chch.chch.model.Author_work;
import com.chch.chch.model.Like_table;
import com.chch.chch.model.Report;
import com.chch.chch.model.Review;
import com.chch.chch.service.AuthorService;
import com.chch.chch.service.LikeService;


@Controller
public class AuthorController {
	@Autowired
	private AuthorService as;
	@Autowired
	private LikeService ls;

	
	//나도 작가되기 메인 화면(작품 등록 버튼, 작품 리스트)
	@RequestMapping("writing")
	public String writing(Model model, String pageNum, Author author2) {
		//작품 모두 가져오기 (관심 수 정렬)
		List<Author> authorAll_list = as.allList();
		//댓글 좋아요
		for (Author author : authorAll_list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("author_no", author.getAuthor_no());
		}
		model.addAttribute("authorAll_list", authorAll_list);
		
		//작품 모두 가져오기 (날짜 순 정렬)
		//페이징
		int rowPerPage = 10; //한 화면에 보여주는 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotalAuthor_date(author2);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		author2.setStartRow(startRow);
		author2.setEndRow(endRow);
		List<Author> authorAllDate_list = as.allList_date(author2);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);		
		
		//댓글 좋아요
		for (Author author : authorAllDate_list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("author_no", author.getAuthor_no());
		}
		model.addAttribute("authorAllDate_list", authorAllDate_list);
		model.addAttribute("author", author2); 
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		//페이징 작업
		return "/author/writing";
	}
	
	//등록한 작품들 리스트 페이지
	@RequestMapping("authorMain")
	public String authorMain(HttpSession session, Model model, String pageNum, Author author) {
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		//페이징
		int rowPerPage = 10; //한 화면에 보여주는 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		author.setId(id);
		int total = as.getTotalAuthor_list(author);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		author.setStartRow(startRow);
		author.setEndRow(endRow);
		List<Author> author_list = as.list(author);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);	
		
		model.addAttribute("author_list", author_list);
		model.addAttribute("author", author); 
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("id",id);
		
		return "/author/authorMain";
	}
	
	//작품 등록 페이지
	@RequestMapping("authorIntro")
	public String authorIntro() {
		return "/author/authorIntro";
	}
	
	//작품 등록 성공 여부
	@RequestMapping("authorIntroConfirm")
	public String authorIntroConfirm(HttpSession session, Author author, Model model) throws IOException {
		int result = 0;
		String id = (String)session.getAttribute("id");
		author.setId(id);

		result = as.insert(author);
		model.addAttribute("result", result);
		return "/author/authorIntroConfirm";
	}
	
	//작품 각각의 상세 페이지
	@RequestMapping("authorEach")
	public String authorEach(Model model, HttpSession session, int author_no, String pageNum) {
		String id = (String)session.getAttribute("id");
		//전체 관심 수
		as.updateLikeCount(author_no);
		Author author = as.select(author_no);
		
		Author_work author_work = new Author_work();
		author_work.setAuthor_no(author_no);
		//회차 가져오기+페이징
		int rowPerPage = 5; //한 화면에 보여주는 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotalAuthor(author_no);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		author_work.setStartRow(startRow);
		author_work.setEndRow(endRow);
		List<Author_work> authorWork_list = as.authorWork_list(author_work);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("author_no", author_no);
		
		//관심 불러오기
		Like_table like_table = ls.selectAuthor(map);
		
		//첫화보기
		Author_work author_work2 = new Author_work();
		author_work2.setAuthor_no(author_work.getAuthor_no());		
		List<Author> authorAll = as.authorAll(author_work2);
		
		int[] author_work_noArr = new int [authorAll.size()];
		
		int i = 0;
		int first_no = 10000; //author_work가 같은 글 중 author_work_no의 가장 작은 값(첫 화)

		for(Author authorall : authorAll) {
			author_work_noArr[i] = authorall.getAuthor_work_no();
			//첫 화
			if (author_work_noArr[i] < first_no) {
				first_no = author_work_noArr[i];
			}
			i = i + 1;
		}

		model.addAttribute("id", id);
		model.addAttribute("author", author);
		model.addAttribute("authorWork_list", authorWork_list);
		model.addAttribute("like_table", like_table);
		model.addAttribute("first_no", first_no);
		
		model.addAttribute("author_no", author_no);
		model.addAttribute("total", total);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		return "/author/authorEach";
	}
	
	//작품 속에 글 쓰기
	@RequestMapping("authorWriting")
	public String authorWriting(int author_no, Model model) {
		model.addAttribute("author_no", author_no);
		return "/author/authorWriting";
	}
	
	//작품 속에 글 쓰기 성공 여부
	@RequestMapping("authorWritingConfirm")
	public String authorWritingConfirm(Author_work author_work, Model model, HttpSession session) {
		int result = 0;
		String id = (String)session.getAttribute("id");
		author_work.setId(id);
		result = as.insertWork(author_work);
		model.addAttribute("author_work", author_work);
		model.addAttribute("result", result);
		return "/author/authorWritingConfirm";
	}
	
	//글 상세 페이지(글 읽는 부분)
	@RequestMapping("writingDetail")
	public String writingDetail(Review review2, int author_work_no, Model model, HttpSession session, String pageNum) {
		String id = (String)session.getAttribute("id");
	
		//조회수
		as.updateReadCount(author_work_no);
		Author_work author_work = as.selectWork(author_work_no);
		
		//댓글 가져오기+페이징
		int rowPerPage = 5; //한 화면에 보여주는 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotalReview(author_work_no);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		review2.setAuthor_work_no(author_work_no);
		review2.setStartRow(startRow);
		review2.setEndRow(endRow);
		List<Review> review_list = as.selectAllReview(review2);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		//댓글 좋아요
		for (Review review : review_list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("review_no", review.getReview_no());
			Like_table lt = ls.selectLike_table(map);
			if (lt == null )
				review.setLike_review_no(0);
			else
				review.setLike_review_no(1);
			
			
		}
		
		//이전화, 다음화
		Author_work author_work2 = new Author_work();

		author_work2.setAuthor_no(author_work.getAuthor_no());		
		List<Author> authorAll = as.authorAll(author_work2);
		
		int[] author_work_noArr = new int [authorAll.size()-1];
		int[] author_work_noArr2 = new int [authorAll.size()-1];
		
		int i = 0;
		int pre_no = 0; //작은 수 중에 가장 큰 값
		int next_no = 10000; //큰 수 중에 가장 작은 값

		for(Author authorall : authorAll) {
			
			//이전화
			if(author_work_no > authorall.getAuthor_work_no()) {
				author_work_noArr[i] = authorall.getAuthor_work_no();
				if (author_work_noArr[i] > pre_no) {
					pre_no = author_work_noArr[i];
				}
				i = i + 1;
			}
			//다음화
			else if(author_work_no < authorall.getAuthor_work_no()) {
				
				author_work_noArr2[i] = authorall.getAuthor_work_no();
				if (author_work_noArr2[i] < next_no) {
					next_no = author_work_noArr2[i];
				}		
				i = i + 1;
			}
		}
		
		model.addAttribute("id", id);
		model.addAttribute("author_work", author_work);
		model.addAttribute("review_list", review_list);
		model.addAttribute("author_work_no", author_work_no);
		model.addAttribute("review2", review2); 
		model.addAttribute("total", total);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		
		model.addAttribute("next_no", next_no);
		model.addAttribute("pre_no", pre_no);

		return "/author/writingDetail";
	}
	

	
	
	//작품 관심
	@RequestMapping("likeInsert_author")
	public String likeInsert_author(HttpSession session, int author_no, Model model) {
		int result = 0;
		String id = (String)session.getAttribute("id");
		Like_table like_table = new Like_table();
		like_table.setId(id);
		like_table.setAuthor_no(author_no);
		
		result = ls.insertAuthor(like_table);
		model.addAttribute("result", result);
		model.addAttribute("author_no", author_no);
		return "/myPage/likeInsert_author";
	}
	
	//작품 관심 취소
	@RequestMapping("likeDelete_author")
	public String likeDelete_author(int author_no, Model model, HttpSession session) {
		int result = 0;
		String id = (String)session.getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("author_no", author_no);
		result = ls.deleteAuthor(map);
		model.addAttribute("result", result);
		model.addAttribute("author_no", author_no);
		return "/myPage/likeDelete_author";
	}
	
	//작품 댓글 입력
	@RequestMapping("reviewWrite")
	public String reviewWrite(HttpSession session, Review review2, Model model, int author_work_no) {
		int result = 0;
		System.out.println(review2);
		String id = (String)session.getAttribute("id");
		Review review = new Review();
		review.setAuthor_work_no(author_work_no);
		review.setId(id);
		review.setReview_content(review2.getReview_content());
		result = as.insertReview(review);
		
		model.addAttribute("result", result);
		model.addAttribute("review", review);
		
		return "/myPage/reviewWrite";
	}
	


	//댓글 좋아요
	@RequestMapping("likeInsert_review") 
	public String likeInsert_review(HttpSession session, int review_no, Model model, int author_work_no) { 
		int result = 0; 
		
		String id = (String)session.getAttribute("id"); 
		Like_table like_table = new Like_table();
		like_table.setId(id); 
		like_table.setReview_no(review_no);
		like_table.setAuthor_work_no(author_work_no);
		
		result = ls.insertReview(like_table); 
		
		//댓글가져오기
		List<Review> review_list = as.selectAllReviewOri(author_work_no);
		System.out.println(review_list);
		//댓글 좋아요 갯수
		for (Review review : review_list) {
			int review_no1 = review.getReview_no();
			ls.updateReviewLike(review_no1);
		}
		
		model.addAttribute("result", result); 
		model.addAttribute("like_table", like_table); 
		return "/myPage/likeInsert_review"; 
		
	}

	//댓글 좋아요 취소
	@RequestMapping("likeDelete_review") 
	public String likeDelete_review(int review_no, Model model, HttpSession session, int author_work_no) { 
		int result = 0; 
		String id = (String)session.getAttribute("id"); 
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("id", id); 
		map.put("review_no", review_no); 
		result = ls.deleteReview(map);
		
		//댓글가져오기
		List<Review> review_list = as.selectAllReviewOri(author_work_no);
		//댓글 좋아요 갯수
		for (Review review : review_list) {
			int review_no1 = review.getReview_no();
			ls.updateReviewLike(review_no1);
		}		

		model.addAttribute("result", result); 
		model.addAttribute("author_work_no", author_work_no);

		return "/myPage/likeDelete_review"; 
		}
	
	
	
	
	//작품 수정
	@RequestMapping("authorUpdate")
	public String authorUpdate(int author_no, Model model) {
		Author author = as.select(author_no);
		model.addAttribute("author", author);
		return "/author/authorUpdate";
	}
	@RequestMapping("authorUpdateConfirm")
	public String authorUpdateConfirm(Author author, int author_no, Model model) {
		int result = 0;
		author.setAuthor_no(author_no);
		result = as.authorUpdate(author);
		model.addAttribute("result", result);
		model.addAttribute("author", author);
		return "/author/authorUpdateConfirm";
	}
	
	//작품 삭제 del='y'
	@RequestMapping("authorDeleteConfirm")
	public String authorDeleteConfirm(int author_no, Model model) {
		int result = 0;
		result = as.authorDelete(author_no);
		model.addAttribute("result", result);
		return "/author/authorDeleteConfirm";
	}
	
	//글 수정
	@RequestMapping("author_workUpdate")
	public String author_workUpdate(int author_work_no, Model model) {
		Author_work author_work = as.selectWork(author_work_no);
		model.addAttribute("author_work", author_work);
		return "/author/author_workUpdate";
	}
	@RequestMapping("author_workUpdateConfirm")
	public String author_workUpdateConfirm(Author_work author_work, Model model) {
		int result = 0;
		result = as.author_workUpdate(author_work);
		model.addAttribute("result", result);
		model.addAttribute("author_work", author_work);
		return "/author/author_workUpdateConfirm";
	}
	//글 삭제
	@RequestMapping("author_workDeleteConfirm")
	public String author_workDeleteConfirm(int author_work_no, Model model) {
		int result = 0;
		Author_work author_work = as.selectWork(author_work_no);
		result = as.author_workDelete(author_work_no);
		model.addAttribute("result", result);
		model.addAttribute("author_work", author_work);
		return "/author/author_workDeleteConfirm";
	}
	
	//리뷰 수정
	@RequestMapping(value = "reviewUpdate", produces = "text/html;charset=utf-8")
	@ResponseBody 
	public String reviewUpdate(Review review) {
		String msg = "";
		int result = 0;
		result = as.reviewUpdate(review);
		if(result == 1) msg = "y";
		else msg = "n";
		return msg;
	}
	
	//리뷰 삭제
	@RequestMapping("reviewDelete")
	public String reviewDelete(int review_no, int author_work_no, Model model) {
		int result = 0;
		result = as.reviewDelete(review_no);
		System.out.println(result);
		model.addAttribute("result", result);
		model.addAttribute("author_work_no", author_work_no);
		return "/author/reviewDelete";
	}
}
