package com.spring.mno.diet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.mno.community.dao.CommunityDAO;
import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.diet.dao.DietDAO;
import com.spring.mno.diet.domain.DietVO;
@Service
public class DietServiceImpl implements DietService {
	@Inject
	private DietDAO dao;

	@Override
	public List<DietVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
}
