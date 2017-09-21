package com.kosta.rnbcafe.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.rnbcafe.admin.dao.CategoryDao;
import com.kosta.rnbcafe.admin.dto.*;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<BoardListDto> boardList() {
		return categoryDao.boardList();
	}

	@Override
	public List<CategoryDto> categoryList() {
		return categoryDao.categoryList();
	}

	@Override
	public void categoryMake(String cname) {
		categoryDao.categoryMake(cname);
	}

	@Override
	public List<BoardTypeDto> boardTypeList() {
		return categoryDao.boardTypeList();
	}

	@Override
	public void boardMake(BoardListDto boardListDto) {
		categoryDao.boardMake(boardListDto);
	}

}
