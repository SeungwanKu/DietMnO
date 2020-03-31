package com.spring.mno.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.mno.user.dao.UserDAO;
import com.spring.mno.user.domain.UserVO;
@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO userDAO;

	public UserDAO getUsersDAO() {
		return userDAO;
	}

	public void setUsersDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public UserVO select(UserVO userVO) {
		return userDAO.select(userVO);
	}

	@Override
	public boolean checkPw(String id, String pwd) {
		return userDAO.checkPw(id, pwd);
	}

}
