package com.spring.mno.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mno.user.domain.UserVO;
import com.spring.mno.user.service.UserService;
@Controller
public class UserLoginController {
	@Inject
	private UserService userService;

	// 로그인 페이지로 이동
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(UserVO userVO) {
		return "login";
	}

	// 로그인 처리 : HttpSession을 사용
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(UserVO userVO, HttpSession session, RedirectAttributes rttr, Model model) {
		// 비밀번호 처리
		boolean flag = userService.checkPw(userVO.getId(), userVO.getPwd());

		if(flag) {
			UserVO user = userService.select(userVO);
			session.setAttribute("user", user);
			session.setAttribute("id", user.getId());
			return "redirect:/community/list";
		} else {
			rttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다");
			return "redirect:/login";
		}

	}

	// 로그아웃 처리 : invalidate() 사용
	@RequestMapping(value="/logout")
	public String logout(UserVO userVO, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/login";
	}
}

