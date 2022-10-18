package com.myspring.syl.sdy.dto;

import java.util.Date;

public class AskDTO {
	private String board_no;
	private String ask_classify;
	private String title;
	private String content;
	private String ask_secret;
	private String ask_pwd;
	private String id;
	private Date write_date;
	private String parent_no;
	private String level;
	private int hit;
	private int reply_count;
	
	public String getParent_no() {
		return parent_no;
	}
	public void setParent_no(String parent_no) {
		this.parent_no = parent_no;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getAsk_classify() {
		return ask_classify;
	}
	public void setAsk_classify(String ask_classify) {
		this.ask_classify = ask_classify;
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
	public String getAsk_secret() {
		return ask_secret;
	}
	public void setAsk_secret(String ask_secret) {
		this.ask_secret = ask_secret;
	}
	public String getAsk_pwd() {
		return ask_pwd;
	}
	public void setAsk_pwd(String ask_pwd) {
		this.ask_pwd = ask_pwd;
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
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
		
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
}
