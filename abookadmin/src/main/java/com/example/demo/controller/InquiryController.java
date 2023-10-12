package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.InquiryService;
import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.MtmVo;

@Controller
public class InquiryController {

	@Autowired
	@Qualifier("is")
	private InquiryService service;

	@RequestMapping("/inquiry/list")
	public String list(HttpServletRequest req, Model model, HttpSession ss) {
		return service.list(req, model, ss);
	}

	@RequestMapping("/inquiry/content")
	public String content(HttpServletRequest req, Model model) {
		return service.content(req, model);
	}

	@RequestMapping("/inquiry/writeOk")
	public String writeOk(MtmVo mvo, HttpServletRequest req) {
		return service.writeOk(mvo, req);
	}

	@RequestMapping("/inquiry/updateOk")
	public String updateOk(MtmVo mvo, HttpServletRequest req) {
		return service.updateOK(mvo, req);
	}

}