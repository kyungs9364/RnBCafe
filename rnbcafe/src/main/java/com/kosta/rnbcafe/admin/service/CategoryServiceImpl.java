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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void categoryMake(String cname) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardTypeDto> boardTypeList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void boardMake(BoardListDto boardListDto) {
		// TODO Auto-generated method stub
		
	}

}
