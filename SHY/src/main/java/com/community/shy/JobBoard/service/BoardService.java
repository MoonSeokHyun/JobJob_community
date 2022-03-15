package com.community.shy.JobBoard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.shy.JobBoard.mapper.IBoardMapper;
import com.community.shy.command.BoardVO;
import com.community.shy.util.PageVO;
@Service
public class BoardService implements IBoardService {
	
	@Autowired
	private IBoardMapper mapper; 
	
	@Override
	public List<BoardVO> getJBoard(int board_type, PageVO paging) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		Map<String, Object> data = new HashMap<>();
		data.put("board_type", board_type);
		data.put("paging", paging);
		
		return mapper.getJBoard(data);
	}

	@Override
	public void BoardRegist(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void DeleteBoard(int board_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardVO BoardDetail(int board_no, int board_type) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int getJTotal(PageVO paging , int board_type) {
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		Map<String, Object> data = new HashMap<>();
		data.put("board_type", board_type);
		data.put("paging", paging);
		
		return mapper.getJTotal(data);
	}

}
