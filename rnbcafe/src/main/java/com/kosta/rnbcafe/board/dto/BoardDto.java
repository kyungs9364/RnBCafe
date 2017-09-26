package com.kosta.rnbcafe.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDto {
	
	private int bseq;
	private int bcode;
	private String id;
	private String title;
	private String content;
	private String img;
	private int hit;
	private Date regdate;
	private int notice;
	private String name;
	private String blname;

}
