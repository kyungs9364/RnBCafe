package com.kosta.rnbcafe.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.rnbcafe.board.dto.BoardDto;
import com.kosta.rnbcafe.board.service.BoardServiceImpl;

@Controller
@RequestMapping(value="/board/")
public class BoardController {
	
	@Autowired
	private BoardServiceImpl service;
	
	@RequestMapping(value="boardlist")
	public String boardList(Model model) {
		List<BoardDto> list = service.boardList();
		model.addAttribute("list",list);
		
		return "board/boardlist";
	}
	
	@RequestMapping(value="insertboard")
	public String insertform() {
		
		return "board/insertboard";
	}
	
	@RequestMapping(value="insertboard", method=RequestMethod.POST)
	public String insertBoard(BoardDto dto) {
		// img, id 값 준비해서 넣기
		
		int cnt = service.insertBoard(dto);
		if(cnt == 0) {
			return "board/insertboard";
		}
		return "redirect:/board/boardlist";
	}

}
