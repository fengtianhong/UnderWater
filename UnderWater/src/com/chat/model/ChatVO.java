package com.chat.model;

import java.sql.Timestamp;

public class ChatVO implements java.io.Serializable{
	private Integer chatSN;
	private Integer fromAccount;
	private Integer toAccount;
	private String content;
	private Timestamp dateTime;
	public Integer getChatSN() {
		return chatSN;
	}
	public void setChatSN(Integer chatSN) {
		this.chatSN = chatSN;
	}
	public Integer getFromAccount() {
		return fromAccount;
	}
	public void setFromAccount(Integer fromAccount) {
		this.fromAccount = fromAccount;
	}
	public Integer getToAccount() {
		return toAccount;
	}
	public void setToAccount(Integer toAccount) {
		this.toAccount = toAccount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDateTime() {
		return dateTime;
	}
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

}
