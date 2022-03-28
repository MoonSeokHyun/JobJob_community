package com.community.shy.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.community.shy.board.command.BoardVO;
import com.community.shy.user.UserVO;
import com.community.shy.user.mapper.IUserMapper;

@Service
public class UserService implements IUserService {

	@Autowired 
	private IUserMapper mapper;
	
	@Override
	public int idCheck(String id) {
		
		return mapper.idCheck(id);
	}

	@Override
	public void join(UserVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호화 전 비번:" + vo.getUserPw());
		
		//암호화 한후에 다시 저장
		String codePw = encoder.encode(vo.getUserPw());
		System.out.println("암호화 후 비번: " + codePw);
		vo.setUserPw(codePw);
		mapper.join(vo);
	}

	@Override
	public UserVO login(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO getInfo(String id) {
		return mapper.getInfo(id);
	}

	@Override
	public void updateUser(UserVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호화 전 비번:" + vo.getUserPw());
		
		//암호화 한후에 다시 저장
		String codePw = encoder.encode(vo.getUserPw());
		System.out.println("암호화 후 비번: " + codePw);
		vo.setUserPw(codePw);
		mapper.updateUser(vo);

	}

	@Override
	public void deleteUser(UserVO vo) {
		mapper.deleteUser(vo);		
	}

	

	@Override
	public void modifyPw(String id, String pw) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호화 전 비번:" + pw);
		
		//암호화 한후에 다시 저장
		String codePw = encoder.encode(pw);
		System.out.println("암호화 후 비번: " + codePw);
		//UserVO vo = new UserVO();
		
		//vo.setUserPw(codePw);
		pw = codePw;
		mapper.modifyPw(id, pw);
	}

	@Override
	public UserVO myActivity(String id) {
		return mapper.myActivity(id);
	}

	
	@Override
	public List<UserVO> adminUserList() {
		return mapper.adminUserList();
}
	@Override
	public List<UserVO> adminUserList2() {
		return mapper.adminUserList2();
	}
	
	@Override
	public void successId(String id) {
		mapper.successId(id);
	}

	@Override
	public void failed(String id) {
		mapper.failed(id);
	}
	@Override
	public void dropUser(String id) {
		mapper.dropUser(id);
		
	}
}
