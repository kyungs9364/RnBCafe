package com.kosta.rnbcafe.admin.dto;

import lombok.Data;

@Data
public class BoardListDto{

	private int bcode;
	private int ccode;
	private int btype;
	private String bname;
	private int role;
	private int state;
	
	private String control;
	private String cname;
	
}
