package com.unbank.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.unbank.mybatis.entity.User;
import com.unbank.mybatis.entity.UserExample;
import com.unbank.mybatis.mapper.UserMapper;
import com.unbank.web.service.UserService;

@Service
//@EnableCaching
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public List<User> findAllUsers() {
		UserExample example = new UserExample();
		return userMapper.selectByExample(example);
	}

	public User findById(int id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public User findByUserName(String userName) {
		UserExample example = new UserExample();
		example.or().andUserNameEqualTo(userName);
		List<User> users = userMapper.selectByExample(example);
		if (users.size() > 0) {
			return users.get(0);
		}
		return null;
	}

	public void saveUser(User user) {
		user.setUserPwd(passwordEncoder.encode(user.getUserPwd()));
		userMapper.insertSelective(user);
	}

	public boolean isUserSSOUnique(String ssoId) {
		UserExample example = new UserExample();
		example.or().andSsoidEqualTo(ssoId);
		List<User> users = userMapper.selectByExample(example);
		if (users.size() > 0) {
			return true;
		}
		return false;
	}

//	@Cacheable(value = "user", key = "#ssoId")
	public User findBySSO(String ssoId) {
		UserExample example = new UserExample();
		example.or().andSsoidEqualTo(ssoId);
		List<User> users = userMapper.selectByExample(example);
		if (users.size() > 0) {
			return users.get(0);
		}
		return null;
	}

	public void updateUser(User user) {
		user.setUserPwd(passwordEncoder.encode(user.getUserPwd()));
		userMapper.deleteByPrimaryKey(user.getUserId());
	}

	public void deleteUserBySSO(String ssoId) {
		UserExample example = new UserExample();
		example.or().andSsoidEqualTo(ssoId);
		userMapper.deleteByExample(example);
	}

}
