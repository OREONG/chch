package com.chch.chch.service;

import java.util.List;

import com.chch.chch.model.Used;

public interface UsedBookService {

	List<Used> usedBookList();

	int getTotal(Used used);

	Used selectUsed(int used_no);

}
