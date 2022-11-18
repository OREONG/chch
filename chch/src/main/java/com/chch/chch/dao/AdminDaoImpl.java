package com.chch.chch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Admin;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getKPITotal(Admin kpiInfo) {
		return sst.selectOne("adminns.getKPITotal", kpiInfo);
	}

	@Override
	public List<Admin> KPI(Admin kpiInfo) {
		return sst.selectList("adminns.KPI", kpiInfo);
	}

	@Override
	public int getRankingTotal(Admin salesInfo) {
		return sst.selectOne("adminns.getRankingTotal", salesInfo);
	}

	@Override
	public List<Admin> salesRanking(Admin salesInfo) {
		return sst.selectList("adminns.salesRanking", salesInfo);
	}

	@Override
	public int salesHistoryTotal(Admin salesInfo) {
		return sst.selectOne("adminns.salesHistoryTotal", salesInfo);
	}

	@Override
	public List<Admin> salesHistory(Admin salesInfo) {
		return sst.selectList("adminns.salesHistory", salesInfo);
	}
}
