package com.spring.mno.user.service;

import com.spring.mno.user.domain.UserVO;

public interface UserService {
	public UserVO select(UserVO userVO);
  	public boolean checkPw(String id, String pwd);
}
