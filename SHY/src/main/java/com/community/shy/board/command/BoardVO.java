package com.community.shy.board.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardVO {
	private int board_no;
	private String board_title;
	private String board_writer;
	private String board_content;
	private int board_hit;
	private int board_like;
	private int board_hate;
	private String board_img;
	private String board_img_path;
	private int board_type;
	private Timestamp board_regdate;
	private int count;
	private String like_hate;

}
