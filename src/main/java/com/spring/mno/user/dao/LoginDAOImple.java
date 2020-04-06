package com.spring.mno.user.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mno.user.domain.MemberVO;


@Repository
public class LoginDAOImple implements LoginDAO {
	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.spring.mno.mappers.community";
	@Override
	public List<MemberVO> getMembers() {
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		ArrayList<MemberVO> memberList = memberMapper.getMembers();
//		return memberList;
		return sqlSession.selectList(namespace+".getMembers");
	}

	@Override
	public void insertMember(MemberVO member) {
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		memberMapper.insertMember(member);
	}

	@Override
	public MemberVO memberinfo(String id) {
		
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO member = /*memberMapper.getmember(id);*/ null;
		return member;
	}

	@Override
	public void updateMember(MemberVO member) {
	
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		memberMapper.updateMember(member);
	}
}
