package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.DealDao;
import com.chch.chch.model.Deal;

@Service
public class DealServiceImpl implements DealService {
	@Autowired
	private DealDao dd;

	@Override
	public List<Deal> list(String id) {
		return dd.list(id);
	}

	@Override
	public int update(int deal_no, String id) {
		return dd.update(deal_no,id);
	}

	@Override
	public List<Deal> sales_list(String id) {
		return dd.sales_list(id);
	}

	@Override
	public int sales_update(int deal_no, String id) {
		return dd.sales_update(deal_no,id);
	}

	@Override
	public int sales_DelAll(int deal_no,String id) {
		return dd.sales_DelAll(deal_no,id);
	}

	@Override
	public int purchase_DelAll(int deal_no, String id) {
		return dd.purchase_DelAll(deal_no,id);
	}
	
	@Override
	public int getTotal(Deal deal) {
		return dd.getTotal(deal);
	}
	
	// 신규 도서 구매 완료(장바구니)
	public int insert(Deal deal) {
		return dd.insert(deal);
	}
	
	// 신규도서 구매 완료(책)
	public int insert2(Deal deal) {
		return dd.insert2(deal);
	}

	// group 번호
	public int max() {
		return dd.max();
	}
	public int max2() {
		return dd.max2();
	}
	public int max3() {
		return dd.max3();
	}
	
	//HYC
	// 중고 도서 판매시 거래 테이블등록
	public int insert3(Deal deal) {
		return dd.insert3(deal);
	}

	// 중고 도서 구매시 판매자 아이디 등록
	public int update2(String id) {
		return dd.update2(id);
	}

	// 중고 구매자 확인
	public Deal selectUsed(int used_no) {
		return dd.selectUsed(used_no);
	}

}
