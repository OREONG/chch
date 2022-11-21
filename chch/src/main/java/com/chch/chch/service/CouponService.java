package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Coupon;

public interface CouponService {

	// 쿠폰 조회
	List<Coupon> list(String id);
	
	// 구매창 사용전 쿠폰 조회
	List<Coupon> list2(String id);
	
	// 쿠폰 사용예정상태 변경
	int update(Coupon coupon);

	// 쿠폰 사용예정상태 선택
	int update2(Coupon coupon);

	// 쿠폰 사용 취소
	int update3(Coupon coupon);

	// 쿠폰 사용 완료
	int update4(Coupon coupon);

	// 사용할 쿠폰 할인값
	String add(String id);

}