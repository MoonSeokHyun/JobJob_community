package com.community.shy.JobBoard.service;

import java.util.ArrayList;
import java.util.List;

import com.community.shy.command.BoardVO;
import com.community.shy.util.PageVO;


public interface IBoardService {
//	게시판 구분 
	List<BoardVO> getJBoard(int board_type ,PageVO paging);

//	글등록
	void BoardJRegist(BoardVO vo);
//	삭제
	void JBoardDelete(int board_no);
//	상세보기
	BoardVO JBoardDetail(int board_no, int board_type);
//	총게시물수 
	int getJTotal(PageVO vo, int board_type);
//	게시물을 만들때 타입을 전달
	List<BoardVO>  getBoard(int board_type);
//	게시물 수정
	void JBoardUpdate(BoardVO vo);
//  메인용 리스트
	List<BoardVO> mainBoard(BoardVO vo);

	List<BoardVO> getJBoardForMain(ArrayList board_types);
}
