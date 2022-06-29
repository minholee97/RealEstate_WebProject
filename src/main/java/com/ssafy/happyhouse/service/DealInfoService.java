package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.dto.DealInfoDto;
import com.ssafy.happyhouse.util.PageNavigation;

public interface DealInfoService {
	List<DealInfoDto> listDealInfo(Map<String, String> map) throws Exception;
	PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	List<DealInfoDto> searchDealInfo(int no) throws Exception;
}
