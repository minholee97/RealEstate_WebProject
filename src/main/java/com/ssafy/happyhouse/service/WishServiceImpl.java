package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.WishDao;
import com.ssafy.happyhouse.dto.Wish;

@Service
public class WishServiceImpl implements WishService {

	@Autowired
	private WishDao dao;

	@Override
	public Wish searchWish(Wish wish) {
		return dao.searchWish(wish);
	}

	@Override
	public void registWish(Wish wish) {
		dao.registWish(wish);
	}

	@Override
	public List<Wish> searchAllWish(String userId) {
		return dao.searchAllWish(userId);
	}

	@Override
	public void deleteWish(Wish wish) {
		dao.deleteWish(wish);
	}
}
