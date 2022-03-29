package com.community.shy;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.community.shy.board.JobBoard.service.IBoardService;
import com.community.shy.board.command.BoardVO;
import com.community.shy.board.util.PageCreator;
import com.community.shy.board.util.PageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private IBoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(BoardVO vo, Model model) {
		
		PageVO paging = new PageVO();
		paging.setCountPerPage(4);
		
		// 국내
		ArrayList board_types = new ArrayList();
		
		board_types.add(1);
		board_types.add(2);
		model.addAttribute("type",vo.getBoard_type());
		model.addAttribute("boardList_in", service.getJBoardForMain(board_types));
		
		// 해외
		ArrayList board_types_out = new ArrayList();
		
		board_types_out.add(3);
		board_types_out.add(4);
		board_types_out.add(5);
		board_types_out.add(6);
		board_types_out.add(7);
		model.addAttribute("boardList_out", service.getJBoardForMain(board_types_out));
		
		// 자격증
		ArrayList board_certificate = new ArrayList();
		board_certificate.add(8);
		board_certificate.add(9);
		board_certificate.add(10);
		model.addAttribute("boardList_certificate", service.getJBoardForMain(board_certificate));
		
		
//		베스트는 추후 좋아요 기능 나오면 할거임.
		
		model.addAttribute("board_best", service.getBest());
		
		
		
//		취업정보
		ArrayList job_info = new ArrayList();
		job_info.add(13);
		model.addAttribute("job_info", service.getJBoardForMain(job_info));
		
//		스터디정보
		ArrayList study_info = new ArrayList();
		study_info.add(14);
		model.addAttribute("study_info", service.getJBoardForMain(study_info));
		
//		알쓸신잡(자소서)
		ArrayList resume_info = new ArrayList();
		resume_info.add(15);
		model.addAttribute("resume_info",service.getJBoardForMain(resume_info));
		return "index";
	}
	
}
