package com.kosta.rnbcafe.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.rnbcafe.board.dao.BoardDao;
import com.kosta.rnbcafe.board.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public int insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.insertBoard(dto);
	}
	
	@Override
	public int insertNotice(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.insertNotice(dto);
	}

	@Override
	public List<BoardDto> boardList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.boardList(map);
	}

	@Override
	public BoardDto boradView(int bseq) {
		// TODO Auto-generated method stub
		return dao.boradView(bseq);
	}

	@Override
	public void hit(int bseq) {
		// TODO Auto-generated method stub
		dao.hit(bseq);
	}

	@Override
	public int deleteBoard(int bseq) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(bseq);
	}

	@Override
	public int updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.updateBoard(dto);
	}

	@Override
	public List<BoardDto> searchBoardList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchBoardList(map);
	}

	@Override
	public int allBoardCnt(int bcode) {
		// TODO Auto-generated method stub
		return dao.allBoardCnt(bcode);
	}

	@Override
	public int searchListCnt(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchListCnt(map);
	}

	@Override
	public List<BoardDto> imgBoardList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.imgBoardList(map);
	}

	@Override
	public int imgBoardCnt() {
		// TODO Auto-generated method stub
		return dao.imgBoardCnt();
	}

}
