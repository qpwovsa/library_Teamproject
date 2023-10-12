package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BookRequestService;
import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.BookregiVo;

@Controller
public class BookRequestController {

	@Autowired
	@Qualifier("brs")
	private BookRequestService service;

	@RequestMapping("/bookrequest/hopelist")
	public String hopelist(HttpServletRequest request, BookRequestVo brvo, Model model, BookregiVo bvo) {
		return service.hopelist(request, brvo, model, bvo);
	}

	@RequestMapping("/bookrequest/cancelBrequest")
	public String cancelBrequest(HttpServletRequest req) {
		return service.cancelBrequest(req);
	}
}
