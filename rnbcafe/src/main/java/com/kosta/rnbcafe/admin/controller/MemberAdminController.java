package com.kosta.rnbcafe.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.rnbcafe.admin.dto.*;
import com.kosta.rnbcafe.admin.service.MemberAdminService;
import com.kosta.rnbcafe.member.dto.MemberDto;

@Controller
@RequestMapping(value="/memberadmin/")
public class MemberAdminController {
	
	@Autowired
	private MemberAdminService memberAdminService;
	
	@RequestMapping(value="list")
	public ModelAndView categoryAdmin() {
		ModelAndView mav = new ModelAndView();
		List<MemberDto> mlist = memberAdminService.memberList();
		mav.addObject("mlist", mlist);
		mav.setViewName("/admin/memberadmin");
		
		return mav;
	}
	
//	@RequestMapping(value="makecategory", method=RequestMethod.GET)
//	public String makeCategory(@RequestParam("name") String name) {
//		categoryService.categoryMake(name);
//		return "redirect:/admin/categoryadmin";
//	}
//	
//	@RequestMapping(value="makeboard", method=RequestMethod.GET)
//	public String makeBoard(BoardListDto boardListDto) {
//		categoryService.boardMake(boardListDto);
//		return "redirect:/admin/categoryadmin";
//	}
	

}
