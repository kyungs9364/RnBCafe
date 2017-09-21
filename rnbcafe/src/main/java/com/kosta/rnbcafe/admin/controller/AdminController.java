package com.kosta.rnbcafe.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.rnbcafe.admin.dto.*;
import com.kosta.rnbcafe.admin.service.CategoryService;

@Controller
@RequestMapping(value="/admin/")
public class AdminController {
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="categoryadmin")
	public ModelAndView categoryAdmin(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<CategoryDto> clist = categoryService.categoryList();
		List<BoardTypeDto> btlist = categoryService.boardTypeList();
		mav.addObject("clist", clist);
		mav.addObject("btlist", btlist);
		mav.setViewName("/admin/category");
		
		List<BoardListDto> list = categoryService.boardList();
		session.setAttribute("boardmenu", list);
		
		return mav;
	}
	
	@RequestMapping(value="makecategory", method=RequestMethod.GET)
	public String makeCategory(@RequestParam("name") String name) {
		categoryService.categoryMake(name);
		return "redirect:/admin/categoryadmin";
	}
	
	@RequestMapping(value="makeboard", method=RequestMethod.GET)
	public String makeBoard(BoardListDto boardListDto) {
		categoryService.boardMake(boardListDto);
		return "redirect:/admin/categoryadmin";
	}
	

}
