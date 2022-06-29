package com.ssafy.happyhouse.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.Notice;
import com.ssafy.happyhouse.dto.User;
import com.ssafy.happyhouse.service.NoticeService;

@Controller
@RequestMapping("/")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@GetMapping("/noticeForm.do")
	public String noticeForm(Model model) {
		model.addAttribute("noticelist", service.searchAllNotice());
		return "notice";
	}
	
	@GetMapping("/noticeRegisterForm.do")
	public String noticeRegisterForm() {
		return "noticeinsert";
	}
	
	@GetMapping("/noticeUpdateForm.do/{id}")
	public String noticeUpdateForm(@PathVariable("id") int id, Model model) {
		model.addAttribute("notice", service.searchNotice(id));
		return "noticeupdate";
	}
	
	@GetMapping("/noticeDetail.do/{id}")
	public String noticeDetail(@PathVariable("id") int id, Model model) {
		model.addAttribute("notice", service.searchNotice(id));
		return "noticedetail";
	}
	
	@ResponseBody
	@PostMapping("/registNotice.do")
	public String registNotice(@RequestBody Map<String, Object> data) {
		System.out.println(data);
		Notice notice = new Notice((int) data.get("id"),
				(String) data.get("title"),
				(String) data.get("author"),
				null,
				(String) data.get("description"));
		service.registNotice(notice);
		return "success";
	}
	
	@ResponseBody
	@PutMapping("/updateNotice.do")
	public String updateNotice(@RequestBody Map<String, Object> data) {
		Notice notice = new Notice((int) data.get("id"),
				(String) data.get("title"),
				(String) data.get("author"),
				null,
				(String) data.get("description"));
		//System.out.println(data);
		service.updateNotice(notice);
		return "success";
	}
	
	
	@ResponseBody
	@DeleteMapping("/deleteNotice.do/{id}")
	public String delete(@PathVariable("id") int id) {
		service.deleteNotice(id);
		return "success";
	}
}
