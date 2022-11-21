package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Deal;

@Repository
public class DealDaoImpl implements DealDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Deal> list(String id) {
		return sst.selectList("dealns.list",id);
	}

	@Override
	public int update(int deal_no, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("deal_no",deal_no);
		return sst.update("dealns.purchase_update",map);
	}

	@Override
	public List<Deal> sales_list(String id) {
		return sst.selectList("dealns.sales_list",id);
	}

	@Override
	public int sales_update(int deal_no, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("deal_no",deal_no);
		return sst.update("dealns.sales_update",map);
	}

	@Override
	public int sales_DelAll(int deal_no, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("deal_no",deal_no);
		return sst.update("dealns.sales_DelAll",map);
	}

	@Override
	public int purchase_DelAll(int deal_no, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("deal_no",deal_no);
		return sst.update("dealns.purchase_DelAll",map);
	}
	
	@Override
	public int getTotal(Deal deal) {
		return sst.selectOne("dealns.getTotal",deal);
		
	}
	
	// HYC
	// 신규 도서 구매 완료 (장바구니)
	public int insert(Deal deal) {
		return sst.insert("dealns.insert", deal);
	}
	
	// 신규 도서 구매 완료 (책)
	public int insert2(Deal deal) {
		return sst.insert("dealns.insert2", deal);
	}

	// group 번호
	public int max() {
		return sst.selectOne("dealns.max");
	}
	public int max2() {
		return sst.selectOne("dealns.max2");
	}
	public int max3() {
		return sst.selectOne("dealns.max3");
	}

	// 중고 도서 판매시 거래 테이블등록
	public int insert3(Deal deal) {
		return sst.insert("dealns.insert3", deal);
	}

	// 중고 도서 구매시 판매자 아이디 등록
	public int update2(String id) {
		return sst.update("dealns.update2", id);
	}

	// 중고 구매자 확인
	public Deal selectUsed(int used_no) {
		return sst.selectOne("dealns.selectUsed", used_no);
	}

}
