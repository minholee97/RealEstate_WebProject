package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.QnaDao;
import com.ssafy.happyhouse.dto.PageBean;
import com.ssafy.happyhouse.dto.Qna;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao dao;
	
	@Override
	public Qna searchQna(int id) {
		return dao.searchQna(id);
	}
	
	@Override
	public void registQna(Qna qna) {
		dao.registQna(qna);
	}

	@Override
	public List<Qna> searchAllQna(PageBean bean) {
		return dao.searchAllQna(bean);
	}
	
	@Override
	public List<Qna> searchUserQna(String id) {
		return dao.searchUserQna(id);
	}

	@Override
	public void deleteQna(int no) {
		dao.deleteQna(no);
	}

	@Override
	public void updateQna(Qna qna) {
		dao.updateQna(qna);
	}

	@Override
	public void answerQna(Qna qna) {
		dao.answerQna(qna);
	}
	
	@Override
	public void updateHit(int no) {
		dao.updateHit(no);
	}
}
