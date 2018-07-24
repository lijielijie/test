package com.service;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.entity.User;

@Service("userService")
public class UserService{
	@Resource  
    private UserDao userDao;
	
	public User getUserById(String userId) {
		return userDao.selectByPrimaryKey(userId);
	}
	
	public User selectByName(String name) {
		return userDao.selectByName(name);
	}
	
	public User checkPassword(String name, String password) {
		return userDao.checkPassword(name,password);
	}

}
