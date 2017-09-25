package com.kosta.rnbcafe.member.service;

import com.kosta.rnbcafe.member.dto.MemberDto;

public interface MemberService {

	MemberDto select(String id);
	int insertMember(MemberDto memberDto);
	int selectBoardCnt(String id);
	int selectMemoCnt(String id);
	int updateMember(MemberDto memberDto);
	int deleteMember(String id);
}
