package com.unbank.web.service;

import java.util.List;

import com.unbank.mybatis.entity.User;

public interface UserService {

	List<User> findAllUsers();

	User findById(int id);

	User findByUserName(String userName);

	void saveUser(User user);


	boolean isUserSSOUnique(String userName);

	User findBySSO(String ssoId);

	void updateUser(User user);

	void deleteUserBySSO(String ssoId);


	
	
}
