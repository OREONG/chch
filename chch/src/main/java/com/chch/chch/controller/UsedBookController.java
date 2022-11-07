package com.chch.chch.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.model.Used;
import com.chch.chch.service.PagingBean;
import com.chch.chch.service.UsedBookService;

@Controller
public class UsedBookController {
	@Autowired
	private UsedBookService us;
	
	@RequestMapping("/usedBook/usedList")
	public String usedList(Model model, Used used, String pageNum) {
		
		List<Used> list = us.usedBookList();
		
		int rowPerPage = 12; // �럹�씠吏� �떦 寃뚯떆湲� 媛��닔
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = us.getTotal(used);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		
		used.setStartRow(startRow);
		used.setEndRow(endRow);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("list", list);
		model.addAttribute("used", used);
		model.addAttribute("pb", pb);
		return "/usedBook/usedList";
	}
	
	@RequestMapping("/usedBook/usedDetail")
	public String usedBook(int used_no, Model model, Used used) {
		used = us.selectUsed(used_no);
		model.addAttribute("used", used);
		return "/usedBook/usedDetail";
	}
	
	@RequestMapping("/usedBook/usedAddForm")
	public String usedAddForm() {
		
		return "/usedBook/usedAddForm";
	}
	
	@RequestMapping("/usedBook/usedSearch")
	public String usedSearch() {
//		String searchText = request.getParameter("searchText");
//		request.setAttribute("searchText", searchText);
//		List<Book> bookList = us.bookSearch(searchText);
//		request.setAttribute("bookList", bookList);
		return "/usedBook/usedSearch";
	}
	
}
