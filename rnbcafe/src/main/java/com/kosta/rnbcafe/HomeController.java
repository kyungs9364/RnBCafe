package com.kosta.rnbcafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.rnbcafe.member.dto.LoginUser;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger l = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Authentication authentication, Model md) {
		ModelAndView mv = new ModelAndView("index");
		LoginUser user = (LoginUser) authentication.getPrincipal();
		l.info(user.toString());
		md.addAttribute("user", user);
		return mv;
	}
	
	@RequestMapping("/login")
	public String signin() {
		return "member/login";
	}
	
}
