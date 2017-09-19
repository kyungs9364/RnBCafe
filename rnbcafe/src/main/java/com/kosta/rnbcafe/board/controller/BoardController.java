package com.kosta.rnbcafe.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board/")
public class BoardController {
	
	@RequestMapping(value="")
	public String test() {
			
		return "";
	}

}
