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
	void BoardRegist(BoardVO vo);
//	삭제
	void DeleteBoard(int board_no);
//	상세보기
	BoardVO BoardDetail(int board_no, int board_type);
//	총게시물수
	int getJTotal(Map<String, Object> data);
}
