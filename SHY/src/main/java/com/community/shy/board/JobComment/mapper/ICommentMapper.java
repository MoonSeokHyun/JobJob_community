package com.community.shy.board.JobComment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.shy.board.command.CommentVO;

public interface ICommentMapper {
	void CommentRegist(CommentVO vo); //댓글 등록
	List<CommentVO> getList(int com_bno); //목록 요청
	int getTotal(int com_bno); //댓글 개수
	List<CommentVO> myRecord(String writer);
	void commentDelete(CommentVO vo);
	
	List<CommentVO> getComList(String com_wrtier);//어드민용
}
