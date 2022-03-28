package com.community.shy.user.script;



import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class scriptVO {

	private int scrap_no;// 스크랩 게시글 번호
	private int scrap_cnt;// 스크랩하면 카운트 올려서 1, 안하면 0
	private String scrap_Id;// 스크랩 글 작성자
	private String uses_Id;// 스크랩한 사람
	private int scrap_type;// 스크랩한 글 타입
	private Timestamp reg_date;// 스크랩한 시간
	private int bno_sc;//board_type

	/*
	 CREATE TABLE user_scrap (
    scrap_no number(30)not null primary key,
    scrap_count NUMBER(30) not null,
    scrap_Id varchar2(500) not null,
    uses_Id varchar2(500) not null,
    scrap_type number(30) not null,
    reg_date date default sysdate null
	);
	
	create sequence scrap_seq
	increment by 1
	start with 1
	maxvalue 100
	nocycle
	nocache;
	 */
}
