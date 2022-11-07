package com.chch.chch.dao;
import java.util.List;

import com.chch.chch.model.Used;

public interface UsedBookDao {

	List<Used> usedBookList();

	int getTotal(Used used);

	Used selectUsed(int used_no);

}
