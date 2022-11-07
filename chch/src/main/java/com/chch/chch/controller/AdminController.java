package com.chch.chch.controller;

import java.io.File;
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

import com.chch.chch.model.Book;
import com.chch.chch.model.Inquiry;
import com.chch.chch.model.Member;
import com.chch.chch.service.BookService;
import com.chch.chch.service.InquiryService;
import com.chch.chch.service.MemberService;


@Controller
public class AdminController {
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private BookService bs;
	
	@Autowired
	private InquiryService ins;
	
//	SB 관리자 메인 화면
	@RequestMapping("adminMain")
	public String adminMain() {
		return "/admin/adminMain";
	}
	
//	SB 전체 고객 목록 (관리자 열람용, 페이징 포함)
	@RequestMapping("adminMemberList")
	public String adminMemberList(Model model, HttpSession session, String pageNum) {
		String id = (String) session.getAttribute("id");
		
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_BLOCK = 10;
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		int total = ms.getTotal();
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE);
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		
		if (endPage > totalPage) endPage = totalPage;
		List<Member> memberList = ms.memberList(startRow, endRow);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("id", id);
		
		return "/admin/adminMemberList";
	}
	
//	SB 유저 아이디 삭제 및 복구 ( del n->y, y->n 변경 가능 )
	@RequestMapping("adminMemberDelete")
	public String adminMemberDelete (Model model, HttpSession session, String id, String del) {
		if (del.equals("y")) {
			del = "n";
		} else if (del.equals("n")) {
			del = "y";
		}
		int result = ms.adminDelete(id, del);
		
		model.addAttribute("result", result);
		
		return "/admin/adminMemberDelete";
	}
	
//	SB 전체 책 목록 (관리자 열람용, 페이징 포함)
	@RequestMapping("adminBookList")
	public String adminBookList (Model model, HttpSession session, Member member, String pageNum) {
		
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_BLOCK = 10;
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		int total = bs.getTotal();
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE);
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		
		if (endPage > totalPage) endPage = totalPage;
		
		List<Book> bookList = bs.bookListAll(startRow, endRow);
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		
		return "/admin/adminBookList";
	}
	
//	SB 책 노출 여부 변경 ( del n->y, y->n 변경 가능 )
	@RequestMapping("adminBookDelete")
	public String adminBookDelete (Model model, String[] selectChk) {
		
		String[] selectDelete =selectChk;
		String[] delList= new String[selectDelete.length];
		
		if (selectDelete[0].equals("selectAll")) {
			for (int i = 1; i < selectDelete.length; i++) {
				if (bs.delList(selectDelete[i]).equals("n")) {
					delList[i-1] = "y";
				} else if (bs.delList(selectDelete[i]).equals("y")) {
					delList[i-1] = "n";
				}
			}
		} else {
			for (int i = 0; i < selectDelete.length; i++) {
				if (bs.delList(selectDelete[i]).equals("n")) {
					delList[i] = "y";
				} else if (bs.delList(selectDelete[i]).equals("y")) {
					delList[i] = "n";
				}
			}
		}
		
		int result=0;

		if (selectDelete[0].equals("selectAll")) {
			for (int i = 1; i < selectDelete.length; i++) {
				result=bs.deleteBook(delList[i-1], selectDelete[i]);
			}
		} else { 
			for (int i = 0; i < selectDelete.length; i++) {
				result=bs.deleteBook(delList[i], selectDelete[i]);
			}
		}
		
		model.addAttribute("result", result);
		
		return "/admin/adminBookDelete";
	}
	
//	SB 책 상세 정보 확인
	@RequestMapping("adminBookDetail")
	public String adminBookDetail (Model model, HttpSession session, int book_no) {
		Book book = bs.select(book_no);
		
		model.addAttribute("book", book);
		return "/admin/adminBookDetail";
	}
	
//	SB 책 정보 변경
	@RequestMapping("adminBookUpdate")
	public String adminBookUpdate (@RequestParam("file") MultipartFile mf1, @RequestParam("file2") MultipartFile mf2,
			Model model, HttpSession session, Book book) throws IOException {
		
		String fileName1 = mf1.getOriginalFilename();
		
		String fileName2 = mf2.getOriginalFilename();
		
		if (fileName1 == null || fileName1.equals("")) {
			fileName1 = book.getCurrentFile();
		}
		book.setBook_image(fileName1);
		
		if (fileName2 == null || fileName2.equals("") ) {
			fileName2 = book.getCurrentFile2();
		}
		book.setBook_imagedetail(fileName2);

		if (book.getBook_kind() == null || book.getBook_kind().equals("")) {
			book.setBook_kind(book.getCurrentKind());
		}
		
		int result = bs.update(book);
		model.addAttribute("result", result);
		
		return "/admin/adminBookUpdate";
	}
	
//	SB 신규 책 등록화면
	@RequestMapping("adminBookAddForm")
	public String adminBookAddForm (Model model, HttpSession session) {
		
		return "/admin/adminBookAddForm";
	}
	
//	SB 신규 책 등록 실행
	@RequestMapping("adminBookAdd")
	public String adminBookAdd (@RequestParam("file") MultipartFile mf1, @RequestParam("file2") MultipartFile mf2,
			Model model, HttpSession session, Book book) throws IOException {
		
		String fileName1 = mf1.getOriginalFilename();
		String fileName2 = mf2.getOriginalFilename();
		String real = session.getServletContext().getRealPath("/resources/fileSave");
		FileOutputStream fos1 = new FileOutputStream(new File(real + "/" + fileName1));
		FileOutputStream fos2 = new FileOutputStream(new File(real + "/" + fileName2));
		fos1.write(mf1.getBytes());
		fos2.write(mf2.getBytes());
		fos1.close();
		fos2.close();
		
		book.setBook_image(fileName1);
		book.setBook_imagedetail(fileName2);

		int result = bs.insert(book);
		
		model.addAttribute("result", result);
		
		return "/admin/adminBookAdd";
	}
	
	@RequestMapping("adminInquiryBeforeList")
	public String adminInquiryBeforeList(Model model, HttpSession session, String pageNum, int inquiryNumber) {
		
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_BLOCK = 10;
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		int total = ins.getTotal();
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE);
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		
		if (endPage > totalPage) endPage = totalPage;
		
		String reply = "n";
		List<Inquiry> replyList = ins.replyList(startRow, endRow, reply);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("inquiryNumber", inquiryNumber);
		
		return "/admin/adminInquiryBeforeList";
	}
	
	@RequestMapping("adminInquiryReply")
	public String adminInquiryReply (Model model, HttpSession session, Inquiry inquiry) {
		
		inquiry.setReply_content(inquiry.getReply_content().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
		
		int result = ins.replySubmit(inquiry);
		
		model.addAttribute("inquiryNumber", inquiry.getInquiryNumber());
		model.addAttribute("result", result);
		
		return "/admin/adminInquiryReply";
	}
	
	@RequestMapping("adminInquiryAfterList")
	public String adminInquiryAfterList (Model model, HttpSession session, String pageNum, int inquiryNumber) {
		
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_BLOCK = 10;
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		int total = ins.getTotal();
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE);
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		
		if (endPage > totalPage) endPage = totalPage;
		
		String reply = "y";
		List<Inquiry> replyList = ins.replyList(startRow, endRow, reply);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("inquiryNumber", inquiryNumber);
		
		return "/admin/adminInquiryAfterList";
	}
	
	
}
