package com.kim12152143.model;

import java.util.Date;

public class User {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private Date dob;
	private int questionidx;
	private String answer;
	private Date dor;
	private String email;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public int getQuestionidx() {
		return questionidx;
	}
	public void setQuestionidx(int questionidx) {
		this.questionidx = questionidx;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getDor() {
		return dor;
	}
	public void setDor(Date dor) {
		this.dor = dor;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", dob=" + dob + ", questionidx=" + questionidx + ", answer=" + answer + ", dor=" + dor
				+ ", email=" + email + "]";
	}
}

