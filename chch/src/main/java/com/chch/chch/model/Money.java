package com.chch.chch.model;

import lombok.Data;

@Data
public class Money {
	private int money_no;
    private String id;
    private int total_money;
    private int used_money;
    private int total_mileage;
    private int used_mileage;
    
    // 포인트 적립
    private int saveMileage;
}