package com.kosta.rnbcafe.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.rnbcafe.admin.dto.*;

@Repository
public class CategoryDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardListDto> boardList() {
		return sqlSession.selectList("adminMapper.boardList");
	}
	public List<CategoryDto> categoryList() {
		return sqlSession.selectList("adminMapper.categoryList");
	}

	public List<BoardTypeDto> boardTypeList() {
		return sqlSession.selectList("adminMapper.boardTypeList");
	}
	
	public void categoryMake(String cname) {
		sqlSession.insert("adminMapper.categoryMake", cname);
	}
	public void boardMake(BoardListDto boardListDto) {
		sqlSession.insert("adminMapper.boardMake", boardListDto);
	}
	
}
