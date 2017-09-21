package com.kosta.rnbcafe.util;

import java.util.List;

import lombok.Data;

@Data
public class Result {

	private boolean success = false;
	private String msg;
	private Object object;
	private List<?> items;
}
