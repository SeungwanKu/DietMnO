package com.spring.mno.diet.service;

import java.util.List;

import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.diet.domain.DietVO;

public interface DietService {
	
	public List<DietVO> list() throws Exception;
	
}
