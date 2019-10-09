package com.playground.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MeetingVO {
	
	private int mno;
	private String userid;
	private String mname;
	private String location;
	private Date regdate;
	private int isopen;
	private int isactive;
	private String whatday;
	private String content;
	private float lat;
	private float lng;
	private String chat;
	private String idValue;
	private String fakename;
	private String originalFile;
	private String category;
}
