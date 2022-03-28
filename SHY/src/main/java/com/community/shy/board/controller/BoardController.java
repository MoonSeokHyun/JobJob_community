package com.community.shy.board.controller;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.community.shy.board.JobBoard.service.IBoardService;
import com.community.shy.board.command.BoardVO;
import com.community.shy.board.util.PageCreator;
import com.community.shy.board.util.PageVO;
import com.community.shy.user.UserVO;

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
	
//	@GetMapping("/InsertForm")
//	public String JBoardRegist(BoardVO vo) {
//		System.out.println("글작성 중");
//		service.BoardJRegist(vo);
//		System.out.println("글 작성 성공!");
//		return "redirect:/board/JBoardList?board_type="+ vo.getBoard_type(); 
//	}
	
	/*
	 * @GetMapping("/JBoardDetail") public void JBoardDetail(int board_no, int
	 * board_type ,BoardVO vo, Model model) {
	 * System.out.println(board_no+"번 게시물 타입은 "+ board_type);
	 * model.addAttribute("board_no", board_no);
	 * model.addAttribute("board_type",board_type);
	 * model.addAttribute("boardDetail", service.JBoardDetail(board_no,
	 * board_type)); }
	 */
	
	
	@GetMapping("/JBoardDetail")
	public void JBoardDetail(@RequestParam("board_no")int board_no, int board_type , Model model, HttpSession session) {
		System.out.println(board_no+"번 게시물 타입은 "+ board_type);
		String user_id = ((UserVO)session.getAttribute("login")).getUserId();
		System.out.println(user_id);
		service.updateHit(board_no);
		model.addAttribute("board_no", board_no);
		model.addAttribute("board_type",board_type);
		model.addAttribute("boardDetail", service.JBoardDetail(board_no, board_type, user_id));
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
	public void JBoardUpdate(int board_no, int board_type, Model model,RedirectAttributes ra, HttpSession session) {
		System.out.println(board_no+"번 게시물 수정페이지로 이동");
		String user_id = ((UserVO)session.getAttribute("login")).getUserId();
		model.addAttribute("boardUpdate",service.JBoardDetail(board_no, board_type, user_id));
		model.addAttribute("board_no",board_no);
		model.addAttribute("board_type",board_type);

	}
	
	@GetMapping("/updateForm")
	public String updateForm(BoardVO vo, int board_type) {
		System.out.println("게시글 수정 요청");
		service.JBoardUpdate(vo);
		return "redirect:/board/JBoardList?board_type="+ board_type;
	}
	
	
	@PostMapping("/InsertForm")
	public String BoardJRegist(BoardVO vo,
			@RequestParam("board_content") String content
			,@RequestParam("board_title") String title
			,@RequestParam("board_writer") String writer
			) {

		service.BoardJRegist(vo);

		return "redirect:/board/JBoardList?board_type="+ vo.getBoard_type(); 
	}
	
	//내가 쓴 글 불러오기
	@GetMapping("/myRecord")
	public void myRecord(String board_writer, Model model ) {
		System.out.println("내가 쓴글 불러오기 요청");
		System.out.println("글 불러오기 요청 id: " + board_writer);
		
//		List<BoardVO> boardList = new ArrayList<>();
//		boardList = service.myRecord(writer);
//		System.out.println("가져온 글: " + boardList);
		model.addAttribute("board_writer",board_writer);
		model.addAttribute("userBoard", service.myRecord(board_writer));
		System.out.println(service.myRecord(board_writer));
	}
	
	
	//좋아요,싫어요
		@ResponseBody
		@PostMapping("/likeHateCnt")
		public String likeHateCnt(HttpSession session, @RequestParam Map<String, Object> param){
			String like_hate = "";
			
			try {
				String org_like_hate = (String) param.get("org_like_hate");
				String ck_like_hate = (String) param.get("ck_like_hate");

				if(org_like_hate.equals(ck_like_hate)) { 
					like_hate ="no_chk"; 
				} else { 
					like_hate = ck_like_hate; 
				}
				param.put("user_id", ((UserVO)session.getAttribute("login")).getUserId());
				param.put("like_hate", like_hate);
				System.out.println("param"+param);
				service.insertBoardCnt(param);
				
			}catch (Exception e) {
				System.out.println(e.getMessage());
				like_hate = "error";
			}

			 
			return like_hate;
		}
	
	

	
}