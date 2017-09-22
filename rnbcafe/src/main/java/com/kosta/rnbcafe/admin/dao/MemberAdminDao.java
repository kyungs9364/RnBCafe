package com.kosta.rnbcafe.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.rnbcafe.member.dto.MemberDto;

@Repository
public class MemberAdminDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<MemberDto> memberList() {
		return sqlSession.selectList("adminMapper.memberList");
	}
	
}
