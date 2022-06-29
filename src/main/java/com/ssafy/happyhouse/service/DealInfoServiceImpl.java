package com.ssafy.happyhouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.dao.DealInfoDao;
import com.ssafy.happyhouse.dto.DealInfoDto;
import com.ssafy.happyhouse.util.PageNavigation;
@Service
public class DealInfoServiceImpl implements DealInfoService{
	@Autowired
	private DealInfoDao dealInfoDao;
	
	@Override
	@Transactional
	public List<DealInfoDto> listDealInfo(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		String type = map.get("dealtype");
		String dongcode = map.get("dongcode");
		String pg = map.get("pg");
		if (type.equals("0")) type = "1";
		if (type.equals("2")) return null;
		if(pg == null || pg.length() == 0)
			pg="1";
		int currentPage = Integer.parseInt(pg);
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		param.put("dongcode", dongcode);
		return dealInfoDao.listDealInfo(param);
	}
	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		
		int naviSize = 10;
		String pg = map.get("pg");
		if (pg == null || pg.length()==0) pg="1";
		int currentPage = Integer.parseInt(pg);
		int sizePerPage = Integer.parseInt(map.get("spp"));
		
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = dealInfoDao.getTotalCount(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		
		return pageNavigation;
	}
	
	@Override
	public List<DealInfoDto> searchDealInfo(int no) throws Exception {
		return dealInfoDao.searchDealInfo(no);
	}
	
	
}
