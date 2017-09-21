package com.kosta.rnbcafe.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.rnbcafe.admin.dao.OneBoardDao;
import com.kosta.rnbcafe.board.dto.BoardDto;

@Service
public class OneBoardServiceImpl implements OneBoardService {

	@Autowired
	private OneBoardDao oneBoardDao;
	
	@Override
	public void writeOne(BoardDto boardDto) {
		oneBoardDao.writeOne(boardDto);
	}

	@Override
	public List<BoardDto> listOne(int bcode) {
		return oneBoardDao.listOne(bcode);
	}

	@Override
	public void modifyOne(BoardDto boardDto) {
		oneBoardDao.modifyOne(boardDto);
	}

	@Override
	public void deleteOne(int bseq) {
		oneBoardDao.deleteOne(bseq);
	}

}
