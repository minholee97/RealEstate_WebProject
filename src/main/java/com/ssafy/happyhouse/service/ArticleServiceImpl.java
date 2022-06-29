package com.ssafy.happyhouse.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.ArticleDao;
import com.ssafy.happyhouse.dto.ArticleDto;
import com.ssafy.happyhouse.dto.PageBean;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Autowired
	ArticleDao articleDao;

	@Override
	public void crawlingArticle(List<String> urls, String domain) {
		StringBuilder sb;
		Document doc = null;
		String title, content, date;
		ArticleDto tempArticle = articleDao.getMaxDate(domain);
		String mdate = tempArticle == null ? "0" : tempArticle.getRegdate();
		List<ArticleDto> list = new ArrayList<ArticleDto>();
		String articlePattern = "<br>(.+?\\..*){1,}";

		for (int i = 0, end = urls.size(); i < end; i++) {
			sb = new StringBuilder();
			try {
				String url = urls.get(i);
				if (domain.equals("daum")) {
					url = "https://realestate.daum.net".concat(url);
				}
				doc = Jsoup.connect(url).get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (domain.equals("naver"))
				date = doc.select(".media_end_head_info_datestamp_time._ARTICLE_DATE_TIME").attr("data-date-time")
						.toString();
			else {
				String[] tmp = doc.select("#mCenter>.wrap_tit>.wrap_tools>.info>.draw + .time").text().split(" ");
				date = new StringBuilder().append(tmp[0]).append(" ").append(tmp[1]).toString();
			}
			if (date.compareTo(mdate) <= 0) {
				continue;
			}
			if (domain.equals("naver"))
				title = doc.select(".media_end_head_title>.media_end_head_headline").text().toString();
			else {
				title = doc.select("#mCenter>.wrap_tit>.tit_account").text().toString();
			}
			if (domain.equals("naver")) {
				Pattern pt = Pattern.compile(articlePattern);
				Elements els = doc.select("#dic_area");
				String temp = doc.select("#dic_area").toString();
				Matcher mat = pt.matcher(temp);
				while (mat.find()) {
					sb.append(mat.group().replace("<br>", "").replaceAll("(<([^>]+)>)", "")).append("\n");
				}
				content = sb.toString();
			} else {
				content = doc.select("#dmcfContents>section p").text();
			}
			ArticleDto ad = new ArticleDto();
			ad.setTitle(title);
			ad.setContent(content);
			ad.setRegdate(date);
			ad.setDomain(domain);
			list.add(ad);
		}
		if (list.size() > 0)
			articleDao.crawlingArticle(list);
	}

	public void getUrls(String url, String domain) {
		List<String> res = new ArrayList<String>();
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (domain.compareTo("naver") == 0) {
			Elements tmp = doc.select("#main_content dt.photo>a");
			for (Element element : tmp) {
				res.add(element.attr("href"));
			}
		} else {
			Elements tmp = doc.select("#live>.list_live>li>.cont>.tit>a");
			for (Element element : tmp) {
				res.add(element.attr("href"));
			}
		}
		crawlingArticle(res, domain);
	}

	@Override
	public List<ArticleDto> searchAll(Map<String, String> map) {
		Map<String, Object> param = new HashMap<String, Object>();
		String pg = map.get("pgpg");
		System.out.println("pg>>>>>>>>>>>>>>>>>>" + pg);
		if(pg == null || pg.length() == 0)
			pg="1";
		int currentPage = Integer.parseInt(pg);
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		String key = map.get("key");
		String word = map.get("word");
		param.put("start", start);
		param.put("spp", sizePerPage);
		param.put("key", key);
		param.put("word", word);
		System.out.println("param>>>>>>>>>>>>>>>>>>>>>>>>>>" + param);
		return articleDao.searchAll(param);
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		PageNavigation pageNavigation = new PageNavigation();

		int naviSize = 10;
		System.out.println("pageNavigation >>>>>>>>>>>>>" + map);
		String pg = map.get("pgpg");
		if (pg == null || pg.length() == 0)
			pg = "1";
		int currentPage = Integer.parseInt(pg);
		int sizePerPage = Integer.parseInt(map.get("spp"));
		
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = articleDao.getTotalCount(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		System.out.println("currentPage" + currentPage);
		System.out.println("naviSize" + naviSize);
		System.out.println("totalCount" +totalCount );
		System.out.println("sizePerPage" + sizePerPage);
		System.out.println("totalPageCount" + totalPageCount);
		return pageNavigation;
	}
}
