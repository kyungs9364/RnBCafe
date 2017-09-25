package com.kosta.rnbcafe.board.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.kosta.rnbcafe.board.BoardSet;
import com.kosta.rnbcafe.board.dto.BoardDto;
import com.kosta.rnbcafe.board.dto.MemoDto;
import com.kosta.rnbcafe.board.service.BoardServiceImpl;
import com.kosta.rnbcafe.board.service.MemoServiceImpl;
import com.kosta.rnbcafe.member.dto.MemberDto;
import com.kosta.rnbcafe.util.Result;

@Controller
@RequestMapping(value="/board/")
public class BoardController {
	
	@Autowired
	private BoardServiceImpl service;
	@Autowired
	private MemoServiceImpl mservice;
	
	BoardSet bset = new BoardSet();
	
	@RequestMapping(value = "boardset")
	public String boardSet(int bcode) {
		bset.setBcode(bcode);
		
		return "redirect:/board/boardlist";
	}
	
	@RequestMapping(value="boardlist")
	public String boardList(Model model) {
		List<BoardDto> list = service.boardList(bset.getBcode());
		model.addAttribute("list",list);
		
		return "board/boardlist";
	}
	
	@RequestMapping(value="insertboard")
	public String insertform() {
		
		return "board/insertboard";
	}
	
	@RequestMapping(value="insertboard", method=RequestMethod.POST)
	public String insertBoard(BoardDto dto) {
		dto.setBcode(bset.getBcode());
		int cnt = service.insertBoard(dto);
		if(cnt == 0) {
			return "common/err";
		}
		return "redirect:/board/boardlist";
	}
	
	@RequestMapping(value="boardview")
	public String boradview(Model model, int bseq) {
		service.hit(bseq);
		List<MemoDto> mlist =  mservice.memoList(bseq);
		BoardDto dto = service.boradView(bseq);
		model.addAttribute("dto", dto);
		model.addAttribute("mlist", mlist);
		
		return "board/boardview";
	}
	
	@RequestMapping(value="updateboard")
	public String updateForm(Model model, int bseq) {
		BoardDto dto = service.boradView(bseq);
		model.addAttribute("dto", dto);
		return "board/updateboard";
	}
	
	@RequestMapping(value="updateboard", method=RequestMethod.POST)
	public String updateBoard(Model model, BoardDto dto) {
		
		int cnt = service.updateBoard(dto);
		if(cnt == 0) {
			return "common/err";
		}
		
		return "redirect:/board/boardview?bseq="+dto.getBseq();
	}
	
	@RequestMapping(value="deleteboard")
	public String deleteBoard(int bseq) {
		int cnt = service.deleteBoard(bseq);
		if(cnt == 0) {
			return "common/err";
		}
		return "redirect:/board/boardlist";
	}
	
	@ResponseBody
	@RequestMapping(value="insertmemo")
	public Result insertMemo(MemoDto dto) {
		
		Result result = new Result();
		try {
			int cnt = mservice.insertMemo(dto);
			if (cnt !=0) {
				MemoDto topDto = mservice.topMemo(dto.getBseq());
				result.setSuccess(true);
				result.setObject(topDto);				
			} 
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@RequestMapping(value="deletememo")
	public String deleteMemo(int mseq, int bseq) {
		
		int cnt = mservice.deleteMemo(mseq);
		if(cnt == 0) {
			return "common/err";
		}
		
		return "redirect:/board/boardview?bseq="+bseq;
	}
	
	@RequestMapping(value="searchboardlist")
	public String searchBoardList(String key, String word, Model model) {
		
		Map<String, String> map = new HashMap<>();
		map.put("key", key);
		map.put("word", word);
		map.put("bcode", String.valueOf(bset.getBcode()));
		
//		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4" + map.get("key"));
//		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4" + map.get("word"));

		List<BoardDto> list = service.searchBoardList(map);
		model.addAttribute("list", list);
		
		return "board/boardlist";
		
	}
	
}
