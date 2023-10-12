package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.GongjiService;
import com.example.demo.vo.GongjiVo;

@Controller
public class GongjiController {

	@Autowired
	@Qualifier("gs")
	private GongjiService service;

	@RequestMapping("/gongji/list")
	public String list(Model model, HttpServletRequest request, GongjiVo gvo) {
		return service.list(model, request, gvo);
	}

	@RequestMapping("/gongji/write")
	public String write() {
		return service.write();
	}

	@RequestMapping("/gongji/writeOk")
	public String writeOk(GongjiVo gvo) {
		return service.writeOk(gvo);
	}

	@RequestMapping("/gongji/readnum")
	public String readnum(HttpServletRequest req, Model model) {
		return service.readnum(req, model);
	}

	@RequestMapping("/gongji/content")
	public String content(GongjiVo gvo, Model model, HttpServletRequest request) {

		return service.content(gvo, model, request);

	}

	@RequestMapping("/gongji/delete")
	public String delete(GongjiVo gvo, HttpServletRequest request) {
		return service.delete(gvo, request);
	}

	@RequestMapping("/gongji/update")
	public String update(GongjiVo gvo, Model model, HttpServletRequest request) {
		return service.update(gvo, model, request);
	}

	@RequestMapping("/gongji/updateOk")
	public String updateOk(GongjiVo gvo, HttpServletRequest request) {
		return service.updateOk(gvo, request);
	}
}
