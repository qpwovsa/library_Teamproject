package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.BookRequestService;
import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.MemberVo;

@Controller
public class BookRequestController {

	@Autowired
	@Qualifier("brs")
	private BookRequestService service;

	@RequestMapping("/bookrequest/requestwrite")
	public String requestwrite() {
		return service.requestwrite();
	}

	@RequestMapping("/bookrequest/requestwrite_ok")
	public String requestwrite_ok(HttpSession session, BookRequestVo brvo, HttpServletRequest request) {
		return service.requestwrite_ok(session, brvo, request);
	}

	@RequestMapping("/bookrequest/rlist")
	public String rlist(Model model, HttpServletRequest request, BookRequestVo brvo, HttpSession session) {
		return service.rlist(model, request, brvo, session);
	}

	@RequestMapping("/bookrequest/rcontent")
	public String rcontent(Model model, HttpServletRequest request, BookRequestVo brvo, HttpSession session) {
		return service.rcontent(model, request, brvo, session);
	}

	@RequestMapping("/bookrequest/rupdate")
	public String rupdate(HttpServletRequest request, Model model, BookRequestVo brvo, HttpSession session) {
		return service.rupdate(request, model, brvo, session);
	}

	@RequestMapping("/bookrequest/rupdate_ok")
	public String rupdate_ok(HttpServletRequest request, BookRequestVo brvo, HttpSession session) {
		return service.rupdate_ok(request, brvo, session);
	}

	@RequestMapping("/bookrequest/delete")
	public String delete(HttpServletRequest request, HttpSession session, BookRequestVo brvo) {
		return service.delete(request, session, brvo);
	}
}
