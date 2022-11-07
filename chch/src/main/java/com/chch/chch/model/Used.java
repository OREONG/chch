package com.chch.chch.model;


import java.sql.Date;

import lombok.Data;

@Data
public class Used {
	
	private int used_no;
	private int book_no;
	private String used_subject;
	private String used_content;
	private String used_image;
	private int used_price;
	private String used_status;
	private String used_del;
	private Date used_reg_date;
	private String id;
//	�럹�씠吏뺤슜
	private int startRow;
	private int endRow;
}
