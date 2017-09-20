package com.kosta.rnbcafe.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board/")
public class BoardController {
	
	@RequestMapping(value="boardlist")
	public String boardList() {
			
		return "board/boardlist";
	}
	
	@RequestMapping(value="insertboard")
	public String insertBoard() {
		
		return "board/insertboard";
	}

}
