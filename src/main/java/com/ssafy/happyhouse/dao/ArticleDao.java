package com.ssafy.happyhouse.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.ArticleDto;
import com.ssafy.happyhouse.dto.PageBean;
@Mapper
public interface ArticleDao {
	List<ArticleDto> searchAll(Map<String, Object> map);
	void crawlingArticle(List<ArticleDto> list);
	ArticleDto getMaxDate(String domain);
	int getTotalCount(Map<String, String> map) throws Exception;
}
