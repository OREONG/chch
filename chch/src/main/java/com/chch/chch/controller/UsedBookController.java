package com.chch.chch.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.chch.chch.model.Book;
import com.chch.chch.model.Used;
import com.chch.chch.service.PagingBean;
import com.chch.chch.service.UsedBookService;

@Controller
public class UsedBookController {
	@Autowired
	private UsedBookService us;
	
	@RequestMapping("/usedBook/usedList")
	public String usedList(Model model, Used used, String pageNum) {
		int rowPerPage = 12; // 페이지 당 게시글 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = us.getTotal(used);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		used.setStartRow(startRow);
		used.setEndRow(endRow);
		List<Used> list = us.usedBookList(used);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("list", list);
		model.addAttribute("used", used);
		model.addAttribute("pb", pb);
		model.addAttribute("num", num);
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
	
	@RequestMapping("/usedBook/usedAdd")
	public String usedAdd(Model model, Used used, HttpSession session, String used_subject) throws IOException {

		int result = 0;
		String id = (String)session.getAttribute("id");
		used.setId(id);
		//사진을 수정 할 수도 있고, 안할 수도 있음(안하면 fileName에 null 또는 공란이 넘어옴)
		String fileName = used.getFile().getOriginalFilename();
		System.out.println(fileName);
		//사진이 넘어왔을 때만 파일을 넣어 줌
		if(fileName != null && !fileName.equals("")) {
			used.setUsed_image(fileName);
			String real = session.getServletContext().getRealPath("/resources/images");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(used.getFile().getBytes());
			fos.close();
		}
		result = us.insertUsed(used);
		
		model.addAttribute("result", result);
		return "/usedBook/usedAdd";
	}
	
	@RequestMapping("/usedBook/usedSearch")
	public String usedSearch(String searchText, Used used, Book book, Model model) {
		List<Book> bookList = us.bookSearch(searchText);
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("book", book);
		return "/usedBook/usedSearch";
	}
}
