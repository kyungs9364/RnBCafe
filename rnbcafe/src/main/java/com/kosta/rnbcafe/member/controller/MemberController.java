package com.kosta.rnbcafe.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.kosta.rnbcafe.cofig.MemberDetailService;
import com.kosta.rnbcafe.member.dto.MemberDto;
import com.kosta.rnbcafe.member.service.MemberService;
import com.kosta.rnbcafe.util.Result;

@Controller
@RequestMapping(value="/member/")
public class MemberController {
	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	Result result = new Result();
	@Autowired
	protected MemberService service;

	@RequestMapping(value="join")
	public String test() {
		return "member/join";
	}
	
	@RequestMapping(value="insert")
	@ResponseBody
	public Result insertMember(@ModelAttribute MemberDto memberDto) {
		BCryptPasswordEncoder bcr = new BCryptPasswordEncoder();
		memberDto.setPwd(bcr.encode(memberDto.getPwd()));
		int cnt = service.insertMember(memberDto);
		if (cnt != 1) {
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		
		return result;
	}
	
}