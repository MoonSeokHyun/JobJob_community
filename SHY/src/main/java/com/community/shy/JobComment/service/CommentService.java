package com.community.shy.JobComment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.shy.JobComment.mapper.ICommentMapper;
import com.community.shy.command.CommentVO;
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

}
