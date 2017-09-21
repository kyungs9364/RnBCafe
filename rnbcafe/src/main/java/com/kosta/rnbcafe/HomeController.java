package com.kosta.rnbcafe;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.rnbcafe.admin.dto.BoardListDto;
import com.kosta.rnbcafe.admin.service.CategoryService;
import com.kosta.rnbcafe.member.dto.LoginUser;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger l = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Authentication authentication, HttpSession session) {
		ModelAndView mv = new ModelAndView("index");
		LoginUser user = (LoginUser) authentication.getPrincipal();
		l.info(user.toString());
		session.setAttribute("user", user);
		
		List<BoardListDto> list = categoryService.boardList();
		session.setAttribute("boardmenu", list);
		
		return mv;
	}
	
	@RequestMapping("/login")
	public String signin() {
		return "member/login";
	}
	
}
