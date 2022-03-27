package com.community.shy.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Flush;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.community.shy.user.UserVO;

public class UserAuthHandler implements HandlerInterceptor{

@Override
public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {

//	System.out.println("login interceptor on!");
//	HttpSession session = request.getSession();
//	UserVO vo = (UserVO) session.getAttribute("login");
//	System.out.println(vo);
//	response.setContentType("text/html; charset=UTF-8");
//	PrintWriter out = response.getWriter();
//	
//	// 0 가입대기 , 1.가입승인, 2. 가입거절
//	if(vo.getUserPass() == 0) {
//		System.out.println("가입 대기중 입니다.");
//	}else if(vo.getUserPass() == 1) {
//		System.out.println("가입 승인 상태 로그인 허용");
//	}else if(vo.getUserPass() == 2) {
//		System.out.println("가입 거절 로그인 불가");
//		session.invalidate();
//	}
//	
}














}
