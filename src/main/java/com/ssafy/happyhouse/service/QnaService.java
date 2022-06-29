package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.PageBean;
import com.ssafy.happyhouse.dto.Qna;

public interface QnaService {
	public Qna searchQna(int id);
	public void registQna(Qna qna);
	public List<Qna> searchAllQna(PageBean bean);
	public List<Qna> searchUserQna(String id);
	public void deleteQna(int no);
	public void updateQna(Qna qna);
	public void answerQna(Qna qna);
	public void updateHit(int no);
}



