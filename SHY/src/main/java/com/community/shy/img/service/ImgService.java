package com.community.shy.img.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.shy.board.command.ImgVO;
import com.community.shy.img.mapper.IImgMapper;

@Service
public class ImgService implements IimgService {
	@Autowired
	private IImgMapper mapper;
	
	@Override
	public int insertImg(ImgVO img) {
		int img_no = mapper.insertImg(img);
		return img_no;
	}

	@Override
	public ImgVO getimg(int img_no) {
		return mapper.getimg(img_no);
	}
	
	@Override
	public ImgVO getImgNo() {
		return mapper.getImgNo();
	}

}
