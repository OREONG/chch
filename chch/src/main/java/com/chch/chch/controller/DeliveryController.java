package com.chch.chch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chch.chch.model.Book;
import com.chch.chch.model.Cart;
import com.chch.chch.model.Coupon;
import com.chch.chch.model.Deal;
import com.chch.chch.model.Delivery;
import com.chch.chch.model.Member;
import com.chch.chch.model.Money;
import com.chch.chch.service.CartService;
import com.chch.chch.service.CouponService;
import com.chch.chch.service.DealService;
import com.chch.chch.service.DeliveryService;
import com.chch.chch.service.MoneyService;
import com.chch.chch.service.NewBookService;


@Controller
public class DeliveryController {
	@Autowired
	private DeliveryService dls;
	@Autowired
	private CartService cs;
	@Autowired
	private CouponService cps;
	@Autowired
	private MoneyService ms;
	@Autowired
	private DealService ds;
	@Autowired
	private NewBookService nbs;
	
	// 구매페이지 아이디 세션 확인
	// 장바구니에서 구매하기
	@SuppressWarnings("unused")
	@RequestMapping("purchaseStepForm")
	public String purchaseStepForm( @RequestParam(value = "cart_no" ,required = false) String cart_no, Delivery delivery, Coupon coupon, Money money, Deal deal, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Delivery> deliveryList = dls.list(id);
		String [] cart_list = cart_no.split(",");
		List<Cart> selectedCart = cs.selectedCart(cart_list, id);
		List<Coupon> couponList2 = cps.list2(id);
		int moneySelect = ms.moneySelect(id);
		int moneySelect2 = (moneySelect / 100) * 100;
		int mileageSelect = ms.mileageSelect(id);
		int mileageSelect2 = (mileageSelect / 100) * 100;
		String cpdt = cps.add(id);
		if (cpdt == null) {	cpdt = "0";	}
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("selectedCart", selectedCart);
		model.addAttribute("couponList2", couponList2);
		model.addAttribute("moneySelect", moneySelect);
		model.addAttribute("moneySelect2", moneySelect2);
		model.addAttribute("mileageSelect", mileageSelect);
		model.addAttribute("mileageSelect2", mileageSelect2);
		model.addAttribute("cpdt", cpdt);
		session.setAttribute("couponList2", couponList2);
		return "/purchase/purchaseStepForm";
	}
	
	// 책화면에서 바로 구매하기
	@RequestMapping("purchaseStepForm2")
	public String purchaseStepForm2(int book_no , int count, Member member, Cart cart, Book book, Delivery delivery, Coupon coupon, Money money, Deal deal, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Delivery> deliveryList = dls.list(id);
		List<Coupon> couponList2 = cps.list2(id);
		book.setCount(count);
		Book selectedBook = nbs.list(book_no);
		System.out.println(selectedBook);
		int moneySelect = ms.moneySelect(id);
		int moneySelect2 = (moneySelect / 100) * 100;
		int mileageSelect = ms.mileageSelect(id);
		int mileageSelect2 = (mileageSelect / 100) * 100;
		String cpdt = cps.add(id);
		if (cpdt == null) {	cpdt = "0";	}
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("book", book);
		model.addAttribute("count", count);
		model.addAttribute("selectedBook", selectedBook);
		model.addAttribute("couponList2", couponList2);
		model.addAttribute("moneySelect", moneySelect);
		model.addAttribute("moneySelect2", moneySelect2);
		model.addAttribute("mileageSelect", mileageSelect);
		model.addAttribute("mileageSelect2", mileageSelect2);
		model.addAttribute("cpdt", cpdt);
		session.setAttribute("couponList2", couponList2);
		return "/purchase/purchaseStepForm2";
	}
	
	// 기본배송지 팝업창
	@RequestMapping("basicAddress")
	public String basicAddress(Member member, Delivery delivery, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Delivery> deliveryList2 = dls.list2(id);
		model.addAttribute("deliveryList2", deliveryList2);
		return "/purchase/nolay/basicAddress";
	}
	
	// 기본배송지 수정
	@RequestMapping("basicAddressUpdate")
	public String basicAddressUpdate(int delivery_no, Delivery delivery, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		delivery.setId(id);
		delivery.setDelivery_no(delivery_no);
		int result = dls.update(delivery);
		int result2 = dls.update2(delivery);
		model.addAttribute("result", result);
		model.addAttribute("result2", result2);
		return "/purchase/nolay/basicAddressUpdate";
	}
	
	// 배송지 삭제
	@RequestMapping("basicAddressDelete")
	public String bassicAddressDelete(int delivery_no, Delivery delivery, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		delivery.setId(id);
		delivery.setDelivery_no(delivery_no);
		int result = dls.delete(delivery);
		model.addAttribute("result", result);
		return "/purchase/nolay/basicAddressDelete";
	}
	
	// 쿠폰 팝업창
	@RequestMapping("couponChange")
	public String couponChange(int total_price, Coupon coupon, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Coupon> couponList = cps.list(id);
		model.addAttribute("total_price", total_price);
		model.addAttribute("couponList", couponList);
		model.addAttribute("totalPrice", total_price);
		return "/purchase/nolay/couponChange";
	}
	
	// 쿠폰 사용상태 변경
	@RequestMapping("couponUpdate")
	public String couponUpdate(int coupon_no, Coupon coupon, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		coupon.setCoupon_no(coupon_no);
		coupon.setId(id);
		int result = cps.update(coupon);
		int result2 = cps.update2(coupon);
		model.addAttribute("result", result);
		model.addAttribute("result2", result2);
		return "/purchase/nolay/couponUpdate";
	}
	
	// 쿠폰 사용 취소
	@RequestMapping("couponUnuse")
	public String couponUnuse(Coupon coupon, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		coupon.setId(id);
		int result = cps.update3(coupon);
		model.addAttribute("result", result);
		return "/purchase/nolay/couponUnuse";
	}
	
	// 구매 완료 확인
	// 장바구니에서 구매하기
	@SuppressWarnings("unchecked")
	@RequestMapping("purchaseStep")
	public String purchaseStep( int delivery_no, int finalMoney, int finalPoint, Member member, Delivery delivery, Book book, Coupon coupon, Money money, Cart cart, Deal deal, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Coupon> couponList3 = (List<Coupon>) session.getAttribute("couponList2");
		List<Cart> cartList = cs.list(id);
		int maxDealGroup = ds.max()+1;
		int[] result3 = new int[cartList.size()];
		int[] result4 = new int[cartList.size()];
		for (int i = 0; i<cartList.size(); i++) { 
			deal.setPurchase_id(id);
			deal.setDeal_group(maxDealGroup);
			deal.setTotal_price(finalPoint);
			deal.setReal_price(finalPoint);
			deal.setBook_no(cartList.get(i).getBook_no());
			deal.setBook_price(cartList.get(i).getBook_price());
			deal.setDeal_count(cartList.get(i).getCart_count());
			result3[i] = ds.insert(deal);
//			book.setBook_count(cartList.get(i).getBook_count());
			result4[i] = nbs.update2(book);
		}
		int result = dls.insert(delivery);
//		cps.update4(coupon);
		ms.insert(money);
		ms.update(money);
		ms.update2(money);
		int result2 = cs.delete2(id);
		model.addAttribute("cartList", cartList);
		model.addAttribute("couponList3", couponList3);
		model.addAttribute("result" , result);
		model.addAttribute("result2" , result2);
		model.addAttribute("result3" , result3);
		model.addAttribute("result4" , result4);
		return "/purchase/purchaseStep";
	}
	
	// 책화면에서 바로 구매하기
	@SuppressWarnings({ "unchecked", "unused" })
	@RequestMapping("purchaseStep2")
	public String purchaseStep2( int delivery_no, int finalMoney, int finalPoint, Member member, Book book, Delivery delivery, Coupon coupon, Money money, Cart cart, Deal deal, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Coupon> couponList3 = (List<Coupon>) session.getAttribute("couponList2");
		int maxDealGroup2 = ds.max2()+1;
		int result3 = ds.insert2(deal);
		int result = dls.insert(delivery);
//		cps.update4(coupon);
		ms.insert(money);
		ms.update(money);
		ms.update2(money);
//		int result4 = nbs.update2(book);
		model.addAttribute("couponList3", couponList3);
		model.addAttribute("result" , result);
		model.addAttribute("result3" , result3);
//		model.addAttribute("result4", result4);
		return "/purchase/purchaseStep2";
	}
	
	@RequestMapping("purchaseFinish")
	public String purchaseFinish() {
		return "/purchase/purchaseFinish";
	}
}
