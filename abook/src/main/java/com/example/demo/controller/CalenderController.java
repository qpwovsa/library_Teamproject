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

import com.example.demo.service.CalenderService;

@Controller
public class CalenderController {

	@Autowired
	@Qualifier("cc")
	private CalenderService service;

	@RequestMapping("/calender/calenderTab")
	public String CalenderTab() {
		return "/calender/calenderTab";
	}

	@RequestMapping("/calender/cal2")
	public @ResponseBody ArrayList<HashMap> cal2(HttpServletRequest request, Model model) {
		return service.cal2(request, model);
	}

	@RequestMapping("/calender/calenderMain")
	public String calenderMain() {
		return "/calender/calenderMain";
	}
}
