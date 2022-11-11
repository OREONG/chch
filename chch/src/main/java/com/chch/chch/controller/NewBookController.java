package com.chch.chch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.model.Book;
import com.chch.chch.model.Like_list;
import com.chch.chch.model.Review;
import com.chch.chch.service.Like_listService;
import com.chch.chch.service.NewBookService;
import com.chch.chch.service.PagingBean;

@Controller
public class NewBookController {
	@Autowired
	private NewBookService ns;
	@Autowired
	private Like_listService ls;
	
	@RequestMapping("/newBook/newList")
	public String newList(Model model, Book book, String pageNum) {
		List<Book> list = ns.bookList();
		int rowPerPage = 12; // 占쎈읂占쎌뵠筌욑옙 占쎈뼣 野껊슣�뻻疫뀐옙 揶쏉옙占쎈땾
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ns.getTotal(book);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		book.setStartRow(startRow);
		book.setEndRow(endRow);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("list", list);
		model.addAttribute("book", book);
		model.addAttribute("pb", pb);
		model.addAttribute("pageNum",pageNum);
		return "/newBook/newList";
	}
	
	@RequestMapping("/newBook/newDetail")
	public String newDetail(HttpSession session,int book_no, Model model, Book book, Review review,Like_list like_list,String pageNum) {
		String id = (String)session.getAttribute("id");
		book = ns.selectbook(book_no);
		List<Review> list = ns.reviewList(book_no);
		int review_cnt = ns.review_cnt(book_no);
		//List<Like_list> newBookLike = ls.newBookLike(id,book_no,like_list);
		
		model.addAttribute("id",id);
		model.addAttribute("review_cnt", review_cnt);
		model.addAttribute("list", list);
		model.addAttribute("review", review);
		model.addAttribute("book", book);
		model.addAttribute("book_no", book_no);
		model.addAttribute("pageNum",pageNum);
		//System.out.println(newBookLike);
		//model.addAttribute("newBookLike",newBookLike);
		//model.addAttribute("like_list",like_list);
		return "newBook/newDetail";
	}
	
}
