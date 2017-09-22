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
	Result result = new Result();
	
	@RequestMapping("getoneboard")
	private ModelAndView getOneBoard(String bcode) {
		ModelAndView mv = new ModelAndView("admin/oneboard");
		mv.addObject("bcode", bcode);
		return mv;
	}
	
	@RequestMapping("makeList")
	@ResponseBody
	private Result makeList(int bcode) {
		List<BoardDto> list = oneBoardService.listOne(bcode);
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

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public @ResponseBody Result write(BoardDto boardDto, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		boardDto.setId(memberDto.getId());
		try {
			oneBoardService.writeOne(boardDto);
			result.setSuccess(true);
			result.setObject(makeList(boardDto.getBcode()));
		} catch (Exception e) {
			result.setSuccess(false);
		}
//		JSONObject json = makeList(boardDto.getBcode());
      
		return result;
   }
   
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public @ResponseBody Result modify(BoardDto boardDto, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("user");
		try {
			oneBoardService.modifyOne(boardDto);
			result.setSuccess(true);
			result.setObject(makeList(boardDto.getBcode()));
		} catch (Exception e) {
			result.setSuccess(false);
		}
      
//		JSONObject json = makeList(boardDto.getBcode());
      
		return result;
	}
   
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public @ResponseBody Result list(@RequestParam("bcode") int bcode) {
      
		result.setObject(makeList(bcode));
//		JSONObject json = makeList(bcode);
      
		return result;
	}
   
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public @ResponseBody Result delete(@RequestParam("bcode") int bcode, @RequestParam("bseq") int bseq)  {
		try {
			oneBoardService.deleteOne(bseq);
			result.setSuccess(true);
			result.setObject(makeList(bcode));
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
//		JSONObject json = makeList(bcode);
      
		return result;
	}

}
