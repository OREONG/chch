package com.chch.chch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chch.chch.model.Coupon;

@Repository
public class CouponDaoImpl implements CouponDao {
	@Autowired
	private SqlSessionTemplate sst;

	// 쿠폰 조회
	public List<Coupon> list(String id) {
		return sst.selectList("couponns.list", id);
	}
	
	// 구매창 사용전 쿠폰 조회
	public List<Coupon> list2(String id) {
		return sst.selectList("couponns.list2", id);
	}

	// 쿠폰 사용예정상태 변경
	public int update(Coupon coupon) {
		return sst.update("couponns.update", coupon);
	}

	// 쿠폰 사용예정상태 선택
	public int update2(Coupon coupon) {
		return sst.update("couponns.update2", coupon);
	}

	// 쿠폰 사용 취소
	public int update3(Coupon coupon) {
		return sst.update("couponns.update3", coupon);
	}

	// 쿠폰 사용 완료
	public int update4(Coupon coupon) {
		return sst.update("couponns.update4", coupon);
	}

	// 사용할 쿠폰 할인값
	public String add(String id) {
		return sst.selectOne("couponns.selectOne", id);
	}

}