package com.chch.chch.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Deal {
	private String book_title;
	private int deal_no;
    private int deal_group;
    private String purchase_id;
    private String seller_id;
    private int book_no;
    private int used_no;
    private String used_subject;
    private String book_image;
	private String book_author;
	private String book_publisher;
    private int delivery_no;
    private int coupon_no;
    private Date deal_date;
    private int total_price;
    private int real_price;
    private int book_price;
    private int used_price;
    private int deal_count;
    private int book_count;
    private String purchase_list_del;
    private String sales_list_del;
    private String deal_situation;
    private int startRow;
	private int endRow;
}
