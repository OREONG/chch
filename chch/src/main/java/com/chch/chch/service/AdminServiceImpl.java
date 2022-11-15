package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.AdminDao;
import com.chch.chch.model.Admin;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao ad;


	@Override
	public int getKPITotal(Admin kpiInfo) {
		return ad.getKPITotal(kpiInfo);
	}


	@Override
	public List<Admin> KPI(Admin kpiInfo) {
		return ad.KPI(kpiInfo);
	}


	@Override
	public int getRankingTotal(Admin salesInfo) {
		return ad.getRankingTotal(salesInfo);
	}


	@Override
	public List<Admin> salesRanking(Admin salesInfo) {
		return ad.salesRanking(salesInfo);
	}


	@Override
	public int salesHistoryTotal(Admin salesInfo) {
		return ad.salesHistoryTotal(salesInfo);
	}


	@Override
	public List<Admin> salesHistory(Admin salesInfo) {
		return ad.salesHistory(salesInfo);
	}
}
