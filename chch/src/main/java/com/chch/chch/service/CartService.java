package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Cart;

public interface CartService {

	List<Cart> list(String id);

	int update(Cart cart);

	int delete(int cart_no, String id);

	int insert(int book_no, int cart_count, String id, Cart cart);


}
