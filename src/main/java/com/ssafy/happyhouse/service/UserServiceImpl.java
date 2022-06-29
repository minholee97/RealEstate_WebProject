package com.ssafy.happyhouse.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.UserDao;
import com.ssafy.happyhouse.dto.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao dao;
	
	public User login(HashMap<String, String> input) {
		return dao.login(input);
	}
	public void regist(User user) {
		dao.regist(user);
	}
	public List<User> searchAll() {
		return dao.searchAll();
	}
	public void delete(String id) {
		dao.delete(id);
	}
	public void update(User user) {
		dao.update(user);
	}
	public User checkId(String id) {
		return dao.checkId(id);
	}
	public User checkInfo(String id, String email, String phone) {
		return dao.checkInfo(id, email, phone);
	}
	
	public void updatePassword(String id, String pass) {
		dao.updatePassword(id, pass);
	}
}
