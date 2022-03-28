package com.community.shy.board.JobComment.service;

import java.util.List;

import com.community.shy.board.command.CommentVO;


public interface ICommentService {
	
	
	void CommentRegist(CommentVO vo); //댓글 등록
	List<CommentVO> getList(int com_bno); //목록 요청
	int getTotal(int com_bno); //댓글 개수
	List<CommentVO> myRecord(String writer);
	void commentDelete(CommentVO vo);
	
	List<CommentVO> getComList(String com_wrtier); //어드민용 회원 댓글 불러오긔
	
//	int pwCheck(ReplyVO vo); //비밀번호 확인
//	void update(ReplyVO vo); //댓글 수정
//	void delete(int rno); //댓글 삭제
}
