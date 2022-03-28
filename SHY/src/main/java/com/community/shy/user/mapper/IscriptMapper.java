package com.community.shy.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.shy.board.util.PageVO;
import com.community.shy.user.script.scriptVO;

public interface IscriptMapper {
	// 스크랩하기 ( 추가 )
	public int insertScript(scriptVO vo);
	
	// 스크랩 목록 확인
	public List<scriptVO> getscriptList(int bno_sc,String uses_Id);
	
	//총게시물
	//public int getSTotal(Map<String, Object> data);
	public int getSTotal(int bno_sc);
	// 스크랩 목록 1개 삭제
	public int cnxlScript(@Param("scrap_no") int scrap_no, @Param("scrap_type") int scrap_type);
	
	// 스크랩 게시물 삭제시 리스트에서 삭제
	public int delete(int bno_sc);
	
	List<scriptVO> myRecord(String uses_Id);
	
	// 이미 찜한 게시물인지 조회
}
