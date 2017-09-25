package com.kosta.rnbcafe.board;

import lombok.Data;

@Data
public class BoardSet {

	private int bcode;
	private String bname;
	private int pageNum;
	private int searchPageNum;
	private String key;
	private String word;
}
