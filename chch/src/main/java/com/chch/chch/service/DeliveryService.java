package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Delivery;

public interface DeliveryService {

	// 배송지 단건 조회
	List<Delivery> list(String id);

	// 배송지 여러건 조회
	List<Delivery> list2(String id);
	
	// 배송지 저장
	int insert(Delivery delivery);

	// 중복체크
	Delivery select(String delivery_address);

	// 기본 배송지 수정
	int update(Delivery delivery);
	int update2(Delivery delivery);

	// 배송지 삭제
	int delete(Delivery delivery);

}