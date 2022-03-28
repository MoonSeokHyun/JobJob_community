package com.community.shy.user.script;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.shy.board.util.PageVO;
import com.community.shy.user.mapper.IscriptMapper;

@Service
public class scriptService implements IscriptService {

	@Autowired 
	private IscriptMapper mapper;
	
	// 스크랩추가
	@Override
	public int insertScript(scriptVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertScript(vo);
	}

	// 스크랩리스트에 뜨기
	@Override
	public List<scriptVO> getscriptList(int bno_sc,String uses_Id) {
		// TODO Auto-generated method stub
		return mapper.getscriptList(bno_sc,uses_Id);
	}
	
//	총게시물수 
	public int getSTotal( int bno_sc) {
		return mapper.getSTotal(bno_sc);
	}
	// 스크랩 취소
	
	//	스크랩 게시물 삭제시 리스트에서 삭제
	@Override
	public int delete(int bno_sc) {
		// TODO Auto-generated method stub
		return mapper.delete(bno_sc);
	}

	@Override
	public List<scriptVO> myRecord(String uses_Id) {
		// TODO Auto-generated method stub
		return mapper.myRecord(uses_Id);
	}

	@Override
	public int cnxlScript(int scrap_no, int scrap_type) {
		// TODO Auto-generated method stub
		return mapper.cnxlScript(scrap_no,scrap_type);
	}

	

}
