package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.CartDao;
import com.chch.chch.model.Cart;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cd;

	@Override
	public List<Cart> list(String id) {		
		return cd.list(id);
	}

	@Override
	public int update(Cart cart) {
		return cd.update(cart);
	}

	@Override
	public int delete(int cart_no, String id) {
		return cd.delete(cart_no, id);
	}

	@Override
	public int insert(Cart cart) {
		return cd.insert(cart);
	}

	@Override
	public Cart select(Cart cart) {
		return cd.select(cart);
	}


	@Override
	public int update_cart(Cart cart) {
		return cd.update_cart(cart);
	}

	@Override
	public int getTotal(Cart cart) {
		return cd.getTotal(cart);
	}
	
	// HYC
	// 카트 주문금액 총합계산
	public int selectedMoney(String[] cart_list, String id) {
		return cd.seletedMoney(cart_list, id);
	}

	// 주문완료 및 장바구니 삭제
	public int delete2(String id) {
		return cd.delete2(id);
	}

	// 장바구니 선택한 카트 가져오기
	public List<Cart> selectedCart(String[] cart_list, String id) {
		return cd.selectedCart(cart_list, id);
	}


}