package com.spring.mno.diet.dao;

import java.util.List;

import com.spring.mno.diet.domain.DietVO;

public interface DietDAO {

	// 게시판 목록
		public List<DietVO> list() throws Exception;

}
