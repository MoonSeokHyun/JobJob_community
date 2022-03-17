package com.community.shy.JobBoard.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.community.shy.command.BoardVO;
import com.community.shy.util.PageVO;



public interface IBoardMapper {
//	게시판 구분 
	List<BoardVO> getJBoard(Map<String, Object> data);
//	글등록
	void BoardJRegist(BoardVO vo);
//	삭제
	void JBoardDelete(int board_no);
//	상세보기
	BoardVO JBoardDetail(Map<String, Object> data);
//	총게시물수
	int getJTotal(Map<String, Object> data);
//	타입을 전달할 Vo 객체
	List<BoardVO> getBoard(int board_type);
//	게시물 수정
	void JBoardUpdate(BoardVO vo);
//	메인용 리스트
	List<BoardVO> mainBoard(BoardVO vo);
	List<BoardVO> getJBoardForMain(Map<String, Object> data);
}
