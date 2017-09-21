package com.kosta.rnbcafe.admin.service;

import java.util.List;

import com.kosta.rnbcafe.admin.dto.*;

public interface CategoryService {

	List<BoardListDto> boardList();
	List<CategoryDto> categoryList();
	void categoryMake(String cname);
	List<BoardTypeDto> boardTypeList();
	void boardMake(BoardListDto boardListDto);

}
