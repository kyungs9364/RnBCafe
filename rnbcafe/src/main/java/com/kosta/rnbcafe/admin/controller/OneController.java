package com.kosta.rnbcafe.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.rnbcafe.admin.dto.*;
import com.kosta.rnbcafe.admin.service.OneBoardService;
import com.kosta.rnbcafe.board.dto.BoardDto;
import com.kosta.rnbcafe.member.controller.MemberController;
import com.kosta.rnbcafe.member.dto.LoginUser;
import com.kosta.rnbcafe.member.dto.MemberDto;
import com.kosta.rnbcafe.util.Result;

@Controller
@RequestMapping(value="/oneboard/")
public class OneController {
	private static final Logger l = LoggerFactory.getLogger(OneController.class);
	
	@Autowired
	private OneBoardService oneBoardService;
	Result result = new Result();
	
	@RequestMapping("getoneboard")
	private ModelAndView getOneBoard(String bcode, String bname) {
		ModelAndView mv = new ModelAndView("admin/oneboard");
		mv.addObject("bcode", bcode);
		mv.addObject("bname", bname);
		return mv;
	}
	
	@RequestMapping("makeList")
	@ResponseBody
	private Result makeList(int bcode) {
//		List<BoardDto> list = ;
		result.setItems(oneBoardService.listOne(bcode));
		result.setSuccess(true);
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
		LoginUser memberDto = (LoginUser) session.getAttribute("user");
		boardDto.setId(memberDto.getId());
		try {
			l.info("######################### write Board dto ==== "+ boardDto);
			oneBoardService.writeOne(boardDto);
			result.setSuccess(true);
//			makeList(boardDto.getBcode());
		} catch (Exception e) {
			result.setSuccess(false);
		}
//		JSONObject json = makeList(boardDto.getBcode());
      
		return result;
   }
   
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public @ResponseBody Result modify(BoardDto boardDto, HttpSession session) {
		LoginUser memberDto = (LoginUser)session.getAttribute("user");
		boardDto.setId(memberDto.getId());
		try {
			oneBoardService.modifyOne(boardDto);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
      
//		JSONObject json = makeList(boardDto.getBcode());
      
		return result;
	}
   
//	@RequestMapping(value="/list", method=RequestMethod.GET)
//	public @ResponseBody Result list(@RequestParam("bcode") int bcode) {
//      
//		result.setObject(makeList(bcode));
////		JSONObject json = makeList(bcode);
//      
//		return result;
//	}
   
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public @ResponseBody Result delete(@RequestParam("bcode") int bcode, @RequestParam("bseq") int bseq)  {
		try {
			oneBoardService.deleteOne(bseq);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		return result;
	}

}
