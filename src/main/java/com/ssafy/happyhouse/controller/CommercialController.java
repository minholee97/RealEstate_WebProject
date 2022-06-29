package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.Commercial;
import com.ssafy.happyhouse.service.CommercialService;

@Controller
@RequestMapping("/")
public class CommercialController {
	
	@Autowired
	private CommercialService service;
	
	@ResponseBody
	@GetMapping("/commercial.do/{dongCode}/{lat}/{lng}")
	public List<Commercial> commercial(@PathVariable("dongCode") int dongCode, @PathVariable("lat") double lat, @PathVariable("lng") double lng) {
		return service.searchAllCommercial(dongCode);
	}
	
	
}
