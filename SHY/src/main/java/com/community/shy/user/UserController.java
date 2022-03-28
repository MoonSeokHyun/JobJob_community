package com.community.shy.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.community.shy.board.command.BoardVO;
import com.community.shy.user.mail.MailService;
import com.community.shy.user.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired 
	private IUserService service;
	@Autowired
	private MailService mailService;
	
	//메인페이지로 이동
	
	
	//회원 가입 페이지로 이동
	@GetMapping("/join")
	public void join() {
		System.out.println("회원가입 페이지로 이동");
	}
	
	//아이디 중복 확인
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String id) {
		System.out.println("아이디 중복 확인 요청");
		int result = service.idCheck(id);
		
		if(result == 1) {
			return "duplicated";
		}else {
			return "okId";
		}
	}
	
	//이메일 인증번호 전송
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증번호 요청");
		System.out.println("입력된 이메일:" + email);
		
		return mailService.sendEmail(email);
	}
	
	//비밀번호 변경 이메일 인증번호 전송
	@GetMapping("/pwMailCheck")
	@ResponseBody
	public String pwMailCheck(String email) {
		System.out.println("비밀번호 변경 이메일 인증번호 요청");
		System.out.println("입력된 이메일: " + email);
		
		return mailService.sendPwEmail(email);
	}
	
	//회원가입 요청
	@PostMapping("/join")
	public String join(UserVO vo, RedirectAttributes ra) {
		System.out.println("회원가입 요청이 들어옴");
		System.out.println("들어온 param: " + vo);
		service.join(vo);
		ra.addFlashAttribute("joinMsg", "joinSuccess");
		
		return "redirect:/";
	}
	@GetMapping("/userLogin")
	public void userLogin() {
		System.out.println("로긘모로 이동");
	}
	
	//로그인
		@ResponseBody
		@PostMapping("/userLogin")
		public String userLogin(@RequestBody UserVO vo, HttpSession session) {
			System.out.println("userLogin post");
			System.out.println("갖고온 param: " + vo.getUserId());
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			System.out.println(encoder.toString());
			UserVO dbData = service.getInfo(vo.getUserId());
			// 2022 03 27 석현 추가 
			if(dbData.getUserPass() == 0) {
				return "wait";
			}else if(dbData.getUserPass() == 2){
				return "refusal";
			}else if(dbData.getUserPass() == 3){
				return "drop";
			}
			
			if(dbData != null) {
				if(encoder.matches(vo.getUserPw(), dbData.getUserPw())) {
					//로그인 성공 회원을 대상으로 세션 정보를 생성
					session.setAttribute("login", dbData);
					return "loginSuccess";
					
				} else {
					return "pwFail";
				}

			} else {
				return "idFail";
			}
		}//로그인
		
		
	//비밀번호 찾기
	@ResponseBody
	@PostMapping("/findPw")
	public String findPw(@RequestBody UserVO vo) {
		System.out.println("비밀번호 찾기 요청 들어옴");
		System.out.println("들어온 param: " + vo.getUserId() + vo.getUserEmail());
		
		UserVO user = service.getInfo(vo.getUserId());
		System.out.println("찾은 이메일:" + user.getUserEmail());
		
		if(user != null) {
			if(vo.getUserEmail().equals(user.getUserEmail())) {
				return "find";
			}else {
				return "EmailFail";
			}
		}
		else {
			return "idFail";
		}
	}
	
	//비밀번호 수정
	@PostMapping("/modifyPw")
	public String modifyPw(UserVO vo) {
		System.out.println("비밀번호 수정 요청이 들어옴");
		System.out.println("들어온 값:" + "id=" + vo.getUserId() + "pw=" + vo.getUserPw());
		service.modifyPw(vo.getUserId(), vo.getUserPw());
		
		return "redirect:/";
	}
	
	//로그아웃처리
		@GetMapping("/logout")
		public ModelAndView logout(HttpSession session, RedirectAttributes ra,
					HttpServletRequest requeset, HttpServletResponse response) {
			System.out.println("logout controller");
			
			session.removeAttribute("login");
			
			Cookie loginCookie = WebUtils.getCookie(requeset, "loginCookie");
			
			if(loginCookie != null) {
				System.out.println("쿠키없다");
				loginCookie.setMaxAge(0);
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
				
			}
			return new ModelAndView("redirect:/");
		}
		
		//마이페이지로 이동
		@GetMapping("/mypage")
		public void userMyPage(HttpSession session, Model model) {
			System.out.println("mypage");
			String id = ((UserVO)session.getAttribute("login")).getUserId();
			System.out.println(id);
			UserVO userInfo = service.getInfo(id);
			System.out.println(userInfo);
			model.addAttribute("userInfo", userInfo);
		}
		
		//수정로직
		@PostMapping("/updateUser")
		public String updateUser(UserVO vo, RedirectAttributes ra) {
			try {
				System.out.println("update");
				System.out.println(vo);
				service.updateUser(vo);
				ra.addFlashAttribute("msg","수정이 완료되었습니다.");			
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return "redirect:/user/mypage";
		}

		//삭제로직
		@ResponseBody
		@PostMapping("/deleteUser")
		public String deleteUser(@RequestBody UserVO vo, HttpSession session) {
			try {
				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				
				if(encoder.matches(vo.getUserPw(),((UserVO)session.getAttribute("login")).getUserPw())) {
					service.deleteUser(vo);
					return "true";
				}else {
					return "false";	
				}	
			}
			catch (Exception e) {
				return e.getMessage();
			}
			
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}






