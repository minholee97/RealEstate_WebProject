package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.ssafy.happyhouse.dto.User;
import com.ssafy.happyhouse.service.UserService;

@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	private UserService service;
	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	
	@GetMapping("/vueqna")
	public void vueqna() {
		
	}
	
	@GetMapping("/vueqna/qnalist")
	public String qnalist() {
		return "vueqna";
	}
	
	@GetMapping("/loginForm.do")
	public String loginForm() {
		return "login";
	}
	
	@GetMapping("/registerForm.do")
	public String registForm() {
		return "register";
	}
	
	@GetMapping("/newPasswordForm.do/{id}")
	public String newPasswordForm(@PathVariable("id") String id, Model model) {
		model.addAttribute("target", id);
		return "newpassword";
	}
	
	@GetMapping("/aboutForm.do")
	public String aboutForm() {
		return "about";
	}
	
	@GetMapping("/usermanage.do")
	public String usermanage(Model model) {
		model.addAttribute("userlist", service.searchAll());
		return "usermanage";
	}
	
	@GetMapping("/passwordForm.do")
	public String passwordForm() {
		return "password";
	}
	
	@GetMapping("/userupdateForm.do/{id}")
	public String userupdateForm(@PathVariable("id") String id, Model model) {
		model.addAttribute("target", id);
		return "userupdate";
	}
	
	@GetMapping("/mypageForm.do")
	public String mypageForm() {
		return "mypage";
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}	
	
	// login
	@ResponseBody
	@PostMapping("/login.do")
	public String login(@RequestBody Map<String, Object> data, HttpServletRequest request) {
		HashMap<String, String> input = new HashMap<String, String>();
		input.put("id", (String) data.get("id"));
		input.put("password", (String) data.get("password"));
		User user = service.login(input);
		String result = "fail";
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			result = "success";
		}
		return result;
	}
	
	// regist
	@ResponseBody
	@PostMapping("/regist.do")
	public String regist(@RequestBody Map<String, Object> data) {
		User user = service.checkId((String) data.get("id"));
		if (user != null)
			return "dup_id";
		user = new User((String) data.get("id"),
				(String) data.get("password"),
				(String) data.get("name"),
				(String) data.get("email"),
				(String) data.get("phone"),
				(String) data.get("sido") + (String) data.get("sigugun") + (String) data.get("dong") + "00");
		service.regist(user);
		return "success";
	}
	
	@ResponseBody
	@PutMapping("/update.do")
	public String update(@RequestBody Map<String, Object> data) {
		User user = new User((String) data.get("id"),
				(String) data.get("password"),
				(String) data.get("name"),
				(String) data.get("email"),
				(String) data.get("phone"),
				(String) data.get("sido") + (String) data.get("sigugun") + (String) data.get("dong") + "00");
		service.update(user);
		return "success";
	}
	
	@ResponseBody
	@DeleteMapping("/delete.do/{id}")
	public String delete(@PathVariable("id") String id) {
		service.delete(id);
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/requestPassword.do")
	public String requestPassword(@RequestBody Map<String, Object> data, HttpServletRequest request) {
		User user = service.checkInfo((String) data.get("id"), (String) data.get("email"), (String) data.get("phone"));
		String result = null;
		if (user != null) {
			result = user.getPassword();
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/updatePassword.do")
	public void updatePassword(@RequestBody Map<String, Object> data, HttpServletRequest request) {
		service.updatePassword((String) data.get("id"), (String) data.get("pass"));
	}
	
}
