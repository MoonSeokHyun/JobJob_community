package com.community.shy.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	
	//postHandle은 컨트롤러를 나갈 때 공통 처리해야 할 내용을 작성
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("게시판 인터셉터의 postHandle 호출!");
		System.out.println("모델 객체의 내부 : " + modelAndView.getModel());
		
		Object data = modelAndView.getModel().get("article");
		System.out.println("article이라는 이름의 데이터 : " + data);
		
	}
	
	
	
	
	
	
	
}
