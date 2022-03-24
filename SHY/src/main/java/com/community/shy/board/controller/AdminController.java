package com.community.shy.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.shy.board.JobBoard.service.IBoardService;
import com.community.shy.board.JobComment.service.ICommentService;
import com.community.shy.board.command.BoardVO;
import com.community.shy.board.command.CommentVO;
import com.community.shy.user.UserVO;
import com.community.shy.user.service.IUserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@Autowired
	private IBoardService service; 
	
	@Autowired
	private IUserService UserService;
	
	@Autowired ICommentService comService;

	@GetMapping("/admin_main")
	public void main(Model model) {
		System.out.println("메인 페이지로 이동");
		model.addAttribute("boardList", service.getAdminList());
		model.addAttribute("userInfo",UserService.adminUserList());
		
	}
	
	@GetMapping("/admin_boardList")
	public void mainList() {
		System.out.println("어드민메인 게시판 리스트");
	}
	
	// 어드민 회원 관리
	@GetMapping("/admin_userList")
	public void user_list(Model model) {
		//회원 기본정보 페이징(x)
		System.out.println("/admin_userList 요청");
		List<UserVO> list = UserService.adminUserList2();
		model.addAttribute("userInfo",list);
		
		
	};
	
	@ResponseBody
	@PostMapping("/getuserInfo")
	public UserVO getuserInfo(String id) {
		System.out.println("유저 인포 아작스");
		UserVO user = UserService.getInfo(id);
		return user;
	}
	
	@ResponseBody
	@PostMapping("/getUserBoardList")
	public List<BoardVO> getUserBoardList(String board_writer) {
		System.out.println("open! user boardList ajax!");
		System.out.println("조회할 회원 아이디 : " + board_writer);
		List<BoardVO> list = service.getUserBoardList(board_writer);
		
		return list;
	}
	@ResponseBody
	@PostMapping("/getCommentList")
	public List<CommentVO> getCommentList(String com_writer){
		System.out.println("open! user Comment List ajax!");
		System.out.println("조회할 회원 아이디 : " + com_writer);
		List<CommentVO> list = comService.getComList(com_writer);
		System.out.println(list);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/successId")
	public void successId(String id) {
		System.out.println(id);
		System.out.println("open! user sign success Id ajax!");
		UserService.successId(id);
	}
	
	@ResponseBody
	@PostMapping("/failId")
	public void failId(String id) {
		System.out.println(id);
		System.out.println("open! user sign failId Id ajax!");
		UserService.failed(id);
	}

	
}