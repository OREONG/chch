package com.chch.chch.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chch.chch.model.Cart;
import com.chch.chch.model.Deal;
import com.chch.chch.model.Like_list;
import com.chch.chch.service.CartService;
import com.chch.chch.service.DealService;
import com.chch.chch.service.Like_listService;

@Controller
public class MypageController {
	@Autowired
	private CartService cs;
	@Autowired
	private DealService ds;
	@Autowired
	private Like_listService ls;
	
	//장바구니 목록 
	@RequestMapping("/mypage/cart")
	public String cart(HttpSession session,Cart cart, Model model) {
		String id = (String)session.getAttribute("id");
		List<Cart> cart_list = cs.list(id);
		model.addAttribute("cart_list",cart_list);
		model.addAttribute("id",id);
		return "/mypage/cart";
	}
	//장바구니 수량 수정
	@RequestMapping("/mypage/cartUpdate")
	public String cartUpdate(Cart cart,int cart_no,Model model) {
		int result = cs.update(cart);
		model.addAttribute("result",result);
		model.addAttribute("cart_no",cart_no);
		return "/mypage/cartUpdate";
	}
	//장바구니 삭제
	@RequestMapping("/mypage/cartDelete")
	public String cartDelete(HttpSession session,int cart_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = cs.delete(cart_no,id);
		model.addAttribute("result",result);
		model.addAttribute("cart_no",cart_no);
		model.addAttribute("id",id);
		return "/mypage/cartDelete";
	}
	//장바구니에 상품 추가
	@RequestMapping("/mypage/cartInsert")
	public String cartInsert (HttpSession session,int book_no ,int cart_count,Model model,Cart cart ) {
		String id = (String)session.getAttribute("id");
		int result = cs.insert(book_no,cart_count,id,cart);
		model.addAttribute("result",result);
		model.addAttribute("book_no",book_no);
		
		model.addAttribute("cart",cart);
		model.addAttribute("id",id);
		return "/mypage/cartInsert";
	}
	//장바구니 선택상품 전체삭제
	 @RequestMapping("/mypage/delAll")
	 public String delAll(HttpSession session,Model model, @RequestParam(value = "cart_nos" ,required = false) String cart_no) {
		 int result = 0;
		 String id = (String)session.getAttribute("id");
		 String [] cart_nos1 = cart_no.split(",");
		 for(String cart_no1 :cart_nos1) {
			 result = cs.delete(Integer.parseInt(cart_no1),id);
		 }
		 model.addAttribute("result",result);
		 model.addAttribute("id",id);
		 return "/mypage/delAll";
	 }
		
	//구매목록 불러오기
	@RequestMapping("/mypage/purchase_list")
	public String purchase_list(HttpSession session,Deal deal,Model model) {
		String id = (String)session.getAttribute("id");
		System.out.println("deal id="+id);
		List<Deal> purchase_list = ds.list(id);
		model.addAttribute("purchase_list",purchase_list);
		return "/mypage/purchase_list";
	}
	
	//구매목록 삭제
	@RequestMapping("/mypage/purchase_list_Update")
	public String purchase_list_Update(HttpSession session,int deal_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ds.update(deal_no,id);
		model.addAttribute("result",result);
		model.addAttribute("deal_no",deal_no);
		model.addAttribute("id",id);
		return "/mypage/purchase_list_Update";
	}
	
	//판매목록 불러오기
	@RequestMapping("/mypage/sales_list")
	public String sales_list (HttpSession session,Deal deal,Model model) {
		String id = (String)session.getAttribute("id");
		List<Deal> sales_list = ds.sales_list(id);
		model.addAttribute("sales_list",sales_list);
		return "sales_list";
	}
	
	//판매목록 삭제
	@RequestMapping("sales_list_Update")
	public String sales_list_Update(HttpSession session,int deal_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ds.sales_update(deal_no,id);
		model.addAttribute("result",result);
		model.addAttribute("deal_no",deal_no);
		model.addAttribute("id",id);
		return "sales_list_Update";
	}
	
	//찜목록 불러오기
	@RequestMapping("like_list")
	   public String like_list(HttpSession session,Like_list like_list,Model model) {
		String id = (String)session.getAttribute("id");
		List<Like_list> Booklike_list = ls.Booklike_list(id);
		List<Like_list> Usedlike_list = ls.Usedlike_list(id);
		model.addAttribute("Usedlike_list",Usedlike_list);
		model.addAttribute("Booklike_list",Booklike_list);
		return "like_list";
		
	}
	
	//찜목록 삭제
	@RequestMapping("like_listDelete")
	public String like_listDelete(HttpSession session,int like_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ls.delete(like_no,id);
		model.addAttribute("result",result);
		model.addAttribute("like_no",like_no);
		model.addAttribute("id",id);
		return "/mypage/like_listDelete";
	}
	//찜목록에 상품추가
	@RequestMapping("/mypage/likeInsert")
	public String likeInsert(HttpSession session,int book_no,Model model) {
		String id = (String)session.getAttribute("id");
		Like_list like_list = new Like_list();
		like_list.setId(id);
		like_list.setBook_no(book_no);
		
		int result = ls.insert(like_list);
					
		model.addAttribute("result",result);
		model.addAttribute("book_no",book_no);
		model.addAttribute("like_list",like_list);
		model.addAttribute("id",id);
		return "/mypage/likeInsert";
	}

	/*
	 * //newDetail페이지에서 하트 누르면 찜목록 삭제
	 * 
	 * @RequestMapping("likeDelete") public String likeDelete(HttpSession
	 * session,int book_no,Model model) { String id =
	 * (String)session.getAttribute("id"); Like_list like_table = new Like_list();
	 * like_table.setId(id); like_table.setBook_no(book_no); int result =
	 * ls.likeDelete(like_table);
	 * 
	 * model.addAttribute("result",result); model.addAttribute("book_no",book_no);
	 * model.addAttribute("like_table",like_table); model.addAttribute("id",id);
	 * return "likeDelete"; }
	 * 
	 * //usedDetail페이지에서 하트 누르면 찜목록 삭제
	 */
	//찜목록에 중고 상품 추가
	@RequestMapping("/mypage/likeInsert_used")
	public String likeInsert_used(HttpSession session,int used_no,Like_list like_list,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ls.insert_used(used_no,like_list,id);
		model.addAttribute("result",result);
		model.addAttribute("used_no",used_no);
		model.addAttribute("like_list",like_list);
		model.addAttribute("id",id);
		return "/mypage/likeInsert_used";
	}
	
}
