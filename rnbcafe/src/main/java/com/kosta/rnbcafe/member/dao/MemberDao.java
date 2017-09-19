package com.kosta.rnbcafe.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.rnbcafe.member.dto.MemberDto;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	public MemberDto select(String id) {
		return sqlSession.selectOne("memberMapper.select", id);
	};
}
