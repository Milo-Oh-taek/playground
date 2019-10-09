package com.playground.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private int bno;
	private String category;
	private String title;
	private String content;
	private String writer;
	private int viewCnt;
	private Date regdate;
	private Date updatedate;
	private int replyCnt;
	private int likeCnt;

}
