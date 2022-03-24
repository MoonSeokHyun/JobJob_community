package com.community.shy.board.command;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class FileVO {
	
	private String name;
	private MultipartFile file;
	
}
