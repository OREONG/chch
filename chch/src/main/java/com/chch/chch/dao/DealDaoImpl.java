package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Deal;
@Repository
public class DealDaoImpl implements DealDao{
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

	
}
