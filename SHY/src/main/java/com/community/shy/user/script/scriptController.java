package com.community.shy.user.script;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.shy.board.command.BoardVO;
import com.community.shy.board.util.PageCreator;
import com.community.shy.board.util.PageVO;
import com.community.shy.user.UserVO;

@Controller
@RequestMapping("/scrap")
public class scriptController {

	@Autowired
	private IscriptService service;

	@ResponseBody
	@PostMapping("/insertScript")
	public String insertScript(String uses_id,@RequestBody scriptVO vo, HttpSession session) {
		System.out.println(vo);
		System.out.println("글번호 : "+vo.getBno_sc());
		if(session.getAttribute("login") == null) {
			return "fail";
		} else {
			System.out.println("로긘함. 스크랩 진행");
			service.insertScript(vo);
			return "suc";
		}
		
	}	

	// 내가 스크랩한 목록
	@GetMapping("/myRecord")
	public void myRecord(String uses_Id, Model model,scriptVO vo ) {
		System.out.println("내가 스크랩한 리스트 불러오기 요청");
		System.out.println("스크랩한 글 불러오기 요청 id: " + uses_Id);

		model.addAttribute("scrapId",uses_Id);
		model.addAttribute("userScrap", service.myRecord(uses_Id));
		System.out.println(service.myRecord(uses_Id));

	}

	//	스크랩한 내용 리스트에서 삭제기능 
	@GetMapping("/cnxlScript") 
	public String cnxlScript(@RequestParam("scrap_no") int scrap_no
			, @RequestParam("scrap_type") int scrap_type
			, @RequestParam("uses_Id") String uses_Id) { 
		System.out.println(scrap_no+"번 게시물 삭제");
		service.cnxlScript(scrap_no,scrap_type);
		return "redirect:/scrap/myRecord?uses_Id=" + uses_Id; 
	}

//	//리스트
//	@GetMapping("/scriptList")
//	public void scriptList(Model model,int bno_sc) {
//		
//		model.addAttribute("scriptList", service.getSTotal(bno_sc));
//		
//	}




}
