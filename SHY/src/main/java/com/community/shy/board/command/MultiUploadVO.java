package com.community.shy.board.command;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class MultiUploadVO {
	private List<FileVO> list;
}
