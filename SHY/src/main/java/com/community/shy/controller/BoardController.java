package com.community.shy.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.community.shy.JobBoard.service.IBoardService;
import com.community.shy.command.BoardVO;
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
	
	@GetMapping("/JBoardWrite")
	public void BoardJWrite(int board_type, Model model) {
		System.out.println("글쓰기 페이지로 이동!");
		System.out.println("타입은" + board_type +"입니다.");
		model.addAttribute("board", service.getBoard(board_type));
		model.addAttribute("type", board_type);

		
	}
	
	@GetMapping("/InsertForm")
	public String JBoardRegist(BoardVO vo) {
		System.out.println("글작성 중");
		service.BoardJRegist(vo);
		System.out.println("글 작성 성공!");
		return "redirect:/board/JBoardList?board_type="+ vo.getBoard_type(); 
	}
	
	@GetMapping("/JBoardDetail")
	public void JBoardDetail(int board_no, int board_type , Model model) {
		System.out.println(board_no+"번 게시물 타입은 "+ board_type);
		model.addAttribute("board_no", board_no);
		model.addAttribute("board_type",board_type);
		model.addAttribute("boardDetail", service.JBoardDetail(board_no, board_type));
	}
	
//	삭제기능 (type 99 삭제)
	@GetMapping("/JBoardDelete")
	public String JBoardDelete(int board_no, BoardVO vo, Model model,RedirectAttributes ra) {
		System.out.println(board_no+"번 게시물 삭제");
		service.JBoardDelete(board_no);
		ra.addFlashAttribute("msg","게시물이 정상적으로 삭제되었습니다.");
		return "redirect:/board/JBoardList?board_type="+ vo.getBoard_type();
	}
	
//	게시물 수정
	@GetMapping("/JBoardUpdate")
	public void JBoardUpdate(int board_no, int board_type, Model model,RedirectAttributes ra) {
		System.out.println(board_no+"번 게시물 수정페이지로 이동");
		model.addAttribute("boardUpdate",service.JBoardDetail(board_no, board_type));
		model.addAttribute("board_no",board_no);
		model.addAttribute("board_type",board_type);

	}
	
	@GetMapping("/updateForm")
	public String updateForm(BoardVO vo, int board_type) {
		System.out.println("게시글 수정 요청");
		service.JBoardUpdate(vo);
		return "redirect:/board/JBoardList?board_type="+ board_type;
	}

	
}