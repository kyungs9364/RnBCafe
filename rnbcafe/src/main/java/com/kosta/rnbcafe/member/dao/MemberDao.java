package com.kosta.rnbcafe.member.dao;

import com.kosta.rnbcafe.member.dto.MemberDto;

public interface MemberDao {
	public MemberDto select(String username);
}
