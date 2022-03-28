package com.community.shy.note.service;

import java.util.List;

import com.community.shy.note.command.NoteVO;

public interface INoteService {

	//쪽지 보내기
	void insertNote(NoteVO note);
	//받은 쪽지 불러오기
	List<NoteVO> myRecord(String note_to);
}
