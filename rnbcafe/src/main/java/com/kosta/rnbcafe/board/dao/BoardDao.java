package com.kosta.rnbcafe.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.rnbcafe.board.dto.BoardDto;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertBoard", dto);
	}
	
	public List<BoardDto> boardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.boardList");
	}
	
	public BoardDto boradview(int bseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.boradview", bseq);
	}
}
