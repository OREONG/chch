package com.chch.chch.dao;

import java.util.List;

import com.chch.chch.model.Deal;

public interface DealDao {

	List<Deal> list(String id);

	int update(int deal_no, String id);

	List<Deal> sales_list(String id);

	int sales_update(int deal_no, String id);

	int sales_DelAll(int deal_no, String id);

	int purchase_DelAll(int deal_no, String id);
	
	int getTotal(Deal deal);

	// HYC
	// 신규 도서 구매 완료 (장바구니)
	int insert(Deal deal);

	// 신규 도서 구매 완료 (책)
	int insert2(Deal deal);
	
	// group 번호
	int max();
	int max2();
	int max3();

	// 중고 도서 판매시 거래 테이블등록
	int insert3(Deal deal);

	// 중고 도서 구매시 판매자 아이디 등록
	int update2(String id);

	// 중고 구매자 확인
	Deal selectUsed(int used_no);



}
