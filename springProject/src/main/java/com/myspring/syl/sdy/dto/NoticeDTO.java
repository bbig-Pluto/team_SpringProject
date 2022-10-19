package com.myspring.syl.sdy.dto;

import java.util.Date;

public class NoticeDTO {
	

	private String board_no;
	private String title;
	private String content;
	private String id;
	private Date write_date;
	private String n_set;
	private int hit;

	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getN_set() {
		return n_set;
	}
	public void setN_set(String n_set) {
		this.n_set = n_set;
	}

}
