package com.playground.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MpicVO {

	private int mno;
	private String oriname;
	private String fakename;
	private int size;
	private Date uploaddate;
}
