package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.Notice;

@Mapper
public interface NoticeDao {
	public Notice searchNotice(int id);
	public void registNotice(Notice notice);
	public List<Notice> searchAllNotice();
	public void deleteNotice(int id);
	public void updateNotice(Notice notice);
}
