package com.team.groupware.domain;

import java.util.Date;

public class GojiReplyVO {
	private int rno; // 댓글번호
	private int bno; // 게시판번호
	private String recontent; // 댓글내용
	private String replyer; // 댓글 작성자
	private Date replydate; // 댓글 작성날짜
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getReplydate() {
		return replydate;
	}
	public void setReplydate(Date replydate) {
		this.replydate = replydate;
	}
}
