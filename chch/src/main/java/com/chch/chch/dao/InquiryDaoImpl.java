package com.chch.chch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Inquiry;

@Repository
public class InquiryDaoImpl implements InquiryDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<Inquiry> replyList(int startRow, int endRow, String reply) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("reply", reply);
		return sst.selectList("inquiryns.replyList", map);
	}

	public int getTotal() {
		return sst.selectOne("inquiryns.getTotal");
	}

	public int replySubmit(Inquiry inquiry) {
		return sst.insert("inquiryns.replySubmit", inquiry);
	}

	public int inquirySubmit(Inquiry inquiry) {
		return sst.insert("inquiryns.inquirySubmit", inquiry);
	}

	public List<Inquiry> inquiryList(int startRow, int endRow, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("id", id);
		return sst.selectList("inquiryns.inquiryList", map);
	}
}
