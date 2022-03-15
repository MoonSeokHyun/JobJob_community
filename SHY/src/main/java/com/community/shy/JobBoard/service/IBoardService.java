package com.community.shy.JobBoard.service;

import java.util.List;

import com.community.shy.command.BoardVO;
import com.community.shy.util.PageVO;


public interface IBoardService {
//	게시판 구분 
	List<BoardVO> getJBoard(int board_type ,PageVO paging);
//	글등록
	void BoardRegist(BoardVO vo);
//	삭제
	void DeleteBoard(int board_no);
//	상세보기
	BoardVO BoardDetail(int board_no, int board_type);
//	총게시물수 
	int getJTotal(PageVO vo, int board_type);
}
