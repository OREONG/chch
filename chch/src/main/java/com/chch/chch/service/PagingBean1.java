package com.chch.chch.service;

import lombok.Data;

@Data
public class PagingBean1 {
	private int currentPage1;
	private int rowPerPage1;
	private int total1;
	private int totalPage1;
	private int pagePerBlock1 = 10;
	private int startPage1;
	private int endPage1;
	
	public PagingBean1(int currentPage1, int rowPerPage1, int total1) {
		this.currentPage1 = currentPage1;
		this.rowPerPage1 = rowPerPage1;
		this.total1 = total1;

		totalPage1 = (int)(Math.ceil((double)total1/rowPerPage1));
		startPage1 = currentPage1 - (currentPage1 - 1) % pagePerBlock1;
		endPage1 = startPage1 + pagePerBlock1 - 1;
		if (endPage1 > totalPage1) endPage1 = totalPage1;
	}
}
