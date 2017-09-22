package com.kosta.rnbcafe.board.service;

import java.util.List;

import com.kosta.rnbcafe.board.dto.BoardDto;

public interface BoardService {
	int insertBoard(BoardDto dto);
	List<BoardDto> boardList(int bcode);
	BoardDto boradView(int bseq);
	void hit(int bseq);
	int deleteBoard(int bseq);
	int updateBoard(BoardDto dto);
}
