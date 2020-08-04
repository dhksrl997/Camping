package com.camp.web.entity;

import java.util.Date;

public class GetSenderName {
	private int id;
	private String name;
	private String content;
	private int reciever;
	private Date sendData;
	
	public GetSenderName() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReciever() {
		return reciever;
	}

	public void setReciever(int reciever) {
		this.reciever = reciever;
	}

	public Date getSendData() {
		return sendData;
	}

	public void setSendData(Date sendData) {
		this.sendData = sendData;
	}

	public GetSenderName(int id, String name, String content, int reciever, Date sendData) {
		super();
		this.id = id;
		this.name = name;
		this.content = content;
		this.reciever = reciever;
		this.sendData = sendData;
	}

	@Override
	public String toString() {
		return "GetSenderName [id=" + id + ", name=" + name + ", content=" + content + ", reciever=" + reciever
				+ ", sendData=" + sendData + "]";
	}


}