package com.ssafy.happyhouse.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.User;

@Mapper
public interface UserDao {
	public User login(HashMap<String, String> input);
	public void regist(User user);
	public List<User> searchAll();
	public void delete(String id);
	public void update(User user);
	public User checkId(String id);
	public User checkInfo(String id, String email, String phone);
	public void updatePassword(String id, String pass);
}
