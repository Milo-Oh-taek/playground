package com.playground.domain;

import lombok.Data;

@Data
public class Criteria {

	private int page;
	private int amount;
	private int pageStart;
	
	private String searchType;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int page, int amount) {
		this.page = page;
		this.amount = amount;
	}
	
	public int getPageStart() {
		
		return(this.page-1) * amount;
	}
}
