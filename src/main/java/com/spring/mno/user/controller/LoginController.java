package com.spring.mno.user.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mno.user.domain.MemberVO;
import com.spring.mno.user.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService; 
	
	@RequestMapping("/loginform")
	public ModelAndView loginform(HttpServletResponse response,HttpServletRequest request) {
		Cookie[] cookies = request.getCookies(); 
		if(cookies!=null){                                            // 
			for(int i=0; i<cookies.length; i++){                // 
				cookies[i].setMaxAge(0);                    // 
				cookies[i].setPath("/");
				response.addCookie(cookies[i]);        // 
			}
		}
		ModelAndView mav =new ModelAndView();
		mav.setViewName("loginForm");
		return mav;
	}
	
	@RequestMapping("/memberRegform")
	public ModelAndView memberReg() {
		ModelAndView mav =new ModelAndView();
		List<MemberVO> memberlist=loginService.getmembers();
		mav.addObject("memberlist",memberlist);
		mav.setViewName("memberReg");
		return mav;
	}
	
	@RequestMapping("/memberReg")
	public String addMember(MemberVO member) {
		loginService.addMember(member);
		return "redirect:/loginform";
	}
	
	@RequestMapping("/findidform")
	public ModelAndView  findid() {
		ModelAndView mav =new ModelAndView();
		List<MemberVO> memberlist=loginService.getmembers();
		mav.addObject("memberlist",memberlist);
		mav.setViewName("FindId");
		return mav;
	}
	
	@RequestMapping("/findpwform")
	public ModelAndView  findpw() {
		ModelAndView mav =new ModelAndView();
		List<MemberVO> memberlist=loginService.getmembers();
		mav.addObject("memberlist",memberlist);
		mav.setViewName("Findpw");
		return mav;
	}
	
	@RequestMapping("/login")
	public String  login(HttpServletResponse response,@RequestParam String id,@RequestParam String passwd1) {
		ModelAndView mav =new ModelAndView();
		boolean loginSuccess=loginService.login(id,passwd1,response);
		login2(loginSuccess);
		return "redirect:/login2?loginSuccess="+loginSuccess;
	}
	
	@RequestMapping("/login2")
	public ModelAndView  login2(boolean loginSuccess) {
		ModelAndView mav =new ModelAndView();
		
		if(loginSuccess) {
			mav.setViewName("home");			
		}
		else {			
			mav.addObject("loginSuccess",loginSuccess);
			mav.setViewName("loginForm");
		}
		return mav;
	}
	
	@RequestMapping("/memberinfo")
	public ModelAndView memberinfo(@RequestParam String id) {
		ModelAndView mav =new ModelAndView();
		MemberVO member=loginService.memberinfo(id);
		mav.addObject("member",member);
		mav.setViewName("Memberinfo");
		return mav;
	}
	
	@RequestMapping("/updateform")
	public ModelAndView updateform(@RequestParam String id) {
		ModelAndView mav=new ModelAndView();
		MemberVO member=loginService.memberinfo(id);
		mav.addObject("member",member);
		mav.setViewName("updateForm");
		return mav;
	}
	
	@RequestMapping(value = "/update")
	public String modifyMember(MemberVO member) {
		loginService.modifyMember(member);
		return "redirect:/memberinfo?id="+member.getId();
	}
}
