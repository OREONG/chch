package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.DeliveryDao;
import com.chch.chch.model.Delivery;

@Service
public class DeliveryServiceImpl implements DeliveryService {
	@Autowired
	private DeliveryDao dd;

	// 배송지 단건 조회
	public List<Delivery> list(String id) {
		return dd.list(id);
	}

	// 배송지 여러건 조회
	public List<Delivery> list2(String id) {
		return dd.list2(id);
	}
	
	// 배송지 저장
	public int insert(Delivery delivery) {
		return dd.insert(delivery);
	}

	// 중복체크
	public Delivery select(String delivery_address) {
		return dd.select(delivery_address);
	}

	// 기본 배송지 수정
	public int update(Delivery delivery) {
		return dd.update(delivery);
	}
	public int update2(Delivery delivery) {
		return dd.update2(delivery);
	}

	// 배송지 삭제
	public int delete(Delivery delivery) {
		return dd.delete(delivery);
	}

}