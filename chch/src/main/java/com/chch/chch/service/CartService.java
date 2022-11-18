package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Cart;

public interface CartService {

	List<Cart> list(String id);

	int update(Cart cart);

	int delete(int cart_no, String id);

	int insert(Cart cart);

	int update_cart(Cart cart);

	Cart select(Cart cart);

	int getTotal(Cart cart);
	
	// HYC
	// 카트 주문금액 총합계산
	int selectedMoney(String[] cart_list, String id);

	// 주문완료 및 장바구니 삭제
	int delete2(String id);

	// 장바구니 선택한 카트 가져오기
	List<Cart> selectedCart(String[] cart_list, String id);



}