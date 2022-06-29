package com.ssafy.happyhouse.service;

import java.util.HashMap;
import java.util.List;

import com.ssafy.happyhouse.dto.User;

public interface UserService {
	public User login(HashMap<String, String> input);
	public void regist(User user);
	public List<User> searchAll();
	public void delete(String id);
	public void update(User user);
	public User checkId(String id);
	public User checkInfo(String id, String email, String phone);
	public void updatePassword(String id, String pass);
}



