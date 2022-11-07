package com.chch.chch.model;

import lombok.Data;

@Data
public class Community {
	private int community_no;
	private int room_no;
	private String host_id;
	private String community_category;
	private String community_subject;
	private String community_content;
	private int max_member;
	private String community_gender;
	private int min_age;
	private int max_age;
	private String community_location;
	private String community_del;
	
	private String id;
	private String room_name;
	private String leave;
	
	private int currentMember;
	private int participation;
}
