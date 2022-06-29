package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.Wish;

public interface WishService {
	public Wish searchWish(Wish wish);
	public void registWish(Wish wish);
	public List<Wish> searchAllWish(String userId);
	public void deleteWish(Wish wish);
}



