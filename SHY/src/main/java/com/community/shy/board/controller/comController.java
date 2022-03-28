package com.community.shy.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.shy.board.JobComment.service.ICommentService;
import com.community.shy.board.command.CommentVO;

@Controller
@RequestMapping("/comment")
public class comController {

	@Autowired
	private ICommentService service;
	
	
	//내가 쓴 댓글 불러오기
		@GetMapping("/myRecord")
		public void myRecord(String com_writer, Model model ) {
			System.out.println("내가 쓴 댓글 불러오기 요청");
			System.out.println("글 불러오기 요청 id: " + com_writer);
			
//			List<BoardVO> boardList = new ArrayList<>();
//			boardList = service.myRecord(writer);
//			System.out.println("가져온 글: " + boardList);
			model.addAttribute("board_writer",com_writer);
			model.addAttribute("userCom", service.myRecord(com_writer));
			System.out.println(service.myRecord(com_writer));
			
			
		}
		
	//댓글 삭제
		@ResponseBody
		@PostMapping("/commentDelete")
		public String commentDelete(@RequestBody CommentVO vo) {
			System.out.println("댓글 삭제 요청");
			service.commentDelete(vo);
			System.out.println("service 실행"+ vo);
			return "DeleteSuccess";
		}
		
		//댓글 삭제
//				
//				@GetMapping("/commentDelete")
//				public String commentDelete(CommentVO vo) {
//					System.out.println("댓글 삭제 요청");
//					service.commentDelete(vo);
//					System.out.println("service 실행"+ vo);
//					
//					return "redirect:/board/JBoardDetail";
//				}
//		
}












