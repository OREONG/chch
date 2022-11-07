package com.chch.chch.dao;

import java.util.List;

import com.chch.chch.model.Deal;

public interface DealDao {

	List<Deal> list(String id);

	int update(int deal_no, String id);

	List<Deal> sales_list(String id);

	int sales_update(int deal_no, String id);

	


}
