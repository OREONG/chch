package com.chch.chch.service;

import com.chch.chch.model.Money;

public interface MoneyService {

	// 보유금 조회
	int moneySelect(String id);

	// 보유 마일리지 조회
	int mileageSelect(String id);

	// 사용한 보유금 및 마일리지 저장
	int insert(Money money);
	
	// 총 보유금 및 마일리지 - 사용한 보유금 및 마일리지 계산
	int update(Money money);

	// 마일리지 적립
	int update2(Money money);

	// 구매자가 중고 도서 구매시 보유금 감소
	int update3(int used_price, String id);

	// 구매자가 중고 도서 구매확정시 판매자 보유금 증가
	int update4(int used_price2, String seller_id);

}