package com.chch.chch.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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
	
	
	
//	                   여기서부터는 장바구니
	 
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
	
	
	//newDetail.jsp에서 addcart누르면 cartInsert(바로아래) 여기로 들어옵니다
	//장바구니에 상품 추가
	@RequestMapping("/newBook/cartInsert")
	public String cartInsert (Cart cart,HttpSession session,Model model,int book_no) {
//		String id = (String)session.getAttribute("id");
		int result = 0;
		Cart cart2 = cs.select(cart);
		//String book_no1 = (String) session.getAttribute("book_no");
		//같은 상품이 있으면 수량을 update
		if(cart2==null){
			result = cs.insert(cart);
		}
		else {
			int count = cart2.getCart_count() + cart.getCart_count();
			cart.setCart_count(count);
			result = cs.update_cart(cart);
		}
		model.addAttribute("result",result);
		model.addAttribute("book_no",book_no);
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
	 
	
//	               여기서부터는 구매목록
		
	//구매목록 불러오기
	@RequestMapping("/mypage/purchase_list")
	public String purchase_list(HttpSession session,Deal deal,Model model) {
		String id = (String)session.getAttribute("id");
		System.out.println("deal id="+id);
		List<Deal> purchase_list = ds.list(id);
		model.addAttribute("purchase_list",purchase_list);
		return "/mypage/purchase_list";
	}
	
	//구매목록 선택상품 전체삭제
	@RequestMapping("/mypage/purchase_DelAll")
	public String purchase_DelAll(HttpSession session,Model model,@RequestParam(value="purchase_Select", required = false)String deal_no) {
		int result = 0;
		String id = (String)session.getAttribute("id");
		String [] purchase_Select1 = deal_no.split(",");
		for(String purchase_Select:purchase_Select1) {
			result = ds.purchase_DelAll(Integer.parseInt(purchase_Select),id);
		}
		model.addAttribute("deal_no",deal_no);
		model.addAttribute("result",result);
		return "mypage/purchase_DelAll";
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
	
	
	
//                          여기서부터는 판매목록

	
	//판매목록 불러오기
	@RequestMapping("/mypage/sales_list")
	public String sales_list (HttpSession session,Deal deal,Model model) {
		String id = (String)session.getAttribute("id");
		List<Deal> sales_list = ds.sales_list(id);
		model.addAttribute("sales_list",sales_list);
		return "/mypage/sales_list";
	}
	
	//판매목록 삭제
	@RequestMapping("/mypage/sales_list_Update")
	public String sales_list_Update(HttpSession session,int deal_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ds.sales_update(deal_no,id);
		model.addAttribute("result",result);
		model.addAttribute("deal_no",deal_no);
		model.addAttribute("id",id);
		return "/mypage/sales_list_Update";
	}
	
	
	 //판매목록 선택상품 전체삭제
	 @RequestMapping("/mypage/sales_DelAll")
	 public String sales_DelAll(HttpSession session,Model model,@RequestParam(value="sales_Select", required = false)String deal_no) {
		int result = 0;
		 String id = (String)session.getAttribute("id");
		 String [] sales_Select1 = deal_no.split(",");
		 for(String sales_Select:sales_Select1) {
			result = ds.sales_DelAll(Integer.parseInt(sales_Select),id);
		}
		 model.addAttribute("deal_no",deal_no);
		 model.addAttribute("result",result);
		 return "/mypage/sales_DelAll";
	 }
	 
	 
//                         여기서부터는 찜목록
 
	
	//찜목록 불러오기
	@RequestMapping("/mypage/like_list")
	   public String like_list(HttpSession session,Like_list like_list,Model model) {
		String id = (String)session.getAttribute("id");
		List<Like_list> Booklike_list = ls.Booklike_list(id);
		List<Like_list> Usedlike_list = ls.Usedlike_list(id);
		model.addAttribute("Usedlike_list",Usedlike_list);
		model.addAttribute("Booklike_list",Booklike_list);
		return "/mypage/like_list";
		
	}
	
	//찜목록 삭제
	@RequestMapping("/mypage/like_listDelete")
	public String like_listDelete(HttpSession session,int like_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ls.delete(like_no,id);
		model.addAttribute("result",result);
		model.addAttribute("like_no",like_no);
		model.addAttribute("id",id);
		return "/mypage/like_listDelete";
	}
	//찜목록에 상품추가
	//newDetail.jsp에서 likeInsert누르면 likeInsert(바로아래) 여기로 들어옵니다
	@RequestMapping("/newBook/likeInsert")
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

	//찜목록에 중고 상품 추가
	//usedDetail.jsp에서 likeInsert_used누르면 likeInsert_used(바로아래) 여기로 들어옵니다
	@RequestMapping("/usedBook/likeInsert_used")
	public String likeInsert_used(HttpSession session,int used_no,Like_list like_list,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ls.insert_used(used_no,like_list,id);
		model.addAttribute("result",result);
		model.addAttribute("used_no",used_no);
		model.addAttribute("like_list",like_list);
		model.addAttribute("id",id);
		return "/mypage/likeInsert_used";
	}
	
	@RequestMapping("mypageMain")
	public String mypageMain() {
		return "mypageMain";
	}
	
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
	
