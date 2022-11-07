package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.InquiryDao;
import com.chch.chch.model.Inquiry;

@Service
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	private InquiryDao ind;

	public List<Inquiry> replyList(int startRow, int endRow, String reply) {
		return ind.replyList(startRow, endRow, reply);
	}

	public int getTotal() {
		return ind.getTotal();
	}

	public int replySubmit(Inquiry inquiry) {
		return ind.replySubmit(inquiry);
	}

	public int inquirySubmit(Inquiry inquiry) {
		return ind.inquirySubmit(inquiry);
	}

	public List<Inquiry> inquiryList(int startRow, int endRow, String id) {
		return ind.inquiryList(startRow, endRow, id);
	}
}
