package com.camp.web.entity;

import java.util.Date;

public class Letter {
	private int id;
	private int send;
	private int recieve;
	private String content;
	private Date sendData;
	private int isRead;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSend() {
		return send;
	}

	public void setSend(int send) {
		this.send = send;
	}

	public int getRecieve() {
		return recieve;
	}

	public void setRecieve(int recieve) {
		this.recieve = recieve;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSendData() {
		return sendData;
	}

	public void setSendData(Date sendData) {
		this.sendData = sendData;
	}

	public int getIsRead() {
		return isRead;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	public Letter() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Letter [id=" + id + ", send=" + send + ", recieve=" + recieve + ", content=" + content + ", sendData="
				+ sendData + ", isRead=" + isRead + "]";
	}

	public Letter(int id, int send, int recieve, String content, Date sendData, int isRead) {
		super();
		this.id = id;
		this.send = send;
		this.recieve = recieve;
		this.content = content;
		this.sendData = sendData;
		this.isRead = isRead;
	}

}