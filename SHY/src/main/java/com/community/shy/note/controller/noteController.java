package com.community.shy.note.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.shy.note.command.NoteVO;
import com.community.shy.note.service.INoteService;
import com.community.shy.user.UserVO;

@Controller
@RequestMapping("/note")
public class noteController {
	@Autowired 
	private INoteService service;

	@ResponseBody
	@PostMapping("/insertNote")
	public String insertNote(@RequestBody NoteVO note, HttpSession session) {
		System.out.println("쪽지 보내기 요청");
		
		String note_from =((UserVO)session.getAttribute("login")).getUserId();
		System.out.println("보낸이: " + note_from);
		note.setNote_from(note_from);
		System.out.println("들어온 객체: " + note);
		
		service.insertNote(note);
		System.out.println("쪽지 보내기 완료");
		
		return "쪽지 보내기 성공";
	}
	
	//받은 쪽지 불러오기
	@GetMapping("/myRecord")
	public void myRecord(String note_to, Model model) {
		System.out.println("받은 쪽지 불러오기");
		System.out.println("userId:" + note_to);
		
		model.addAttribute("userId",note_to);
		model.addAttribute("note", service.myRecord(note_to));
		System.out.println(service.myRecord(note_to));
	}
	
}
