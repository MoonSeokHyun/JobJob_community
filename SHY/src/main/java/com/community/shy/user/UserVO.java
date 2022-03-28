package com.community.shy.user;

import java.sql.Timestamp;
import java.util.List;

import com.community.shy.board.command.BoardVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {

	private int userNo;
	private String userId;
	private String userName;
	private String userPw;
	private String userPh;
	private int userAdr1;
	private String userAdr2;
	private String userAdr3;
	private String userAdr4;
	private int userStatus;
	private String userEmail;
	private String userCompany;
	private int adminType;
	private int userPass;
	private Timestamp userDate;
	private int boardCnt;
	private int commentCnt;
	
	
	private List<BoardVO> boardList;
	
}
