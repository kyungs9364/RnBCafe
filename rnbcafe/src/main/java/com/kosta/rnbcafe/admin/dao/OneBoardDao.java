package com.kosta.rnbcafe.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.rnbcafe.board.dto.BoardDto;

@Repository
public class OneBoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void writeOne(BoardDto boardDto) {
		sqlSession.insert("adminMapper.writeOne", boardDto);
	}
	
	public List<BoardDto> listOne(int bcode) {
		return sqlSession.selectList("adminMapper.listOne", bcode);
	}
	public void modifyOne(BoardDto boardDto) {
		sqlSession.update("adminMapper.modifyOne", boardDto);
	}
	public void deleteOne(int bseq) {
		sqlSession.delete("adminMapper.deleteOne", bseq);
	}
	
}
