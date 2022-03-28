package com.community.shy.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.community.shy.user.UserVO;

public class BoardAuthHandler implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response
			, Object handler) throws Exception {
		System.out.println("게시판 인터셉터 발동");
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String writer = request.getParameter("board_writer");
		System.out.println("boardDetail.board_writer : "+writer);
		UserVO vo = (UserVO) session.getAttribute("login");
		System.out.println("vo : "+vo);

		if(vo!=null) {//로긘되었을떄
			if(!writer.equals(vo.getUserId())) {
				System.out.println("글쓴이가 아닌 사람");
				if(!(vo.getUserId()).equals("bbb1234") ) {
					out.print("<script>alert('작성자만이 가능합니다.'); history.back();</script>");
					out.flush();
					return false;
				}else {
					System.out.println("관리자임");
					return true;
				}
			} else {
				System.out.println("글쓴이가 들어옴");
				return true;
			}
		} else {
			System.out.println("로긘x");
			out.print("<script>alert('권한이 없습니다.'); history.back();</script>");
			out.flush();
			return false;
		}

	}
	
	
	
	
	
	
	
	
	
	
}
