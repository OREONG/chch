package com.chch.chch.dao;

import java.util.List;

import com.chch.chch.model.Inquiry;

public interface InquiryDao {

	List<Inquiry> replyList(int startRow, int endRow, String reply);

	int getTotal();

	int replySubmit(Inquiry inquiry);

	int inquirySubmit(Inquiry inquiry);

	List<Inquiry> inquiryList(int startRow, int endRow, String id);

	int replyCheck(int inquiry_no);

	int unreadInquiryCount(String id);

}
