package com.community.shy.user.script;

import java.util.List;

import com.community.shy.board.util.PageVO;

public interface IscriptService {
	
	// 스크랩하기(추가)
	public int insertScript(scriptVO vo);
	
	// 스크랩 리스트에 뜨기
	public List<scriptVO> getscriptList(int bno_sc,String uses_Id);
	// 총 스크랩 리스트
	public int getSTotal( int bno_sc);
	List<scriptVO> myRecord(String uses_Id);
	
	//스크랩 취소 리스트에서 삭제
	public int cnxlScript(int scrap_no , int scrap_type );
	
	// 스크랩 게시물 삭제시 리스트에서 삭제
	 public int delete(int bno_sc);

	// 이미 찜한 게시물인지 조회
}
