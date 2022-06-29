package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.DealInfoDto;
import com.ssafy.happyhouse.dto.Wish;
import com.ssafy.happyhouse.service.DealInfoService;
import com.ssafy.happyhouse.util.PageNavigation;

@Controller
@RequestMapping("/deal")
public class DealInfoController {
	
	@Autowired
	private DealInfoService dealInfoService;
	
	@PostMapping("/search")
	String showSearch1() {
		System.out.println("showSearch1 실행");
		return "/deal/list?pg=1&type=&dongcode=";
	}
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam Map<String, String> map) throws Exception {
		ModelAndView mav = new ModelAndView();

		String spp = map.get("spp"); // size per page (페이지당 글갯수)
		map.put("spp", spp != null ? spp : "10");
		List<DealInfoDto> list = dealInfoService.listDealInfo(map);
		PageNavigation pageNavigation = dealInfoService.makePageNavigation(map);
		mav.addObject("houselist", list);
		mav.addObject("navigation", pageNavigation);
		mav.addObject("dealtype", map.get("dealtype"));
		mav.addObject("dongcode", map.get("dongcode"));
		mav.setViewName("search");
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/searchDealInfo.do")
	public DealInfoDto searchDealInfo(@RequestBody Map<String, Object> data) throws Exception {
		List<DealInfoDto> res = dealInfoService.searchDealInfo((int) data.get("no"));
		return res.get(0);
	}
	
}
