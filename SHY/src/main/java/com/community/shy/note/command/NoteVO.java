package com.community.shy.note.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoteVO {

	private String note_to;
	private String note_from;
	private int note_no;
	private String note_content;
	
}
