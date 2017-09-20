package com.kosta.rnbcafe.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.rnbcafe.member.dao.MemberDao;
import com.kosta.rnbcafe.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;

	@Override
	public int insertMember(MemberDto memberDto) {
		return dao.insertMember(memberDto);
	}

}
