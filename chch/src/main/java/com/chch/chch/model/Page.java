package com.chch.chch.model;

import lombok.Data;

@Data
public class Page {
	private int row_per_page;
	private int page_per_block;
	private int pageNum;
	private int currentPage;
	private int startRow;
	private int endRow;
	private int total;
	private int totalPage;
	private int startPage;
	private int endPage;
}
