package com.chch.chch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.MoneyDao;
import com.chch.chch.model.Money;

@Service
public class MoneyServiceImpl implements MoneyService {
	@Autowired
	private MoneyDao md;

	// 보유금 조회
	public int moneySelect(String id) {
		return md.moneySelect(id);
	}

	// 보유 마일리지 조회
	public int mileageSelect(String id) {
		return md.mileageSelect(id);
	}

	// 사용한 보유금 및 마일리지 저장
	public int insert(Money money) {
		return md.insert(money);
	}

	// 총 보유금 및 마일리지 - 사용한 보유금 및 마일리지 계산
	public int update(Money money) {
		return md.update(money);
	}

	// 마일리지 적립
	public int update2(Money money) {
		return md.update2(money);
	}

	// 구매자가 중고 도서 구매시 보유금 감소
	public int update3(int used_price, String id) {
		return md.update3(used_price, id);
	}

	// 구매자가 중고 도서 구매확정시 판매자 보유금 증가
	public int update4(int used_price2, String seller_id) {
		return md.update4(used_price2, seller_id);
	}

	@Override
	public void init(String id) {
		md.init(id);
	}

}