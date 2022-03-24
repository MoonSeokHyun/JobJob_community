package com.community.shy.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.community.shy.board.JobBoard.service.IBoardService;
import com.community.shy.board.JobComment.service.ICommentService;
import com.community.shy.board.command.CommentVO;

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

	@GetMapping("/CommentList/{com_bno}")
	public Map<String, Object> getList(@PathVariable int com_bno, Model model) {
		System.out.println("댓글 목록 컨트롤러 동작");
		List<CommentVO> list = service.getList(com_bno);
		int total = service.getTotal(com_bno);
		
		ModelAndView view = new ModelAndView();
		System.out.println("댓글 갯수 " + service.getTotal(com_bno));
		view.setViewName("/board/JBoardList");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);

		return map;
	}
}
