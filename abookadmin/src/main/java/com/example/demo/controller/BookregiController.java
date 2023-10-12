package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BookregiService;
import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.BookregiVo;

@Controller
public class BookregiController {

	@Autowired
	@Qualifier("br")
	private BookregiService service;

	@RequestMapping("/")
	public String home() {
		return "redirect:/bookregi/list";
	}

	@RequestMapping("/bookregi/list")
	public String list(Model model, HttpServletRequest request) {
		return service.list(model, request);
	}

	@RequestMapping("/bookregi/write")
	public String write(HttpServletRequest request, Model model) {
		return service.write(request, model);
	}

	@RequestMapping("/bookregi/write_ok")
	public String write_ok(BookregiVo bvo, HttpServletRequest request, BookRequestVo brvo) {
		return service.write_ok(bvo, request, brvo);
	}

	@RequestMapping("/bookregi/content")
	public String content(BookregiVo bvo, HttpServletRequest request, Model model) {
		return service.content(bvo, request, model);
	}

	@RequestMapping("/bookregi/add")
	public String add(HttpServletRequest request) {
		return service.add(request);
	}

	@RequestMapping("/bookregi/del")
	public String del(HttpServletRequest request) {
		return service.del(request);
	}

}
