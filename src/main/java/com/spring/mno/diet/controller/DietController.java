package com.spring.mno.diet.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.diet.domain.DietVO;
import com.spring.mno.diet.service.DietService;

@Controller
@RequestMapping("/diet/*")
public class DietController {
	@Inject
	private DietService service;

	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		List<DietVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

	
}
