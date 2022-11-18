package com.chch.chch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Delivery;

@Repository
public class DeliveryDaoImpl implements DeliveryDao {
	@Autowired
	private SqlSessionTemplate sst;

	// 배송지 단건 조회
	public List<Delivery> list(String id) {
		return sst.selectList("deliveryns.list", id);
	}

	// 배송지 여러건 조회
	public List<Delivery> list2(String id) {
		return sst.selectList("deliveryns.list2", id);
	}

	// 배송지 저장
	public int insert(Delivery delivery) {
		return sst.insert("deliveryns.insert", delivery);
	}

	// 중복 체크
	public Delivery select(String delivery_address) {
		return sst.selectOne("deliveryns.select", delivery_address);
	}

	// 기본 배송지 수정
	public int update(Delivery delivery) {
		return sst.update("deliveryns.update", delivery);
	}
	public int update2(Delivery delivery) {
		return sst.update("deliveryns.update2", delivery);
	}

	// 배송지 삭제
	public int delete(Delivery delivery) {
		return sst.delete("deliveryns.delete", delivery);
	}

}