package com.kosta.rnbcafe.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.rnbcafe.cofig.MemberDetailService;
import com.kosta.rnbcafe.member.dto.MemberDto;
import com.kosta.rnbcafe.member.service.MemberService;
import com.kosta.rnbcafe.util.Result;

@Controller
@RequestMapping(value="/member/")
public class MemberController {
	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	Result result = new Result();

	@RequestMapping("join")
	public String test() {
		return "member/join";
	}
	
	@RequestMapping("update")
	public ModelAndView updateMember(String id) {
		ModelAndView mv = new ModelAndView("member/updatemember");
		mv.addObject("member", service.select(id));
		return mv;
	}
	
	@RequestMapping("idCheck")
	@ResponseBody
	public Result idCheck(String id) {
		MemberDto memberDto = service.select(id);
		if (memberDto != null) {
			result.setSuccess(false);
			result.setMsg("사용 불가능");
		} else {
			result.setSuccess(true);
			result.setMsg("사용 가능");
		}
		
		return result;
	}
	
	@RequestMapping("insertMember")
	@ResponseBody
	public Result insertMember(@ModelAttribute MemberDto memberDto) {
		l.info("####### insertMember  ==  "+memberDto.toString());
		BCryptPasswordEncoder bcr = new BCryptPasswordEncoder();
		memberDto.setPwd(bcr.encode(memberDto.getPwd()));
		int cnt = service.insertMember(memberDto);
		if (cnt == 1) {
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}
	
	@RequestMapping("myinfo")
	@ResponseBody
	public Result getMyinfo(String id) {
		l.info("############# id===" + id);
		l.info("############# cntB===" + service.selectBoardCnt(id));
		l.info("############# cntM===" + service.selectMemoCnt(id));
		try {
			MemberDto memberDto = service.select(id);
			memberDto.setBoardCnt(service.selectBoardCnt(id));
			memberDto.setMemoCnt(service.selectMemoCnt(id));
			l.info("############# cnt==== "+memberDto.toString());
			result.setObject(memberDto);
			result.setSuccess(true);
		} catch (Exception e) {
			e.getStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	
	@RequestMapping("updateMember")
	@ResponseBody
	public Result updateMember(@ModelAttribute MemberDto memberDto, HttpSession session) {
		l.info("####### updateMember  ==  "+memberDto.toString());
		MemberDto member = service.select(memberDto.getId());
		l.info("####### updateMember 객체 BEFORE  ==  "+member.toString());
		if (memberDto.getPwd() != null || !"".equals(memberDto.getPwd())) {
			BCryptPasswordEncoder bcr = new BCryptPasswordEncoder();
			member.setPwd(bcr.encode(memberDto.getPwd()));
		}
		if (memberDto.getName() != null || !"".equals(memberDto.getName())) {
			member.setName(memberDto.getName());
		}
		if (memberDto.getPhone() != null || !"".equals(memberDto.getPhone())) {
			member.setPhone(memberDto.getPhone());
		}
		int cnt = service.updateMember(member);
		if (cnt == 1) {
			result.setSuccess(true);
			l.info("####### updateMember 객체 AFTER  ==  "+member.toString());
			session.setAttribute("user", member);
		} else {
			result.setSuccess(false);
		}
		return result;
	}
	
	@RequestMapping("deleteMember")
	@ResponseBody
	public Result deleteMember(String id) {
		l.info("####### deleteMember ID  ==  "+id);
		int cnt = service.deleteMember(id);
		if (cnt == 1) {
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}
	
}














