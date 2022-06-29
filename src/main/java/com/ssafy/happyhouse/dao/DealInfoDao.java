package com.ssafy.happyhouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.DealInfoDto;
import com.ssafy.happyhouse.util.PageNavigation;
@Mapper
public interface DealInfoDao {
	List<DealInfoDto> listDealInfo(Map<String, Object> map) throws Exception;
	int getTotalCount(Map<String, String> map) throws Exception;
	List<DealInfoDto> searchDealInfo(int no) throws Exception;
}
