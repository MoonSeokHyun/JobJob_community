package com.community.shy.user.service;

import java.util.List;

import com.community.shy.board.command.BoardVO;
import com.community.shy.user.UserVO;

public interface IUserService {

	//아이디 중복 확인
	int idCheck(String id);
	
	//회원가입
	void join(UserVO vo);
	
	//로그인
	UserVO login(String id, String pw);
	
	//회원 정보 얻기
	UserVO getInfo(String id);
	
	//비밀번호 수정
	void modifyPw(String id, String pw);
	
	//회원 정보 수정
	void updateUser(UserVO vo);
	
	//회원 삭제
	void deleteUser(UserVO vo);
	
	//회원 활동 불러오기
	UserVO myActivity(String id);
	
	//어드민용 유저리스트 
		List<UserVO> adminUserList();
		
		//회원관리용 리스트 
		List<UserVO> adminUserList2();
		
		// 가입승인
		void successId(String id);
		
		// 가입 거절
		void failed(String id);
		// 유저 드롭
		void dropUser(String id);
}
