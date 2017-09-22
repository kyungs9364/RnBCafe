package com.kosta.rnbcafe.board.service;

import java.util.List;

import com.kosta.rnbcafe.board.dto.MemoDto;

public interface MemoService {

	List<MemoDto> memoList(int bseq);
	int insertMemo(MemoDto dto);
	MemoDto topMemo(int bseq);
}
