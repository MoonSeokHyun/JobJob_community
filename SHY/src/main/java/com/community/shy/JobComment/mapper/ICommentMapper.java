package com.community.shy.JobComment.mapper;

import java.util.List;

import com.community.shy.command.CommentVO;

public interface ICommentMapper {
	void CommentRegist(CommentVO vo); //댓글 등록
	List<CommentVO> getList(int com_bno); //목록 요청
	int getTotal(int com_bno); //댓글 개수
}
