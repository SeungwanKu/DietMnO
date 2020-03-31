package com.spring.mno.user.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.mno.user.domain.UserVO;

@Repository //DAO를 스프링에 인식시키기 위해서 사용
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String GetTime = "userMapper.getTime";
	private static final String InsertMember = "userMapper.insertMember";
	private static final String SelectMember = "userMapper.selectMember";
	
	@Override
	public String getTime() {
		return sqlSession.selectOne(GetTime);
		
	}
	@Override
	public void insertMember(UserVO vo) {
		sqlSession.insert(InsertMember,vo);
	}
	@Override
	public UserVO selectMember(String userid) {
		return (UserVO)sqlSession.selectOne(SelectMember,userid);
	}
}
