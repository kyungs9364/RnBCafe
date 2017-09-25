package com.kosta.rnbcafe.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.rnbcafe.member.dao.MemberDao;
import com.kosta.rnbcafe.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;

	@Override
	public MemberDto select(String id) {
		return dao.select(id);
	}

	@Override
	public int insertMember(MemberDto memberDto) {
		return dao.insertMember(memberDto);
	}

	@Override
	public int selectBoardCnt(String id) {
		return dao.selectBoardCnt(id);
	}

	@Override
	public int selectMemoCnt(String id) {
		return dao.selectMemoCnt(id);
	}

	@Override
	public int updateMember(MemberDto memberDto) {
		return dao.updateMember(memberDto);
	}

	@Override
	public int deleteMember(String id) {
		return dao.deleteMember(id);
	}

}
