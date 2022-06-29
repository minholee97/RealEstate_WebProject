package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.Commercial;

@Mapper
public interface CommercialDao {
	public List<Commercial> searchAllCommercial(int dongCode);
}
