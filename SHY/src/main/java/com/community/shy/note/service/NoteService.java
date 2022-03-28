package com.community.shy.note.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.shy.note.command.NoteVO;
import com.community.shy.note.mapper.INoteMapper;

@Service
public class NoteService implements INoteService {

	@Autowired 
	private INoteMapper mapper;
	@Override
	public void insertNote(NoteVO note) {
		mapper.insertNote(note);

	}
	@Override
	public List<NoteVO> myRecord(String note_to) {
		return mapper.myRecord(note_to);
	}

}
