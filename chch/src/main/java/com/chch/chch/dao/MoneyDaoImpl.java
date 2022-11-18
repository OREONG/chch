package com.chch.chch.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Money;

@Repository
public class MoneyDaoImpl implements MoneyDao {
	@Autowired
	private SqlSessionTemplate sst;

	// 보유금 조회
	public int moneySelect(String id) {
		return sst.selectOne("moneyns.moneySelect", id);
	}

	// 보유 마일리지 조회
	public int mileageSelect(String id) {
		return sst.selectOne("moneyns.mileageSelect", id);
	}

	// 사용한 보유금 및 마일리지 저장
	public int insert(Money money) {
		return sst.insert("moneyns.insert", money);
	}

	// 총 보유금 및 마일리지 - 사용한 보유금 및 마일리지 계산
	public int update(Money money) {
		return sst.update("moneyns.update", money);
	}

	// 마일리지 적립
	public int update2(Money money) {
		return sst.update("moneyns.update2", money);
	}

	// 중고 도서 구매시 보유금 감소
	public int update3(int used_price, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("used_price", used_price);
		return sst.update("moneyns.update3", map);
	}

	// 중고 도서 판매시 보유금 증가
	public int update4(int used_price2, String seller_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", seller_id);
		map.put("used_price", used_price2);
		return sst.update("moneyns.update4", map);
	}
}