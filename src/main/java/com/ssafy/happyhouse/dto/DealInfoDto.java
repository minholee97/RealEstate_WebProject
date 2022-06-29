package com.ssafy.happyhouse.dto;

public class DealInfoDto {
	int aptCode;
	String aptName;
	String dealAmount;
	String dealYear;
	String dealMonth;
	String dongCode;
	String lat;
	String lng;
	String dealDay;
	String floor;
	String dongName;
	String img;
	String jibun;
	String buildYear;
	int no;
	
	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public DealInfoDto(int aptCode, String aptName, String dealAmount, String dealYear, String dealMonth,
			String dongCode, String lat, String lng, String dealDay, String floor, String dongName, 
			String img, String jibun, String buildYear, int no) {
		super();
		this.aptCode = aptCode;
		this.aptName = aptName;
		this.dealAmount = dealAmount;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dongCode = dongCode;
		this.lat = lat;
		this.lng = lng;
		this.dealDay = dealDay;
		this.floor = floor;
		this.dongName = dongName;
		this.img = img;
		this.jibun = jibun;
		this.buildYear = buildYear;
		this.no = no;
	}



	public String getBuildYear() {
		return buildYear;
	}



	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}



	public String getJibun() {
		return jibun;
	}



	public void setJibun(String jibun) {
		this.jibun = jibun;
	}



	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}



	public int getAptCode() {
		return aptCode;
	}



	public void setAptCode(int aptCode) {
		this.aptCode = aptCode;
	}



	public String getAptName() {
		return aptName;
	}



	public void setAptName(String aptName) {
		this.aptName = aptName;
	}



	public String getDealAmount() {
		return dealAmount;
	}



	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}



	public String getDealYear() {
		return dealYear;
	}



	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}



	public String getFloor() {
		return floor;
	}



	public void setFloor(String floor) {
		this.floor = floor;
	}



	public String getDongName() {
		return dongName;
	}



	public void setDongName(String dongName) {
		this.dongName = dongName;
	}



	public String getDealMonth() {
		return dealMonth;
	}



	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}



	public String getDealDay() {
		return dealDay;
	}



	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}



	public String getDongCode() {
		return dongCode;
	}



	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}



	public String getLat() {
		return lat;
	}



	public void setLat(String lat) {
		this.lat = lat;
	}



	public String getLng() {
		return lng;
	}



	public void setLng(String lng) {
		this.lng = lng;
	}



	@Override
	public String toString() {
		return "DealInfoDto [aptCode=" + aptCode + ", aptName=" + aptName + ", dealAmount=" + dealAmount + ", dealYear="
				+ dealYear + ", dealMonth=" + dealMonth + ", dongCode=" + dongCode + ", lat=" + lat + ", lng=" + lng
				+ ", dealDay=" + dealDay + ", floor=" + floor + ", dongName=" + dongName + ", img=" + img + "]";
	}




}
