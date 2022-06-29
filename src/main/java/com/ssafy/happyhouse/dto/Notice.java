package com.ssafy.happyhouse.dto;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class Notice implements Serializable {
	private int id;
	private String title 	;
	private String author  	;
	private String written_date;
	private String description;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getWritten_date() {
		return written_date;
	}
	public void setWritten_date(String written_date) {
		this.written_date = written_date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", author=" + author + ", written_date=" + written_date
				+ ", description=" + description + "]";
	}
	public Notice(int id, String title, String author, String written_date, String description) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.written_date = written_date;
		this.description = description;
	}

}




