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
	}
	
	public int insertMember(MemberDto memberDto) {
		return sqlSession.insert("memberMapper.insertMember", memberDto);
	}
	
	public int selectBoardCnt(String id) {
		return sqlSession.selectOne("memberMapper.selectBoardCnt", id); 
	}
	
	public int selectMemoCnt(String id) {
		return sqlSession.selectOne("memberMapper.selectMemoCnt", id);
	}
	
	public int updateMember(MemberDto memberDto) {
		return sqlSession.update("memberMapper.updateMember", memberDto);
	}
	
	public int deleteMember(String id) {
		System.out.println("################################delete");
		return sqlSession.delete("memberMapper.deleteMember", id);
	}
}
