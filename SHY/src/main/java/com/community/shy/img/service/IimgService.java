package com.community.shy.img.service;

import java.util.List;

import com.community.shy.board.command.ImgVO;

public interface IimgService {
	// 등록 
		int insertImg(ImgVO img);
		
	// 리스트
		ImgVO getimg(int img_no);

		ImgVO getImgNo();
}
