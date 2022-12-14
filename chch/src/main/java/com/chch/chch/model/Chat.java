package com.chch.chch.model;

import java.util.Date;

import lombok.Data;

@Data
public class Chat {
	private int chat_no;
	private String room_no;
	private String sender;
	private String chat_content;
	private Date send_time;
	private Date read_time;
	private String read_chk;
	private String nickName;
	
	private String id;
	private String room_name;
	private String leave;
	private int used_no;
	
	private int unread;
	
	private long diffDays;
}
