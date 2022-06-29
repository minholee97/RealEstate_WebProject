//package com.ssafy.happyhouse.controller;
//
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.ssafy.happyhouse.dto.ArticleDto;
//import com.ssafy.happyhouse.dto.PageBean;
//import com.ssafy.happyhouse.service.ArticleService;
//
//@RequestMapping("/article")
//@Controller
//public class ArticleController {
//	@Autowired
//	ArticleService articleService;
//
//	@GetMapping("/news")
//	public ModelAndView getNews() {
//		ModelAndView mav = new ModelAndView();
//		List<String> url_lst = new ArrayList<String>();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		String date = sdf.format(new Date());
//		for (int i = 1; i > 0; i--) {
//			String pgNo = String.valueOf(i);
//			String url_naver = "https://news.naver.com/main/list.naver?mode=LS2D&sid2=260&sid1=101&mid=shm&date=" + date
//					+ "&page="+pgNo;
//			String url_daum = "https://realestate.daum.net/news/all?page=" + pgNo;
////			articleService.getUrls(url_naver,"naver");
//			articleService.getUrls(url_daum,"daum");
//		}
//		mav.setViewName("index");
//		return mav;
//
//	}
//	@GetMapping("/list")
//	public String getArticleList(PageBean bean) {
//		return "/article/info?pg=1&type=&dongcode=";
//	}
//	@GetMapping("/info")
//	public ModelAndView showArticleList(PageBean bean) {
//		System.out.println(bean);
//		ModelAndView mav = new ModelAndView();
//		List<ArticleDto> lst = articleService.searchAll(bean);
//		mav.addObject("articleList", lst);
//		mav.setViewName("article");
//		return mav;
//	}
//}
package com.ssafy.happyhouse.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.ArticleDto;
import com.ssafy.happyhouse.service.ArticleService;
import com.ssafy.happyhouse.util.PageNavigation;

@Controller
public class ArticleController {
	@Autowired
	ArticleService articleService;

	@GetMapping("/article/news")
	public String getNews() {
		List<String> url_lst = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(new Date());
		for (int i = 5; i > 0; i--) {
			String pgNo = String.valueOf(i);
			String url_naver = "https://news.naver.com/main/list.naver?mode=LS2D&sid2=260&sid1=101&mid=shm&date=" + date
					+ "&page="+pgNo;
			String url_daum = "https://realestate.daum.net/news/all?page=" + pgNo;
			articleService.getUrls(url_daum,"daum");
			articleService.getUrls(url_naver,"naver");
		}
		//mav.setViewName("index");
		return "redirect:/";

	}
	@GetMapping("/article/info")
	public ModelAndView showArticleList(@RequestParam Map<String, String> map)throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("map>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" +map);
		String spp = map.get("spp"); // size per page (페이지당 글갯수)
		map.put("spp", spp != null ? spp : "10");
		List<ArticleDto> lst = articleService.searchAll(map);
		PageNavigation pageNavigation = articleService.makePageNavigation(map);
		mav.addObject("articleList", lst);
		mav.addObject("navigation", pageNavigation);
		mav.addObject("key",map.get("key"));
		mav.addObject("word",map.get("word"));
		mav.setViewName("article");
		return mav;
	}
}
