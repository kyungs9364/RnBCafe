package com.kosta.rnbcafe.board.service;

import java.util.List;
import java.util.Map;

import com.kosta.rnbcafe.board.dto.BoardDto;

public interface BoardService {
	int insertBoard(BoardDto dto);
	int insertNotice(BoardDto dto);
	List<BoardDto> boardList(Map<String, Integer> map);
	BoardDto boradView(int bseq);
	void hit(int bseq);
	int deleteBoard(int bseq);
	int updateBoard(BoardDto dto);
	List<BoardDto> searchBoardList(Map<String, String> map);
	int allBoardCnt(int bcode);
	int searchListCnt(Map<String, String> map);
	List<BoardDto> imgBoardList(Map<String, Integer> map);
}
