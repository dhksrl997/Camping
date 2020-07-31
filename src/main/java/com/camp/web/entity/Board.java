package com.camp.web.entity;

import java.util.Date;

public class Board {

	private int id;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int hit;
	private int like;
	private String del;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(int id, String title, String content, String writer, Date regDate, int hit, int like, String del) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regDate = regDate;
		this.hit = hit;
		this.like = like;
		this.del = del;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	
	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regDate="
				+ regDate + ", hit=" + hit + ", like=" + like + ", del=" + del + "]";
	}
	
}
