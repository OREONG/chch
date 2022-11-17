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
import com.chch.chch.model.Member;
import com.chch.chch.service.CartService;
import com.chch.chch.service.DealService;
import com.chch.chch.service.Like_listService;
import com.chch.chch.service.MemberService;
import com.chch.chch.service.PagingBean;

@Controller
public class MypageController {
	@Autowired
	private CartService cs;
	@Autowired
	private DealService ds;
	@Autowired
	private Like_listService ls;
	@Autowired
	private MemberService ms;
	
	@RequestMapping("mypageMain")
	   public String mypageMain(HttpSession session, Model model) {
		String id= (String)session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
	    return "/myPage/mypageMain";
	   }
	
	
//	                   여기서부터는 장바구니
	 
	//장바구니 목록 
	@RequestMapping("cart")
	public String cart(HttpSession session,Cart cart, Model model,String pageNum) {
		String id = (String)session.getAttribute("id");
		int rowPerPage = 10; // �븳 �솕硫댁뿉 蹂댁뿬二쇰뒗 媛��닔
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = cs.getTotal(cart);		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		cart.setStartRow(startRow);
		cart.setEndRow(endRow);
		List<Cart> cart_list = cs.list(id);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);

		model.addAttribute("cart", cart);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("cart_list",cart_list);
		model.addAttribute("id",id);
		return "/myPage/cart";
	}
	//장바구니 수량 수정
	@RequestMapping("cartUpdate")
	public String cartUpdate(Cart cart,int cart_no,Model model) {
		int result = cs.update(cart);
		model.addAttribute("result",result);
		model.addAttribute("cart_no",cart_no);
		return "/myPage/cartUpdate";
	}
	//장바구니 삭제
	@RequestMapping("cartDelete")
	public String cartDelete(HttpSession session,int cart_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = cs.delete(cart_no,id);
		model.addAttribute("result",result);
		model.addAttribute("cart_no",cart_no);
		model.addAttribute("id",id);
		return "/myPage/cartDelete";
	}
	
	
	//newDetail.jsp에서 addcart누르면 cartInsert(바로아래) 여기로 들어옵니다
	//장바구니에 상품 추가
	@RequestMapping("cartInsert")
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
		return "/myPage/cartInsert";
	}
	//장바구니 선택상품 전체삭제
	 @RequestMapping("delAll")
	 public String delAll(HttpSession session,Model model, @RequestParam(value = "cart_nos" ,required = false) String cart_no) {
		 int result = 0;
		 String id = (String)session.getAttribute("id");
		 String [] cart_nos1 = cart_no.split(",");
		 for(String cart_no1 :cart_nos1) {
			 result = cs.delete(Integer.parseInt(cart_no1),id);
		 }
		 model.addAttribute("result",result);
		 model.addAttribute("id",id);
		 return "/myPage/delAll";
	 }
	 
	
//	               여기서부터는 구매목록
		
	//구매목록 불러오기
	@RequestMapping("purchase_list")
	public String purchase_list(HttpSession session,Deal deal,Model model,String pageNum) {
		String id = (String)session.getAttribute("id");
		int rowPerPage = 10; // �븳 �솕硫댁뿉 蹂댁뿬二쇰뒗 媛��닔
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ds.getTotal(deal);		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		deal.setStartRow(startRow);
		deal.setEndRow(endRow);
		List<Deal> purchase_list = ds.list(id);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("deal", deal);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("id",id);
		model.addAttribute("purchase_list",purchase_list);
		return "/myPage/purchase_list";
	}
	
	//구매목록 선택상품 전체삭제
	@RequestMapping("purchase_DelAll")
	public String purchase_DelAll(HttpSession session,Model model,@RequestParam(value="purchase_Select", required = false)String deal_no) {
		int result = 0;
		String id = (String)session.getAttribute("id");
		String [] purchase_Select1 = deal_no.split(",");
		for(String purchase_Select:purchase_Select1) {
			result = ds.purchase_DelAll(Integer.parseInt(purchase_Select),id);
		}
		model.addAttribute("deal_no",deal_no);
		model.addAttribute("result",result);
		return "myPage/purchase_DelAll";
	}
	
	//구매목록 삭제
	@RequestMapping("purchase_list_Update")
	public String purchase_list_Update(HttpSession session,int deal_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ds.update(deal_no,id);
		model.addAttribute("result",result);
		model.addAttribute("deal_no",deal_no);
		model.addAttribute("id",id);
		return "/myPage/purchase_list_Update";
	}
	
	
	
//                          여기서부터는 판매목록

	
	//판매목록 불러오기
	@RequestMapping("sales_list")
	public String sales_list (HttpSession session,Deal deal,Model model,String pageNum) {
		String id = (String)session.getAttribute("id");
		int rowPerPage = 10; // �븳 �솕硫댁뿉 蹂댁뿬二쇰뒗 媛��닔
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ds.getTotal(deal);		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		deal.setStartRow(startRow);
		deal.setEndRow(endRow);
		List<Deal> sales_list = ds.sales_list(id);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		model.addAttribute("deal", deal);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("id",id);
		model.addAttribute("sales_list",sales_list);
		return "/myPage/sales_list";
	}
	
	//판매목록 삭제
	@RequestMapping("sales_list_Update")
	public String sales_list_Update(HttpSession session,int deal_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ds.sales_update(deal_no,id);
		model.addAttribute("result",result);
		model.addAttribute("deal_no",deal_no);
		model.addAttribute("id",id);
		return "/myPage/sales_list_Update";
	}
	
	
	 //판매목록 선택상품 전체삭제
	 @RequestMapping("sales_DelAll")
	 public String sales_DelAll(HttpSession session,Model model,@RequestParam(value="sales_Select", required = false)String deal_no) {
		int result = 0;
		 String id = (String)session.getAttribute("id");
		 String [] sales_Select1 = deal_no.split(",");
		 for(String sales_Select:sales_Select1) {
			result = ds.sales_DelAll(Integer.parseInt(sales_Select),id);
		}
		 model.addAttribute("deal_no",deal_no);
		 model.addAttribute("result",result);
		 return "/myPage/sales_DelAll";
	 }
	 
	 
//                         여기서부터는 찜목록
 
	
	//찜목록 불러오기
	@RequestMapping("like_list")
	   public String like_list(HttpSession session,Like_list like_list,Model model,String pageNum) {
		String id = (String)session.getAttribute("id");
		int rowPerPage = 10; // �븳 �솕硫댁뿉 蹂댁뿬二쇰뒗 媛��닔
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ls.getTotal(like_list);		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		like_list.setStartRow(startRow);
		like_list.setEndRow(endRow);
		List<Like_list> Booklike_list = ls.Booklike_list(id);
		List<Like_list> Usedlike_list = ls.Usedlike_list(id);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		model.addAttribute("like_list", like_list);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("Usedlike_list",Usedlike_list);
		model.addAttribute("Booklike_list",Booklike_list);
		model.addAttribute("id",id);
		return "/myPage/like_list";
		
	}
	
	//찜목록 삭제
	@RequestMapping("like_listDelete")
	public String like_listDelete(HttpSession session,int like_no,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ls.delete(like_no,id);
		model.addAttribute("result",result);
		model.addAttribute("like_no",like_no);
		model.addAttribute("id",id);
		return "/myPage/like_listDelete";
	}
	//찜목록에 상품추가
	//newDetail.jsp에서 likeInsert누르면 likeInsert(바로아래) 여기로 들어옵니다
	@RequestMapping("likeInsert")
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
		return "/myPage/likeInsert";
	}

	//찜목록에 중고 상품 추가
	//usedDetail.jsp에서 likeInsert_used누르면 likeInsert_used(바로아래) 여기로 들어옵니다
	@RequestMapping("likeInsert_used")
	public String likeInsert_used(HttpSession session,int used_no,Like_list like_list,Model model) {
		String id = (String)session.getAttribute("id");
		int result = ls.insert_used(used_no,like_list,id);
		model.addAttribute("result",result);
		model.addAttribute("used_no",used_no);
		model.addAttribute("like_list",like_list);
		model.addAttribute("id",id);
		return "/myPage/likeInsert_used";
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
	