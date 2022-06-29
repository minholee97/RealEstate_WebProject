package com.ssafy.happyhouse.dto;

import java.io.Serializable;

public class ArticleDto implements Serializable{
	private int articleno ;
	private String title     ;
	private String content   ;
	private String regdate   ;
	private String domain	;
	private String img       ;
	public ArticleDto() {}
	
	public int getArticleno() {
		return articleno;
	}
	public void setArticleno(int articleno) {
		this.articleno = articleno;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "ArticleDto [articleno=" + articleno + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", img=" + img + ", domain=" + domain +"]";
	}
	
	
}
