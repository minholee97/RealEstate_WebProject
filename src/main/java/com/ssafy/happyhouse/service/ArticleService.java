package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.dto.ArticleDto;
import com.ssafy.happyhouse.dto.PageBean;
import com.ssafy.happyhouse.util.PageNavigation;

public interface ArticleService {
	void crawlingArticle(List<String> urls, String domain);
	void getUrls(String url, String domain);
	List<ArticleDto> searchAll(Map<String, String> map);
	PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
