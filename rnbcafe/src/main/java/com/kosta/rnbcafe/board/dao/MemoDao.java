package com.kosta.rnbcafe.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.rnbcafe.board.dto.MemoDto;

@Repository
public class MemoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertMemo(MemoDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertMemo", dto);
	}
	
	public List<MemoDto> memoList(int bseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.memoList", bseq);
	}
}
