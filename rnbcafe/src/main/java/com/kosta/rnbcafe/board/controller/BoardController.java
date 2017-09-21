package com.kosta.rnbcafe.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.rnbcafe.board.dto.BoardDto;
import com.kosta.rnbcafe.board.service.BoardServiceImpl;
import com.kosta.rnbcafe.member.dto.MemberDto;

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
		
		int cnt = service.insertBoard(dto);
		if(cnt == 0) {
			return "board/insertboard";
		}
		return "redirect:/board/boardlist";
	}
	
	@RequestMapping(value="boardview")
	public String boradview(Model model, int bseq) {
		BoardDto dto = service.boradview(bseq);
		model.addAttribute("dto", dto);
		
		return "board/boardview";
	}

}
