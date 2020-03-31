package com.spring.mno.user.dao;

import com.spring.mno.user.domain.UserVO;

public interface UserDAO {
	public String getTime();
	public void insertMember(UserVO vo);
	
	public UserVO selectMember(String userid);
}
