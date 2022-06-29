package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.Notice;

public interface NoticeService {
	public Notice searchNotice(int id);
	public void registNotice(Notice notice);
	public List<Notice> searchAllNotice();
	public void deleteNotice(int id);
	public void updateNotice(Notice notice);
}



