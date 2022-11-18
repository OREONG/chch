package com.chch.chch.model;

import lombok.Data;

@Data
public class Coupon {
	private int coupon_no;
	private String id;
    private String coupon_image;
    private String coupon_kind;
    private String coupon_discount;
    private String coupon_situation;
    private String del;
}