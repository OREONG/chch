package com.chch.chch.dao;

import java.util.List;

import com.chch.chch.model.Cart;

public interface CartDao {

	List<Cart> list(String id);

	int update(Cart cart);

	int delete(int cart_no, String id);

	int insert(Cart cart);
	
	int update_cart(Cart cart);

	Cart select(Cart cart);

	int getTotal(Cart cart);

}