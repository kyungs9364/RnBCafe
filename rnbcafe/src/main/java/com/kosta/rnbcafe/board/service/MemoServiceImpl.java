package com.kosta.rnbcafe.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.rnbcafe.board.dao.MemoDao;
import com.kosta.rnbcafe.board.dto.MemoDto;

@Service
public class MemoServiceImpl implements MemoService {
	
	@Autowired
	private MemoDao dao;

	@Override
	public int insertMemo(MemoDto dto) {
		// TODO Auto-generated method stub
		return dao.insertMemo(dto);
	}

	@Override
	public List<MemoDto> memoList(int bseq) {
		// TODO Auto-generated method stub
		return dao.memoList(bseq);
	}

	@Override
	public MemoDto topMemo(int bseq) {
		// TODO Auto-generated method stub
		return dao.topMemo(bseq);
	}

}
