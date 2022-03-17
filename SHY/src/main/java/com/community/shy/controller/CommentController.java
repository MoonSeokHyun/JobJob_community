package com.community.shy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.shy.JobBoard.service.IBoardService;
import com.community.shy.JobComment.service.ICommentService;
import com.community.shy.command.CommentVO;

@RestController
@RequestMapping("/Comment")
public class CommentController {
	
	@Autowired
	private ICommentService service;
	
	@PostMapping("/InsertComment")
	public String InsertComment(@RequestBody CommentVO vo) {
		System.out.println("댓글 등록 통신 성공");
		service.CommentRegist(vo);
		return "InsertSuccess";
	}
}
