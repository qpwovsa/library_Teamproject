package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;

	@RequestMapping("/member/member")
	public String memeber(Model model, HttpServletRequest request) {
		return service.member(model, request);
	}

	@RequestMapping("/member/memberBan")
	public String memberBan(Model model, HttpServletRequest request) {
		return service.memberBan(model, request);
	}

	@RequestMapping("/member/detail")
	public String detail(Model model, HttpServletRequest req) {
		return service.detail(model, req);
	}

	@RequestMapping("/member/banOk")
	public String banOk(HttpServletRequest req) {
		return service.banOk(req);
	}

	@RequestMapping("/member/unsusBan")
	public String unsusBan(HttpServletRequest req) {
		return service.unsusBan(req);
	}
}
