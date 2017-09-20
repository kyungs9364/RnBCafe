package com.kosta.rnbcafe.util;

import lombok.Data;

@Data
public class Result {

	private boolean success = false;
	private String msg;
	private Object object;
}
