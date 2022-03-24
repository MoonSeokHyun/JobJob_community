package com.community.shy.img.mapper;

import java.util.List;

import com.community.shy.board.command.ImgVO;

public interface IImgMapper {
// 등록 
	int insertImg(ImgVO img);
	
	ImgVO getimg();
	
// 리스트
	ImgVO getimg(int img_no);

	ImgVO getImgNo();
}
