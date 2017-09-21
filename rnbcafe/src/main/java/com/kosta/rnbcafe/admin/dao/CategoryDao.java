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
//	List<CategoryDto> categoryList();
//	void categoryMake(String cname);
//	List<BoardTypeDto> boardTypeList();
//	void boardMake(BoardListDto boardListDto);
	
}
