package com.example.demo.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("mems")
	private MemberService service;

	@RequestMapping("/member/member")
	public String member() {

		return service.member();
	}

	@RequestMapping("/member/useridCheck")
	public @ResponseBody int useridCheck(MemberVo mvo) {

		return service.useridCheck(mvo);
	}

	@RequestMapping("/member/memberOk")
	public String memberOk(MemberVo mvo, HttpServletRequest request) {
		return service.memberOk(mvo, request);
	}

	@RequestMapping("/member/login")
	public String login(Model model, HttpServletRequest request) {
		return service.login(model, request);
	}

	@RequestMapping("/member/loginOk")
	public String loginOk(MemberVo mvo, HttpSession session, HttpServletRequest request) {
		return service.loginOk(mvo, session, request);
	}

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}

	@RequestMapping("/member/idfind")
	public String idfind() {
		return service.idfind();
	}

	@RequestMapping("/member/idcheck")
	public @ResponseBody String idcheck(HttpServletRequest request) {
		return service.idcheck(request);
	}

	@RequestMapping("/member/pwdfind")
	public String pwdfind() {
		return service.pwdfind();
	}

	@RequestMapping("/member/pwdcheck")
	public @ResponseBody String pwdcheck(HttpServletRequest request) {
		return service.pwdcheck(request);
	}

	@RequestMapping("/member/newPwdCheck")
	public @ResponseBody String newPwdCheck(HttpServletRequest request) {
		return service.newPwdCheck(request);
	}

	@RequestMapping("/member/updatePwd")
	public String updatePwd(MemberVo mvo) {
		return service.updatePwd(mvo);
	}

	@RequestMapping("/mypage/mypage")
	public String mypage(MemberVo mvo, HttpSession ss, Model model) {
		return service.mypage(mvo, ss, model);
	}

	@RequestMapping("/mypage/mypageUpdateOk")
	public String mypageUpdateOk(MemberVo mvo, HttpSession ss, HttpServletRequest req) {
		return service.mypageUpdateOk(mvo, ss, req);
	}

}
