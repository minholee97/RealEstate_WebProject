package com.ssafy.happyhouse.dto;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class Wish implements Serializable {
	private int houseId 	;
	private String userId 	;
	public int getHouseId() {
		return houseId;
	}
	
	public Wish(int houseId, String userId) {
		super();
		this.houseId = houseId;
		this.userId = userId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Wish [houseId=" + houseId + ", userId=" + userId + "]";
	}
	
	
}




