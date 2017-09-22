package com.kosta.rnbcafe.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemoDto {
	
	private int mseq;
	private int bseq;
	private String id;
	private String content;
	private Date regdate;
	private String name;
	
}
