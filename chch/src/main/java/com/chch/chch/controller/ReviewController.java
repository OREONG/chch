package com.chch.chch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.model.Member;
import com.chch.chch.model.Review;
import com.chch.chch.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService rs;
	
	@RequestMapping("reviewInsert.do")
	public String reviewInsert(Review review, Model model, Member member, HttpSession session) {
		member.getId();
		int result = 0;
		String id = (String) session.getAttribute("id");
		if (id == null || id == "") {
			result = -1;
		}
		else {
		review.setId(id);
		result = rs.insert(review);
		}
		model.addAttribute("review", review);
		model.addAttribute("result", result);
		return "review/reviewInsert";
	}
	
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate(Review review, Model model, HttpSession session) {
		int result = 0;
		result = rs.update(review);
		model.addAttribute("result", result);
		model.addAttribute("review", review);
		return "review/reviewUpdate";
	}
	
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(Review review,  Model model, Member member, HttpSession session) {
		int result = 0;
		String id = (String) session.getAttribute("id");
		review.setId(id);
		result = rs.delete(review);
		model.addAttribute("result", result);
		return "review/reviewDelete";
	}
}
