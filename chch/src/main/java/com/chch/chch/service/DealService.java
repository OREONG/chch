package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Deal;

public interface DealService {

	/* 구매목록 */
	List<Deal> list(String id);

	/* 구매목록 삭제 n => y */
	int update(int deal_no, String id);

	/* 판매목록 */
	List<Deal> sales_list(String id);

	/* 판매목록 삭제 n => y */
	int sales_update(int deal_no, String id);

	/* 구매목록 전체삭제n => y */
	int sales_DelAll(int deal_no, String id);
	
	/* 판매목록 전체삭제n => y */
	int purchase_DelAll(int deal_no, String id);
	
	int getTotal(Deal deal);
	
	// HYC
	// 신규 도서 구매 완료(장바구니)
	int insert(Deal deal);

	// 신규도서 구매 완료(책)
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
