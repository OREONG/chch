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

//	@Override
//	public int insert(int book_no, int cart_count,String id,Cart cart) {
//		Map<String,Object> map = new HashMap<>();
//		map.put("book_no", book_no);
//		map.put("cart_count",cart_count);
//		map.put("id",id);
//		map.put("cart", cart);
//		return sst.insert("cartns.insert", map);
//	}
//
//	@Override
//	public Cart select(int book_no, String id) {
//		Map<String,Object> map = new HashMap<>();
//		map.put("book_no", book_no);
//		map.put("id", id);
//		return sst.selectOne("cartns.select",map);
//	}
//
//	@Override
//	public int update_cart(int book_no) {
//		return sst.update("cartns.update_cart",book_no);
//	}

	@Override
	public int insert(Cart cart) {
		return sst.insert("cartns.insert",cart);
	}

	@Override
	public Cart select(Cart cart) {
		return sst.selectOne("cartns.select",cart);
	}

	@Override
	public int update_cart(Cart cart) {
		return sst.update("cartns.update_cart",cart);
	}

	@Override
	public int getTotal(Cart cart) {
		return sst.selectOne("cartns.getTotal",cart);
	}
	
	// HYC
	// 카트 주문금액 총합계산
	public int seletedMoney(String[] cart_list, String id) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("cart_list", cart_list);
		map.put("id", id);
		return sst.selectOne("cartns.selectedMoney", map);
	}

	// 주문완료 및 장바구니 삭제
	public int delete2(String id) {
		return sst.delete("cartns.delete2", id);
	}

	// 장바구니 선택한 카트 가져오기
	public List<Cart> selectedCart(String[] cart_list, String id) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("cart_list", cart_list);
		map.put("id", id);
		return sst.selectList("cartns.selectedCart", map);
	}


}