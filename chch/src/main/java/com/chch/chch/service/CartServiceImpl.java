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
	public int insert(int book_no, int cart_count,String id,Cart cart) {
		return cd.insert(book_no,cart_count,id,cart);
	}
}
