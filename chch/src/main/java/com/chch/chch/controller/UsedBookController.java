package com.chch.chch.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chch.chch.model.Book;
import com.chch.chch.model.Deal;
import com.chch.chch.model.Used;
import com.chch.chch.service.DealService;
import com.chch.chch.service.MoneyService;
import com.chch.chch.service.PagingBean;
import com.chch.chch.service.UsedBookService;

@Controller
public class UsedBookController {
	@Autowired
	private UsedBookService us;
	@Autowired
	private DealService ds;
	@Autowired
	
	private MoneyService ms;
	
//	by.현서 중고도서 리스트
	@RequestMapping("usedList")
	public String usedList(Model model, Used used, String pageNum, String status) {
		// 중고 리스트 페이징
		int rowPerPage = 12; // 페이지 당 게시글 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = us.getTotal(used);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		used.setStartRow(startRow);
		used.setEndRow(endRow);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		// 선택한 status에 따른 중고 글 리스트
		used.setStatus(status);
		List<Used> list = us.usedBookList(used);
		
		model.addAttribute("list", list);
		model.addAttribute("used", used);
		model.addAttribute("pb", pb);
		model.addAttribute("num", num);
		return "/usedBook/usedList";
	}
	
//	by.현서 중고도서 상세
	@RequestMapping("usedDetail")
	public String usedBook(int used_no, String purchase_id, Deal deal, Model model, Used used, HttpSession session) {
//		String id = (String)session.getAttribute("id");
		used = us.selectUsed(used_no);
		deal = ds.selectUsed(used_no);
		model.addAttribute("used", used);
		model.addAttribute("deal", deal);
		return "/usedBook/usedDetail";
	}
	
	@RequestMapping("usedAddForm")
	public String usedAddForm() {
		return "/usedBook/usedAddForm";
	}
	
//	by.현서 중고도서 등록
	@RequestMapping("usedAdd")
	public String usedAdd(Model model, Used used, HttpSession session, String used_subject) throws IOException {

		int result = 0;
		// 세션에서 id를 가져옴
		String id = (String)session.getAttribute("id");
		// used 객체에 id 추가
		used.setId(id);
		// 업로드 할 사진 파일 이름을 fileName으로 저장
		String fileName = used.getFile().getOriginalFilename();
		// 사진이 들어오면 실행(업로드 하지 않으면 null값 저장)
		if(fileName != null && !fileName.equals("")) {
			// used에 fileName 저장 
			used.setUsed_image(fileName);
			// real에 /resources/images 저장경로 저장
			String real = session.getServletContext().getRealPath("/resources/images");
			// fos에 경로+파일이름으로 이미지 파일 저장경로 설정
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			// 파일 저장
			fos.write(used.getFile().getBytes());
			// fos종료
			fos.close();
		}
		result = us.insertUsed(used);
		
		model.addAttribute("result", result);
		return "/usedBook/usedAdd";
	}
	
//	by.현서 중고도서 검색
	@RequestMapping("usedSearch")
	public String usedSearch(String searchText, Used used, Book book, Model model) {
		List<Book> bookList = us.bookSearch(searchText);
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("book", book);
		return "/usedBook/nolay/usedSearch";
	}
	
//	by.현서 중고 글 상태 변경
	@RequestMapping("changeStatus")
	public String changeStatus(Model model, String status, int used_no) {
		int result = 0;
		
		// status와 used_no를 map에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("used_no", used_no);
		
		result = us.updateStatus(map);
		
		model.addAttribute("result", result);
		model.addAttribute("used_no", used_no);
		return "/usedBook/changeStatus";
	}
	
	/* HYC */
	/*중고 판매 확정*/
	@RequestMapping("usedSell")
	public String usedSell(int used_price, int used_no, int book_no, Used used, Book book, Deal deal, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		int result = us.update2(used_no);
		model.addAttribute("result", result);
		return "/usedBook/usedSell";
	}

	/* 중고 예약하기  */
	@RequestMapping("usedBuy")
	public String usedBuy(int used_price, String seller_id, String purchase_id, int used_no, int book_no, Used used, Book book, Deal deal, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		int maxDealGroup3 = ds.max3()+1;
		us.update(used_no);
		deal.setDeal_group(maxDealGroup3);
		deal.setPurchase_id(purchase_id);
		deal.setSeller_id(seller_id);
		deal.setBook_no(book_no);
		deal.setUsed_no(used_no);
		deal.setReal_price(used_price);
		int result = ds.insert3(deal);
		ms.update3(used_price , id);
		model.addAttribute("id", id);
		model.addAttribute("result", result);
		return "/usedBook/usedBuy";
	}
	
	@RequestMapping("usedFinalBuy")
	public String usedFinalBuy(int used_price, int used_no, String seller_id, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		int used_price2 = (int) (Math.floor(((used_price / 10) * 9)/10) * 10);
		int result = ms.update4(used_price2, seller_id);
		us.update3(used_no);
		model.addAttribute("id", id);
		model.addAttribute("result",result);
		return "/usedBook/usedFinalBuy";
	}

}
