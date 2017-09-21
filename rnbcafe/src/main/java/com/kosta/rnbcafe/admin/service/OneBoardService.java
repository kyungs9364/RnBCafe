package com.kosta.rnbcafe.admin.service;

import java.util.List;

import com.kosta.rnbcafe.board.dto.BoardDto;

public interface OneBoardService {

	void writeOne(BoardDto boardDto);
	List<BoardDto> listOne(int bcode);
	void modifyOne(BoardDto boardDto);
	void deleteOne(int bseq);
}
