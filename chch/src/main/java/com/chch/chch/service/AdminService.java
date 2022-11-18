package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Admin;

public interface AdminService {

	int getKPITotal(Admin kpiInfo);

	List<Admin> KPI(Admin kpiInfo);

	int getRankingTotal(Admin kpiInfo);

	List<Admin> salesRanking(Admin kpiInfo);

	int salesHistoryTotal(Admin salesInfo);

	List<Admin> salesHistory(Admin salesInfo);

}
