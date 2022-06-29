package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.Wish;

@Mapper
public interface WishDao {
	public Wish searchWish(Wish wish);
	public void registWish(Wish wish);
	public List<Wish> searchAllWish(String userId);
	public void deleteWish(Wish wish);
}
