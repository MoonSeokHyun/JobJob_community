package com.community.shy.note.mapper;

import java.util.List;

import com.community.shy.note.command.NoteVO;

public interface INoteMapper {

	void insertNote(NoteVO note);
	
	List<NoteVO> myRecord(String userId);
}
