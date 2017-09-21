package com.kosta.rnbcafe.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.rnbcafe.admin.dto.*;
import com.kosta.rnbcafe.admin.service.OneBoardService;
import com.kosta.rnbcafe.board.dto.BoardDto;
import com.kosta.rnbcafe.member.dto.MemberDto;
import com.kosta.rnbcafe.util.Result;

@Controller
@RequestMapping(value="/oneboard/")
public class OneController {
	
	@Autowired
	private OneBoardService oneBoardService;
	
	@RequestMapping("makeList")
	@ResponseBody
	private Result makeList(int bcode) {
		Result result = new Result();
		List<BoardDto> list = oneBoardService.listOne(bcode);
		System.out.println(list.size());
		result.setItems(list);
//		JSONObject json = new JSONObject();
//		JSONArray jarr = new JSONArray();
//		for(BoardDto boardDto : list) {
//		JSONObject jobj = new JSONObject();
//		jobj.put("bseq", boardDto.getBseq());
//		jobj.put("bcode", boardDto.getBcode());
//		jobj.put("id", boardDto.getId());
//		jobj.put("title", boardDto.getTitle());
//		jobj.put("regdate", boardDto.getRegdate());
//		jarr.add(jobj);
//		}
//		json.put("memolist", jarr);
		return result;
	}

//	@RequestMapping(value="/write", method=RequestMethod.POST)
//	public @ResponseBody String write(BoardDto boardDto, HttpSession session) {
//		MemberDto memberDto = (MemberDto) session.getAttribute("user");
//		boardDto.setUserId(usersDto.getUserId());
//		boardDto.setName(usersDto.getName());
//		memoService.writeMemo(memoDto);
//      
//		JSONObject json = makeList(memoDto.getSeq());
//      
//		return json.toJSONString();
//   }
//   
//	@RequestMapping(value="/modify", method=RequestMethod.POST)
//	public @ResponseBody String modify(BoardDto boardDto, HttpSession session) {
//		UsersDto usersDto = (UsersDto) session.getAttribute("user");
//
//		memoService.modifyMemo(memoDto);
//      
//		JSONObject json = makeList(memoDto.getSeq());
//      
//		return json.toJSONString();
//	}
//   
//	@RequestMapping(value="/list", method=RequestMethod.GET)
//	public @ResponseBody String list(@RequestParam("seq") int seq) {
//      
//		JSONObject json = makeList(seq);
//      
//		return json.toJSONString();
//	}
//   
//	@RequestMapping(value="/delete", method=RequestMethod.GET)
//	public @ResponseBody String delete(@RequestParam("seq") int seq, @RequestParam("mseq") int mseq)  {
//		memoService.deleteMemo(mseq);
//		JSONObject json = makeList(seq);
//      
//		return json.toJSONString();
//	}

}
