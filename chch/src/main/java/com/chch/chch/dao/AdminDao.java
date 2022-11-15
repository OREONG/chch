package com.chch.chch.dao;

import java.util.List;

import com.chch.chch.model.Admin;

public interface AdminDao {

	int getKPITotal(Admin kpiInfo);

	List<Admin> KPI(Admin kpiInfo);

	int getRankingTotal(Admin salesInfo);

	List<Admin> salesRanking(Admin salesInfo);

	int salesHistoryTotal(Admin salesInfo);

	List<Admin> salesHistory(Admin salesInfo);

}
