package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.CommercialDao;
import com.ssafy.happyhouse.dto.Commercial;

@Service
public class CommercialServiceImpl implements CommercialService {

	@Autowired
	private CommercialDao dao;
	
	@Override
	public List<Commercial> searchAllCommercial(int dongCode) {
		return dao.searchAllCommercial(dongCode);
	}

}
