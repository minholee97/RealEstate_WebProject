package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.NoticeDao;
import com.ssafy.happyhouse.dto.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;
	
	@Override
	public Notice searchNotice(int id) {
		return dao.searchNotice(id);
	}
	
	@Override
	public void registNotice(Notice notice) {
		dao.registNotice(notice);
	}

	@Override
	public List<Notice> searchAllNotice() {
		return dao.searchAllNotice();
	}

	@Override
	public void deleteNotice(int id) {
		dao.deleteNotice(id);
	}

	@Override
	public void updateNotice(Notice notice) {
		dao.updateNotice(notice);
	}

}
