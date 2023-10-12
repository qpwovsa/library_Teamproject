package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.BreserveService;
import com.example.demo.vo.BookregiVo;

@Controller
public class BreserveController {

	@Autowired
	@Qualifier("brsv")
	private BreserveService service;

	@RequestMapping("/breserve/list")
	public String list(Model model, BookregiVo bvo, HttpServletRequest request) {
		return service.list(model, bvo, request);
	}

	@RequestMapping("/breserve/content")
	public String content(HttpServletRequest request, Model model, HttpSession ss) {
		return service.content(request, model, ss);
	}

	@RequestMapping("/breserve/bresOk")
	public String bresOk(HttpSession session, HttpServletRequest request, Model model) {
		return service.bresOk(session, request, model);
	}

	@RequestMapping("/breserve/addjjim")
	public @ResponseBody String addjjim(HttpServletRequest req, HttpSession ss) {
		return service.addjjim(req, ss);
	}

	@RequestMapping("/breserve/deljjim")
	public @ResponseBody String deljjim(HttpServletRequest req, HttpSession ss) {
		return service.deljjim(req, ss);
	}

}
