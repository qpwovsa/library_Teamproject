package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MainService;
import com.example.demo.vo.BookregiVo;
import com.example.demo.vo.GongjiVo;

@Controller
public class MainController {

	@Autowired
	@Qualifier("main")
	private MainService service;

	@RequestMapping("/")
	public String home() {
		return "redirect:/main/main";
	}

	@RequestMapping("/main/main")
	public String main(GongjiVo gvo, Model model, HttpServletRequest req) {
		return service.main(gvo, model, req);
	}

	@RequestMapping("/introduce/intro")
	public String intro() {
		return service.intro();
	}

	@RequestMapping("/introduce/location")
	public String location() {
		return service.location();
	}

	@RequestMapping("/main/cal2")
	public @ResponseBody ArrayList<HashMap> cal2(HttpServletRequest request, Model model) {
		return service.cal2(request, model);
	}

}
