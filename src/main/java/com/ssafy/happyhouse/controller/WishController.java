package com.ssafy.happyhouse.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.Wish;
import com.ssafy.happyhouse.service.WishService;

@Controller
@RequestMapping("/")
public class WishController {

	@Autowired
	private WishService service;
	
	
	@GetMapping("/wishlist.do/{userId}")
	public String wishlist(Model model, @PathVariable("userId") String userId) {
		model.addAttribute("wishlist", service.searchAllWish(userId));
		return "wishlist";
	}
	
	@ResponseBody
	@PostMapping("/searchWish.do")
	public String searchWish(@RequestBody Map<String, Object> data) {
		Wish check = service.searchWish(new Wish(Integer.parseInt((String) data.get("houseId")), (String)data.get("userId")));
		if (check != null)
			return "success";
		else
			return "fail";
	}
	
	@ResponseBody
	@PostMapping("/registWish.do")
	public String registWish(@RequestBody Map<String, Object> data) {
		service.registWish(new Wish(Integer.parseInt((String) data.get("houseId")), (String)data.get("userId")));
		return "success";
	}
	
	@ResponseBody
	@DeleteMapping("/deleteWish.do")
	public String deleteWish(@RequestBody Map<String, Object> data) {
		service.deleteWish(new Wish(Integer.parseInt((String) data.get("houseId")), (String)data.get("userId")));
		return "success";
	}
}
