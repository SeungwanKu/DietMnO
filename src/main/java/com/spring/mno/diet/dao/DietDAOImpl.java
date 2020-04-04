package com.spring.mno.diet.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.diet.domain.DietVO;

@Repository
public class DietDAOImpl implements DietDAO {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.spring.mno.mappers.diet";

	@Override
	public List<DietVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".list");
	}
}
