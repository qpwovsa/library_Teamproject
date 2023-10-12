package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.MypageService;

@Controller
public class MyPageController {

	@Autowired
	@Qualifier("ms")
	private MypageService service;

	@RequestMapping("/mypage/checkReserveSeat")
	public String checkReserveSeat(HttpSession ss, Model model, HttpServletRequest req) {
		return service.checkReserveSeat(ss, model, req);
	}

	@RequestMapping("/mypage/cancelSeat")
	public String cancelSeat(HttpServletRequest req, HttpSession ss) {
		return service.cancelSeat(req, ss);
	}

	@RequestMapping("/mypage/bookreserve")
	public String bookreserve(Model model, HttpSession session, HttpServletRequest req) {
		return service.bookreserve(model, session, req);
	}

	@RequestMapping("/mypage/brsvCancel")
	public String brsvCancel(HttpServletRequest request) {
		return service.brsvCancel(request);
	}

	@RequestMapping("/mypage/giganUpdate")
	public String giganUpdate(HttpServletRequest request) {
		return service.giganUpdate(request);
	}

	@RequestMapping("/mypage/returnOk")
	public String returnOk(HttpServletRequest request) {
		return service.returnOk(request);
	}

	@RequestMapping("/mypage/loanlist")
	public String loanlist(HttpSession session, Model model, HttpServletRequest request) {
		return service.loanlist(session, model, request);
	}

	@RequestMapping("/mypage/myjjim")
	public String myjjim(HttpSession ss, Model model, HttpServletRequest req) {
		return service.myjjim(ss, model, req);
	}

	@RequestMapping("/mypage/myinquiry")
	public String myinquiry(HttpSession ss, Model model, HttpServletRequest req) {
		return service.myinquiry(ss, model, req);
	}
}
