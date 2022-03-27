package com.community.shy.board.JobBoard.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.community.shy.board.command.BoardVO;
import com.community.shy.board.util.PageVO;



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
	
	//내가 쓴글 불러오기
	List<BoardVO> myRecord(String writer);
	
	//어드민용 메인페이지
	List<BoardVO> getAdminList();
	//어드민용 유저게시판 정보 
	List<BoardVO> getUserBoardList(String board_writer);
	//전체 페이지
	List<BoardVO> getAllboard();
	//어드민 데이터보여주긔 
	List<Integer> getAllTotal();
	List<HashMap<String, Object>> admin_findDate(@Param("date1") String date1 ,@Param("date2") String date2);
}
