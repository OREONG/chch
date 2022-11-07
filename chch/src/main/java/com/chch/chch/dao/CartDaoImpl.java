package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Cart;

@Repository
public class CartDaoImpl implements CartDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Cart> list(String id) {
		return sst.selectList("cartns.list", id);
	}

	@Override
	public int update(Cart cart) {
		return sst.update("cartns.update",cart);
	}

	@Override
	public int delete(int cart_no, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("cart_no",cart_no);
		return sst.delete("cartns.delete", map);
	}

	@Override
	public int insert(int book_no, int cart_count,String id,Cart cart) {
		Map<String,Object> map = new HashMap<>();
		map.put("book_no", book_no);
		map.put("cart_count",cart_count);
		map.put("id",id);
		map.put("cart", cart);
		return sst.insert("cartns.insert", map);
	}

}
