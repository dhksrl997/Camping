package com.camp.web.entity;

import java.util.Date;

public class Comment {
	private int id;
	private int campId;
	private String writer;
	private String content;
	private Date regDate;
	private String pub;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int campId, String writer, String content, String pub) {
		super();
		this.campId = campId;
		this.writer = writer;
		this.content = content;
		this.pub = pub;
	}

	public Comment(int id, int campId, String writer, String content, Date regDate, String pub) {
		super();
		this.id = id;
		this.campId = campId;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.pub = pub;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCampId() {
		return campId;
	}

	public void setCampId(int campId) {
		this.campId = campId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getPub() {
		return pub;
	}

	public void setPub(String pub) {
		this.pub = pub;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", campId=" + campId + ", writer=" + writer + ", content=" + content + ", regDate="
				+ regDate + ", pub=" + pub + "]";
	}
	
	
		
}
