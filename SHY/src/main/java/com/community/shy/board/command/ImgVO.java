package com.community.shy.board.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ImgVO {
	
	private int img_no;
	private String path; 
	private Timestamp reg_date;
}
