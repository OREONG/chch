package com.chch.chch.model;

import java.sql.Date;
import lombok.Data;

@Data
public class Admin {
	
//	book table
	private int book_no;
	private String book_title;
	private String book_image;
	private String book_imagedetail;
	private String book_author;
	private String book_publisher;
	private int book_count;
	private int book_price;
	private Date book_publish_date;
	private Date book_reg_date;
	private String book_content;
	private String book_kind;
	private String book_del;
	
	
	private String used_subject;
	private String used_content;
	private String used_image;
	private int used_price;
	private String used_status;
	private String used_del;
	private Date used_reg_date;
	private String id;
	
	private int delivery_no;
	private String delivery_kind;
	private String delivery_address;
	private String delivery_address_detail;
	private String delivery_tel;
	private String delivery_recieve;

	private int deal_no;
	private int deal_group;
	private String purchase_id;
	private int used_no;
	private String seller_id;
	private Date deal_date;
	private int deal_price;
	private int deal_count;
	private int  coupon_no;
	private int total_price;
	private int real_price;
	private String purchase_list_del;
	private String sales_list_del;
	private String deal_situation;
	
	private int rn;
	private int total_sales;
	private Date dateFrom;
	private Date dateTo;
	private int cycle;
	private String s_date;
	private int sort;
	private String w_date;
	
	
	private int startRow;
	private int endRow;
}