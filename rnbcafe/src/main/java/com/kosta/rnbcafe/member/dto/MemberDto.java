package com.kosta.rnbcafe.member.dto;

import lombok.Data;

@Data
public class MemberDto {
	
	private String id;
	private String pwd;
	private String name;
	private int gender;
	private String birth;
	private String phone;
	private int role;
	private String regdate;
	private int state;
	
	private int boardCnt;
	private int memoCnt;
}
