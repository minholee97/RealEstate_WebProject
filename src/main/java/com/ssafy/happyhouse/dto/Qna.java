package com.ssafy.happyhouse.dto;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class Qna implements Serializable {
	private int no;
	private String title;
	private String authorId;
	private String regdate;
	private int hit;
	private String password;
	private String writerId;
	private String answer;
	private String content;

	public Qna() {}
	
	public Qna(int no, String title, String authorId, String regdate, int hit, String password, String writerId,
			String answer, String content) {
		super();
		this.no = no;
		this.title = title;
		this.authorId = authorId;
		this.regdate = regdate;
		this.hit = hit;
		this.password = password;
		this.writerId = writerId;
		this.answer = answer;
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "Qna [no=" + no + ", title=" + title + ", authorId=" + authorId + ", regdate=" + regdate + ", hit=" + hit
				+ ", password=" + password + ", writerId=" + writerId + ", answer=" + answer + ", content=" + content
				+ "]";
	}
}




