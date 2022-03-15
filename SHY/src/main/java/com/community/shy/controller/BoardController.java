package com.community.shy.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.shy.JobBoard.service.IBoardService;
import com.community.shy.util.PageCreator;
import com.community.shy.util.PageVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private IBoardService service;
	
	@GetMapping("/JBoardList")
	public String BoardList(int board_type , PageVO paging ,Model model) {
		System.out.println("리스트 페이지 입니다. ");
		
		System.out.println("검색어: " + paging.getKeyword());
		System.out.println("검색 조건: " + paging.getCondition());
		
		PageCreator pc = new PageCreator();
		System.out.println(paging);
		pc.setPaging(paging);
		pc.setArticleTotalCount(service.getJTotal(paging, board_type));
		
		model.addAttribute("boardList", service.getJBoard(board_type, paging));
		model.addAttribute("type", board_type);
		model.addAttribute("pc", pc);
		System.out.println(pc);
		
		return "/board/JBoardList";

		
		
}

}