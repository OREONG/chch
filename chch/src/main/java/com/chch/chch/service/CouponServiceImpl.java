package com.chch.chch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chch.chch.dao.CouponDao;
import com.chch.chch.model.Coupon;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDao cd;

	// 쿠폰 조회
	public List<Coupon> list(String id) {
		return cd.list(id);
	}
	
	// 구매창 사용전 쿠폰 조회
	public List<Coupon> list2(String id) {
		return cd.list2(id);
	}

	// 쿠폰 사용예정상태 변경
	public int update(Coupon coupon) {
		return cd.update(coupon);
	}

	// 쿠폰 사용예정상태 선택
	public int update2(Coupon coupon) {
		return cd.update2(coupon);
	}

	// 쿠폰 사용 취소
	public int update3(Coupon coupon) {
		return cd.update3(coupon);
	}

	// 쿠폰 사용 완료
	public int update4(Coupon coupon) {
		return cd.update4(coupon);
	}

	// 사용할 쿠폰 할인값
	public String add(String id) {
		return cd.add(id);
	}

}