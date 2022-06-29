package com.ssafy.happyhouse.dto;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class Commercial implements Serializable {
	private String name;
	private String type;
	private String dongCode;
	private String jibunCode;
	private String jibunJuso;
	private String building;
	private String doromyong;
	private String lat;
	private String lon;
	private int no;
	
	@Override
	public String toString() {
		return "Commercial [name=" + name + ", type=" + type + ", dongCode=" + dongCode + ", jibunCode=" + jibunCode
				+ ", jibunJuso=" + jibunJuso + ", building=" + building + ", doromyong=" + doromyong + ", lat=" + lat
				+ ", lon=" + lon + ", no=" + no + "]";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDongCode() {
		return dongCode;
	}
	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}
	public String getJibunCode() {
		return jibunCode;
	}
	public void setJibunCode(String jibunCode) {
		this.jibunCode = jibunCode;
	}
	public String getJibunJuso() {
		return jibunJuso;
	}
	public void setJibunJuso(String jibunJuso) {
		this.jibunJuso = jibunJuso;
	}
	public String getBuilding() {
		return building;
	}
	public void setBuilding(String building) {
		this.building = building;
	}
	public String getDoromyong() {
		return doromyong;
	}
	public void setDoromyong(String doromyong) {
		this.doromyong = doromyong;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
}




