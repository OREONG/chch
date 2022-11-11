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




}
