package com.community.shy.board.JobComment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.shy.board.JobComment.mapper.ICommentMapper;
import com.community.shy.board.command.CommentVO;
@Service
public class CommentService implements ICommentService {

	@Autowired
	private ICommentMapper mapper;
	
	@Override
	public void CommentRegist(CommentVO vo) {
		mapper.CommentRegist(vo);

	}

	@Override
	public List<CommentVO> getList(int com_bno) {
		return mapper.getList(com_bno);
	}

	@Override
	public int getTotal(int com_bno) {
		// TODO Auto-generated method stub
		return mapper.getTotal(com_bno);
	}

	@Override
	public List<CommentVO> myRecord(String writer) {
		return mapper.myRecord(writer);
	}

	@Override
	public void commentDelete(CommentVO vo) {
		mapper.commentDelete(vo);
		
	}
	
	@Override
	public List<CommentVO> getComList(String com_wrtier) {
		return mapper.getComList(com_wrtier);
	}

}
