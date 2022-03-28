package com.community.shy.board.JobBoard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.shy.board.JobBoard.mapper.IBoardMapper;
import com.community.shy.board.command.BoardVO;
import com.community.shy.board.util.PageVO;
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
	public List<BoardVO> getJBoardForMain(ArrayList board_types) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		Map<String, Object> data = new HashMap<>();
		data.put("board_types", board_types);
		
		return mapper.getJBoardForMain(data);
	}

	@Override
	public void BoardJRegist(BoardVO vo) {
		mapper.BoardJRegist(vo);

	}

	@Override
	public void JBoardDelete(int board_no) {
		mapper.JBoardDelete(board_no);

	}

	@Override
	public BoardVO JBoardDetail(int board_no, int board_type, String user_id) {
		
		Map<String, Object> data = new HashMap<>();
		data.put("board_no", board_no);
		data.put("board_type", board_type);
		data.put("user_id", user_id);
		
		return mapper.JBoardDetail(data);
	}
	
	@Override
	public int getJTotal(PageVO paging , int board_type) {
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		Map<String, Object> data = new HashMap<>();
		data.put("board_type", board_type);
		data.put("paging", paging);
		
		return mapper.getJTotal(data);
	}
	
	@Override
	public List<BoardVO> getBoard(int board_type) {
		return mapper.getBoard(board_type);
	}
	@Override
	public void JBoardUpdate(BoardVO vo) {
		mapper.JBoardUpdate(vo);		
	}
	@Override
	public List<BoardVO> mainBoard(BoardVO vo) {
		
		return mapper.mainBoard(vo);
	}

	@Override
	public List<BoardVO> myRecord(String writer) {
		return mapper.myRecord(writer);
	}

	@Override
	public List<BoardVO> getBest(List<BoardVO> best) {
		return mapper.getBest(best);
	}

	@Override
	public boolean updateHit(int board_no) {
		return mapper.updateHit(board_no);
	}
	public void insertBoardCnt(Map<String, Object> param) {
		mapper.insertBoardCnt(param);
	}
	
	@Override
	public List<BoardVO> getAdminList() {
		return mapper.getAdminList();
	}
	
	@Override
	public List<BoardVO> getUserBoardList(String board_writer) {
		return mapper.getUserBoardList(board_writer);
	}
	@Override
	public List<BoardVO> getAllboard() {
		return mapper.getAllboard();
	}
	@Override
	public List<Integer> getAllTotal() {
		return mapper.getAllTotal();
	}
	@Override
	public List<HashMap<String, Object>> admin_findDate(String date1, String date2) {

		return mapper.admin_findDate(date1, date2);
	}

	
}
