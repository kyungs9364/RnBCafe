package com.kosta.rnbcafe.board.dao;

import java.util.List;
import java.util.Map;

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
	
	public List<BoardDto> boardList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.boardList", map);
	}
	
	public BoardDto boradView(int bseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.boradview", bseq);
	}
	
	public void hit(int bseq) {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.hit",bseq);
	}
	
	public int deleteBoard(int bseq) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.deleteBoard", bseq);
	}
	
	public int updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateBoard", dto);
	}
	
	public List<BoardDto> searchBoardList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.searchBoardList", map);
	}
	
	public int allBoardCnt(int bcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.allBoardCnt", bcode);
	}

	public int searchListCnt(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.searchListCnt", map);
	}
	
	public List<BoardDto> imgBoardList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.imgBoardList", map);
	}

}
