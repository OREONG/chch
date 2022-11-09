package com.chch.chch.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chch.chch.model.Author;
import com.chch.chch.model.Author_work;
import com.chch.chch.model.Like_table;
import com.chch.chch.model.Review;
import com.chch.chch.service.AuthorService;
import com.chch.chch.service.LikeService;
import com.chch.chch.service.ReviewService;

@Controller
public class AuthorController {
	@Autowired
	private AuthorService as;
	@Autowired
	private LikeService ls;
	@Autowired
	private ReviewService rs;
	
	//나도 작가되기 메인 화면(작품 등록 버튼, 작품 리스트)
	@RequestMapping("writing")
	public String writing(Model model) {
		//작품 모두 가져오기 (관심 수 정렬)
		List<Author> authorAll_list = as.allList();
		//댓글 좋아요
		for (Author author : authorAll_list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("author_no", author.getAuthor_no());
		}
		model.addAttribute("authorAll_list", authorAll_list);
		
		//작품 모두 가져오기 (날짜 순 정렬)
		List<Author> authorAllDate_list = as.allList_date();
		//댓글 좋아요
		for (Author author : authorAllDate_list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("author_no", author.getAuthor_no());
		}
		model.addAttribute("authorAllDate_list", authorAllDate_list);
		//페이징 작업
		return "/author/writing";
	}
	
	//등록한 작품들 리스트 페이지(없을경우 작품 등록페이지 authorIntro.do로 이동)
	@RequestMapping("/author/authorMain")
	public String authorMain(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		List<Author> author_list = as.list(id);
		model.addAttribute("author_list", author_list);
		//페이징 추가
		return "/author/authorMain";
	}
	
	//작품 등록 페이지
	@RequestMapping("/author/authorIntro")
	public String authorIntro() {
		return "/author/authorIntro";
	}
	
	//작품 등록 성공 여부
	@RequestMapping("/author/authorIntroConfirm")
	public String authorIntroConfirm(HttpSession session, Author author, Model model) throws IOException {
		int result = 0;
		String id = (String)session.getAttribute("id");
		author.setId(id);

		result = as.insert(author);
		model.addAttribute("result", result);
		return "/author/authorIntroConfirm";
	}
	
	//작품 각각의 상세 페이지
	@RequestMapping("/author/authorEach")
	public String authorEach(Model model, HttpSession session, int author_no) {
		String id = (String)session.getAttribute("id");
		//전체 관심 수
		as.updateLikeCount(author_no);
		Author author = as.select(author_no);
		List<Author_work> authorWork_list = as.authorWork_list(author_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("author_no", author_no);
		//관심 불러오기
		Like_table like_table = ls.selectAuthor(map);
		model.addAttribute("id", id);
		model.addAttribute("author", author);
		model.addAttribute("authorWork_list", authorWork_list);
		model.addAttribute("like_table", like_table);
		//페이징
		return "/author/authorEach";
	}
	
	//작품 속에 글 쓰기
	@RequestMapping("/author/authorWriting")
	public String authorWriting(int author_no, Model model) {
		model.addAttribute("author_no", author_no);
		return "/author/authorWriting";
	}
	
	//작품 속에 글 쓰기 성공 여부
	@RequestMapping("/author/authorWritingConfirm")
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
	@RequestMapping("/author/writingDetail")
	public String writingDetail(int author_work_no, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		//조회수
		as.updateReadCount(author_work_no);
		Author_work author_work = as.selectWork(author_work_no);
		//댓글 가져오기
		List<Review> review_list = rs.selectAllReview(author_work_no);
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
		System.out.println(review_list);
		model.addAttribute("author_work", author_work);
		model.addAttribute("review_list", review_list);
		model.addAttribute("id", id);

		return "/author/writingDetail";
	}
	
	//작품 관심
	@RequestMapping("/myPage/likeInsert_author")
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
	@RequestMapping("/myPage/likeDelete_author")
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
	@RequestMapping("/myPage/reviewWrite")
	public String reviewWrite(HttpSession session, Review review2, Model model, int author_work_no) {
		int result = 0;
		System.out.println(review2);
		String id = (String)session.getAttribute("id");
		Review review = new Review();
		review.setAuthor_work_no(author_work_no);
		review.setId(id);
		review.setReview_content(review2.getReview_content());
		result = rs.insertReview(review);
		
		model.addAttribute("result", result);
		model.addAttribute("review", review);
		
		return "/myPage/reviewWrite";
	}
	


	//댓글 좋아요
	@RequestMapping("/myPage/likeInsert_review") 
	public String likeInsert_review(HttpSession session, int review_no, Model model, int author_work_no) { 
		int result = 0; 
		
		String id = (String)session.getAttribute("id"); 
		Like_table like_table = new Like_table();
		like_table.setId(id); 
		like_table.setReview_no(review_no);
		like_table.setAuthor_work_no(author_work_no);
		
		result = ls.insertReview(like_table); 
		
		//댓글가져오기
		List<Review> review_list = rs.selectAllReview(author_work_no);
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
	@RequestMapping("/myPage/likeDelete_review") 
	public String likeDelete_review(int review_no, Model model, HttpSession session, int author_work_no) { 
		int result = 0; 
		String id = (String)session.getAttribute("id"); 
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("id", id); 
		map.put("review_no", review_no); 
		result = ls.deleteReview(map);
		
		//댓글가져오기
		List<Review> review_list = rs.selectAllReview(author_work_no);
		//댓글 좋아요 갯수
		for (Review review : review_list) {
			int review_no1 = review.getReview_no();
			ls.updateReviewLike(review_no1);
		}		

		model.addAttribute("result", result); 
		model.addAttribute("author_work_no", author_work_no);

		return "/myPage/likeDelete_review"; 
		}

}
