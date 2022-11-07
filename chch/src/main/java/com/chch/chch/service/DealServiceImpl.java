package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.DealDao;
import com.chch.chch.model.Deal;

@Service
public class DealServiceImpl implements DealService{
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

	
}
