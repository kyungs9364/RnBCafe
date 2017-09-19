package com.kosta.rnbcafe.member.dto;

import lombok.Getter;

public enum IsAdmin {
	ADMIN("관리자"),
	USER("사용자");
	
	@Getter
	private final String desc;
	private IsAdmin(String desc){
		this.desc = desc;
	}
	
}
