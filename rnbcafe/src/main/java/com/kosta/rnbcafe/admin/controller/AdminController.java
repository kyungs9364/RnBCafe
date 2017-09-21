package com.kosta.rnbcafe.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.rnbcafe.admin.dto.BoardListDto;
import com.kosta.rnbcafe.admin.service.CategoryService;

@Controller
@RequestMapping(value="/admin/")
public class AdminController {
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="boardmenu")
	public ModelAndView baseside(HttpSession session) {
		ModelAndView mav = new ModelAndView("/index");
		List<BoardListDto> list = categoryService.boardList();
		session.setAttribute("boardmenu", list);
		//mav.addObject("boardmenu", list);
		//mav.setViewName();
		return mav;
	}

}
